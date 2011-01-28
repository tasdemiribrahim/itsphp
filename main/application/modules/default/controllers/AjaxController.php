<?php
class AjaxController extends Zend_Controller_Action
{  
	public function preDispatch()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
	}

	public function takvimAction()
	{
		if(isset($_REQUEST['action']))
		{
			session_start();
			if(!isset($_SESSION['calendar'])) $_SESSION['calendar']=array('ids'=>0,);
			switch($_REQUEST['action'])
			{
				case 'save':
					$start_date=(int)$_REQUEST['start'];
					$data=array('title'=>$_REQUEST['title'],'body' =>$_REQUEST['body'],'start'=>date('c',$start_date),'end' =>date('c',(int)$_REQUEST['end']));
					$id=(int)$_REQUEST['id'];
					if($id && isset($_SESSION['calendar'][$id]))
					{
						if(isset($_SESSION['calendar'][$id]['recurring']))
							$data['recurring']=$_SESSION['calendar'][$id]['recurring'];
						$_SESSION['calendar'][$id]=$data;
					}
					else
					{
						$id=++$_SESSION['calendar']['ids'];
						$rec=(int)$_REQUEST['recurring'];
						if($rec) $data['recurring']=$id;
						$_SESSION['calendar'][$id]=$data;
						if($rec && $rec==1 || $rec==7)
						{
							list($y,$m,$d)=explode('-',$_REQUEST['recurring_end']);
							$length=(int)$_REQUEST['end']-$start_date;
							$end_date=mktime(23,59,59,$m,$d,$y);
							$step=3600*24*$rec;
							for($j=1,$i=$start_date+$step;$i<$end_date;$j++,$i+=$step)
							{
								$data['start']=date('c',$i);
								$data['end']=date('c',$i+$length);
								$nextid=++$_SESSION['calendar']['ids'];
								$_SESSION['calendar'][$nextid]=$data;
							}
						}
					}
					echo 1;
					exit;
				case 'move':
					$id=(int)$_REQUEST['id'];
					if(!isset($_SESSION['calendar'][$id]))exit;
					$_SESSION['calendar'][$id]['start']=date('c',(int)$_REQUEST['start']);
					$_SESSION['calendar'][$id]['end']=date('c',(int)$_REQUEST['end']);
					exit;
				case 'get_event':
					$id=(int)$_REQUEST['id'];
					if(!isset($_SESSION['calendar'][$id]))exit;
					$t=$_SESSION['calendar'][$id];
					$t['id']=$id;
					echo json_encode($t);
					exit;
				case 'delete_event':
					$id=(int)$_REQUEST['id'];
					if(!isset($_SESSION['calendar'][$id])) exit;
					$d=$_SESSION['calendar'][$id];
					if((int)$_REQUEST['recurrences'])
					{
						$start=$d['start'];
						$r=$d['recurring'];
						for($i=1;$i<$_SESSION['calendar']['ids']+1;++$i)
							if(isset($_SESSION['calendar'][$i]) && isset($_SESSION['calendar'][$i]['recurring']) && $_SESSION['calendar'][$i]['recurring']==$r && strcmp($_SESSION['calendar'][$i]['start'],$start)>0)
								unset($_SESSION['calendar'][$i]);
					}
					unset($_SESSION['calendar'][$id]);
					echo 1;
					exit;
			}
		}

		$arr=array();
		$start=date("md",$_REQUEST['start']);
		$end=date("md",$_REQUEST['end']);
		$q = Doctrine_Query::create()->from('main_models_Aa a')->leftJoin("a.Detay d");
		$tarihler=$q->fetchArray();
		$i=0;
		$mesajlar=array();
		foreach($tarihler as $tarih)
		{
			if($tarih['Detay']['olum']=="0000-00-00")
			{
				$d=getFark($tarih['Detay']['dogum']);
				if((($end-$d)<7 && ($end-$d)>0) || (($d-$start)<7 && ($d-$start)>0))
				{
					if(!isset($mesajlar[getGun($tarih['Detay']['dogum'])])) $mesajlar[getGun($tarih['Detay']['dogum'])]="";
					$mesajlar[getGun($tarih['Detay']['dogum'])].=$tarih['aileAd']."'in ".yas($tarih['Detay']['dogum']).". yaş günü.<br /><br/>";
				}
			}
			else
			{ 
				$d=getFark($tarih['Detay']['olum']);
				if((($end-$d)<7 && ($end-$d)>0) || (($d-$start)<7 && ($d-$start)>0))
				{
					if(!isset($mesajlar[getGun($tarih['Detay']['olum'])])) $mesajlar[getGun($tarih['Detay']['olum'])]="";
					$mesajlar[getGun($tarih['Detay']['olum'])].=$tarih['aileAd']."'in ".yas($tarih['Detay']['olum']).". ölüm yıldönümü.<br /><br />";
				}
			}
		}
		foreach($mesajlar as $key=>$mesaj)
			$arr[]=array('id'=>$i++,'title'=>$mesaj,'start'=>$key."T08:00:00+02:00",'end' =>$key."T18:00:00+02:00");
		unset($tarihler,$mesajlar);
		header('Content-type: application/json');
		echo '{"events":'.json_encode($arr).'}';
		exit;
	}

	public function appreciateAction()
	{
		$url=temizURL($_GET['url']);
		if(!$url)
			exit;
		$hash = md5($url);
		$ip = sprintf('%u',ip2long($_SERVER['REMOTE_ADDR']));
		$status=array('status'=>1);
		try
		{
			$conn = Doctrine_Manager::getInstance()->getCurrentConnection();
			$conn->beginTransaction();
			
			$page = Doctrine::getTable('main_models_Appages')->find($hash);
			if($page)
				$page->ap=$page->ap+1;
			else
			{
				$page = new main_models_Appages();
				$page->hash = $hash;
				$page->url = $url;
				$page->ap=1;
			}
			$page->save();
	
			$vote = new main_models_Apvotes();
			$vote->ip =$ip;
			$vote->pageid = $page->id;
			$vote->save();			
			
			$conn->commit();
		}  
		catch (Doctrine_Connection_Exception $e) 
		{
			throw new Exception('begenilemedi-Code :'.$e->getPortableCode().'-Message : ' . $e->getPortableMessage());
			$conn->rollback();
			$status= array('status'=>0);
		}
		catch (Exception $e) 	
		{	
			throw new Exception('begenilemedi-'.$e->getMessage());
			$conn->rollback();
			$status= array('status'=>0);
		}
		header('Content-type: application/json');
		echo json_encode($status);
	}
	
	public function hotspotAction()
	{
		if(isset($_GET['arh']))
		{
			$hot = new main_models_Aarh();
			$hot->src = temizURL($_GET['arh']);
			$hot->val = ucwords(temizYazi($_GET['val']));
			$hot->spot= temizSayi($_GET['id']);
			$hot->x=temizSayi($_GET['x']);
			$hot->y=temizSayi($_GET['y']);
			$hot->save();
			echo $hot->id;
		}
		elseif(isset($_GET['arr']))
		{
			$q = Doctrine_Query::create()->delete('main_models_Aarh h')->where("h.src=? AND h.spot=?",array(temizURL($_GET['arr']),temizSayi($_GET['id'])));
			echo $q->execute();
		}
		elseif(isset($_GET['get']))
		{
			$q = Doctrine_Query::create()->from('main_models_Aarh h')->where('h.src=?', temizURL($_GET['get']))->orderby("h.spot DESC");
			$results = $q->fetchArray();
			header('Content-type: application/json');
			echo json_encode($results);
		}
	
	}
	
	public function aileAction()
	{
		if(!isset($_FILES['uploadResim']['name']))
			include_once "main/helpers/ajax_guvenli.php";
		
		if(isset($_GET['term']))
		{
			$client=Zend_Registry::get('client');
			$view = $client->group(true)->startkey(temizYazi($_GET['term']))->endkey(temizYazi($_GET['term'])."\u9999")->getView('itsphp','ara');
			$response = array();
			$i=0;
			foreach($view->rows as $row)
			{
				$response[$i]['value'] = $row->key;
				$response[$i]['label'] = $row->key;
				$i++;
			}
			header('Content-Type: application/json');
			echo json_encode($response);
		}
		elseif(isset($_GET['getir'])) $this->selectAkraba(temizSayi($_GET['getir']));
		elseif(isset($_GET['ybkay'])) echo $this->insertAkraba(temizYazi($_GET['ybad']),temizSayi($_GET['ybe']),temizYazi($_GET['ybt']),temizYazi($_GET['ybd']),temizYazi($_GET['ybo']),temizYazi($_GET['ybes']),temizYazi($_GET['ybadres']),temizEMail($_GET['ybmail']),temizTel($_GET['ybtel']),temizYazi($_GET['ybtwit']),temizYazi($_GET['ybflic']));
		elseif(isset($_GET['ybgun'])) echo $this->updateAkraba(temizSayi($_GET['aidh']),temizYazi($_GET['ybt']),temizYazi($_GET['ybd']),temizYazi($_GET['ybo']),temizYazi($_GET['ybes']),temizYazi($_GET['ybadres']),temizEMail($_GET['ybmail']),temizTel($_GET['ybtel']),temizYazi($_GET['ybtwit']),temizYazi($_GET['ybflic']));
		elseif(isset($_GET['q']))	echo $this->searchAkraba(temizYazi($_GET['q']));
		elseif(isset($_GET['oy'])) echo $this->getRating(temizSayi($_GET['oy']));
		elseif(isset($_GET['yildiz'])) echo $this->setRating(temizSayi($_GET['id']),$_GET['yildiz']);
		elseif(isset($_FILES['uploadResim']['name'])) echo $this->_helper->imager->upload($_FILES['uploadResim']);
		elseif(isset($_GET['fileName'])) echo $this->_helper->imager->save(temizSayi($_GET['id']),temizYazi($_GET['fileName']));
		elseif(isset($_POST['acn'])) echo $this->submitComment(temizSayi($_POST['aidh']),temizYazi($_POST['acn']),temizURL($_POST['acu']),temizEMail($_POST['ace']),temizYazi($_POST['acb']));
		elseif(isset($_GET['yorum'])) echo $this->getComments(temizSayi($_GET['yorum']));
	}
	
	function selectAkraba($id)
	{
		try
		{
			if(empty($id) || $id==0 || $id==2)
				$id="11";
			$aile = Doctrine::getTable('main_models_Aad')->find($id);
		}
		catch (Exception $e){ $aile = Doctrine::getTable('main_models_Aad')->find("11"); }	
		$result =$aile->toArray();

		$client=Zend_Registry::get('client');
		try { $doc = $client->getDoc('aile'.$id); } 
		catch (Exception $e) 
		{
			if ( $e->getCode() == 404 ) 
			{
				$aile = Doctrine::getTable('main_models_Aa')->find($id); 
				$result2 =$aile->toArray();
				$this->insertAkrabaCouch($id,$result2['ad'],$result2['eid'],$result['tanim'],$result['dogum'],$result['olum'],$result['es'],$result['adres'],$result['mail'],$result['tel'],$result['twitter'],$result['flickr']);
			}
			else
				trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());
		}
		header('Content-Type: application/json');
		echo json_encode($result);
	}

	function insertAkraba($a,$e,$t,$d,$o,$es,$adres,$m,$tel,$twit,$f)
	{  	
		try 
		{	
			$conn = Doctrine_Manager::getInstance()->getCurrentConnection();
			$conn->beginTransaction();
				
			$this->_helper->cache->remove("aile"); 
			$this->_helper->cache->remove("aileDetay"); 

			$aile = new main_models_Aa();
			$aile->ad= ucwords($a);
			$aile->eid = $e;
			$aile->keyHash = NULL;
			
			$ad = new main_models_Aad();
			
			$ts = new DateTime($d);
			$d=$ts->format("Y-m-d");
			$ts = new DateTime($o=="" ? "0000-00-00" : $o);
			$o=$ts->format("Y-m-d");

			$ad->tanim = $t;
			$ad->dogum = $d;
			$ad->olum = $o;
			$ad->es = ucwords($es);
			$ad->adres = $adres;
			$ad->mail = $m;
			$ad->tel = $tel;
			$ad->twitter = $twit;
			$ad->flickr = $flic;
			$aile->Detay=$ad;
			
			$ao = new main_models_Aao();
			$ao->tp = 0;
			$ao->on = 0;
			$ao->to=0;
			$ao->ort=0;
			$aile->Oy=$ao;
			$aile->save();
			
			$item = new main_models_Aar();
			$item->title= "$a Aile ağacına eklendi";
			$item->description = "$d doğumlu $a - ".$aile->id.' numarasıyla aile ağacına eklendi.';
			$item->link = getSiteName().'main/aile?id='.$aile->id;
			$item->save();
				
			$conn->commit();

			$this->insertAkrabaCouch($aile->id,$a,$e,$t,$d,$o,$es,$adres,$m,$tel,$twit,$flic);
			return 1;
		}  
		catch (Doctrine_Connection_Exception $e) 
		{
			$conn->rollback();
			trigger_error('aile ağacına eklenemedi-Code :'.$e->getPortableCode().'-Message : ' . $e->getPortableMessage());
			return '0-aile ağacına eklenemedi-Code :'.$e->getPortableCode().'-Message : ' . $e->getPortableMessage();	
		}
		catch (Exception $e) 	
		{	
			$conn->rollback();
			trigger_error('aile ağacına eklenemedi-'.$e->getMessage());
			return '0-aile ağacına eklenemedi-'.$e->getMessage();	
		}
	}

	function insertAkrabaCouch($id,$ad,$ebeveyn,$tanim,$dogum,$olum,$es,$adres,$mail,$tel,$twitter,$flickr)
	{
		$client=Zend_Registry::get('client');
		$birey = new stdClass();
		$birey->_id = "aile".$id;
		$birey->ad = $ad;
		$birey->ebeveyn = $ebeveyn;
		$birey->tanim = $tanim;
		$birey->dogum = $dogum;
		$birey->olum = $olum;
		$birey->es = $es;
		$birey->adres = $adres;
		$birey->mail = $mail;
		$birey->tel = $tel;
		$birey->twitter = $twitter;
		$birey->flickr = $flickr;
		try { $response = $client->storeDoc($birey); } 
		catch (Exception $e) {trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode()); }
	}

	function updateAkraba($id,$t,$d,$o,$es,$adres,$mail,$tel,$twitter,$flickr)
	{
		try{
			$this->_helper->cache->remove("aile"); 
			$this->_helper->cache->remove("aileDetay"); 
			
			$item = Doctrine::getTable('main_models_Aad')->find($id);
			$item->tanim =$t;

			$ts = new DateTime($d);
			$d=$ts->format("Y-m-d");
			$ts = new DateTime($o=="" ? "0000-00-00" : $o);
			$o=$ts->format("Y-m-d");

			$item->dogum =$d;
			$item->olum =$o;
			$item->es =ucwords($es);
			$item->adres =$adres;
			$item->mail =$mail;
			$item->tel =$tel;
			$item->twitter =$twitter;
			$item->flickr =$flickr;
			$item->save();

			$client=Zend_Registry::get('client');
			try { $doc = $client->getDoc('aile'.$id); } 
			catch (Exception $e) 
			{
				trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());
				return 1;
			}
			$doc->dogum = $d;
			$doc->olum =$o;
			$doc->es =ucwords($es);
			$doc->adres =$adres;
			$doc->mail =$mail;
			$doc->tel =$tel;
			$doc->twitter =$twitter;
			$doc->flickr =$flickr;
			try { $response = $client->storeDoc($doc); } 
			catch (Exception $e) 
			{
				trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());
				return 1;
			}
			return 1;
		} 
		catch (Doctrine_Connection_Exception $e) 
		{
			throw new Exception('aile ağacına güncellenemedi-Code :'.$e->getPortableCode().'-Message : ' . $e->getPortableMessage());
			return 0;	
		}
		catch (Exception $e) 
		{	
			throw new Exception('aile ağacı güncellenemedi-'.$e->getMessage());
			return 0;	
		}
	}

	function searchAkraba($a)
	{
		$bu=$mu=$edits1=$edits2=array();
		if(mb_strlen($a,'utf-8')<3)
			die($bu);
		$q = Doctrine_Core::getTable('main_models_Aa');
		/*$results = $q->search($a);
		foreach ($results as $result)
		{
			$aile = Doctrine::getTable('main_models_Aa')->find($result['id']);
			$row=$aile->toArray();
			array_push($bu,array("id"=>$row["id"],"ad"=>$row["ad"]);
		}*/
		$q = Doctrine_Query::create()->from('main_models_Aa a')->where('a.ad=?', $a);
		$row = $q->fetchOne();
		if($row)	array_push($bu,array("id"=>$row["id"],"ad"=>$row["ad"]));
		$result=$this->_helper->cache("aile","main_models_Aa"); 
		foreach($result as $word) 
		{
			$word = strtolower($word["ad"]);
			if(!isset($dict[$word])) 
				$dict[$word] = 0;
			$dict[$word] += 1;
		} 
		unset($result);
		$word = strtolower($a);
		foreach($dict as $dictWord => $count) 
		{
			$dist = levenshtein($word, $dictWord); 
			if($dist == 1) 
				$edits1[$dictWord] = $count;
			else if($dist == 2) 
				$edits2[$dictWord] = $count;
		}
		if(count($edits1)) foreach ($edits1 as $anahtar=>$deger)
		{
			$q = Doctrine_Query::create()->from('main_models_Aa a')->where('a.ad=?', $anahtar);
			$row=$q->fetchOne();
			array_push($mu,array("id"=>$row["id"],"ad"=>$row["ad"]));
		}
		if(count($edits2)) foreach ($edits2 as $anahtar=>$deger)
		{
			$q = Doctrine_Query::create()->from('main_models_Aa a')->where('a.ad=?', $anahtar);
			$row=$q->fetchOne();
			array_push($mu,array("id"=>$row["id"],"ad"=>$row["ad"]));
		}
		unset($dict);
		header('Content-Type: application/json');
		return json_encode(array("bu"=>$bu,"mu"=>$mu));
	}

	function getRating($oy)
	{
		$aile = Doctrine::getTable('main_models_Aao')->find($oy);
		header('Content-Type: application/json');
		return json_encode($aile->toArray());
	}

	function setRating($id,$yildiz)
	{
		preg_match('/star_([1-5]{1})/', $yildiz, $match);
		$vote = $match[1];
		$item = Doctrine::getTable('main_models_Aao')->find($id);
		$row = $item->toArray();
		$votes= $row['to'] + 1;
		$tp = $row['tp'] + $vote;			
		$ortalama = round( $tp / $votes, 1 );
		$on = round( $ortalama );
		$item->to =$votes;
		$item->tp =$tp;
		$item->on =$on;
		$item->ort =$ortalama;
		$item->save();

		$client=Zend_Registry::get('client');
		try { 
			$doc = $client->getDoc('aile'.$id);
			$doc->oy["to"] = $votes;
			$doc->oy["tp"] = $tp;
			$doc->oy["on"] = $on;
			$doc->oy["ort"] = $ortalama;
			try { $response = $client->storeDoc($doc); } 
			catch (Exception $e) {	trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode()); }
		} 
		catch (Exception $e) {trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());	}

		header('Content-Type: application/json');
		return json_encode(array("norm"=>$on,"votes"=>$votes,"ort"=>$ortalama));
	}

	function submitComment($id,$n,$u,$e,$b)
	{
		$dt = date('r',time());

		$client=Zend_Registry::get('client');
		try { 
			$doc = $client->getDoc('aile'.$id);
			$yorum = new stdClass();
			$yorum->isim = $n;
			$yorum->url = $u;
			$yorum->mail = $e;
			$yorum->body = $b;
			$yorum->zaman = $dt;
			$doc->yorumlar[] = $yorum;
			try { $response = $client->storeDoc($doc); } 
			catch (Exception $e) {	trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode()); }
		} 
		catch (Exception $e) {trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());	}

		$item = new main_models_Aay;
		$item->aileID= $id;
		$item->n = $n;
		$item->u = $u;
		$item->m = $e;
		$item->b =$b;
		$item->save();

		header('Content-Type: application/json');
		return json_encode(array('status'=>1,'html'=>markup(array("id"=>$item->id,"dt"=>$dt,"n"=>$n,"u"=>$u,"m"=>$e,"b"=>$b))));
	}
	
	function getComments($yorum)
	{
		$comments = array();
		$mesaj="";	
		$item = Doctrine_Query::create()->from('main_models_Aay a')->where("a.aileID=?",$yorum)->orderby("a.id ASC");
		$result = $item->fetchArray();
		$item->free();
		array_walk($result,create_function('&$v,$k','$v = markup($v);'));
		header('Content-Type: application/json');
		return json_encode(array("sayi"=>count($result),"yorumlar"=>implode("",$result)));
	}	
}

function getFark($time)
{
	$k = preg_split("/-/", $time);
	return $k[1].$k[2];
}

function getGun($time)
{
	$k = preg_split("/-/", $time);
	return (isset($_REQUEST['end']) ? date("Y",$_REQUEST['end']) : date("Y"))."-$k[1]-$k[2]";
}
