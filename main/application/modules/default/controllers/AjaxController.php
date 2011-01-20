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
		$q = Doctrine_Query::create()->from('main_Models_AileAgaci a')->leftJoin("a.Detay d");
		$tarihler=$q->fetchArray();
		$i=0;
		$mesajlar=array();
		foreach($tarihler as $tarih)
		{
			if($tarih['Detay']['aileOlum']=="0000-00-00")
			{
				$d=getFark($tarih['Detay']['aileDogum']);
				if((($end-$d)<7 && ($end-$d)>0) || (($d-$start)<7 && ($d-$start)>0))
				{
					if(!isset($mesajlar[getGun($tarih['Detay']['aileDogum'])])) $mesajlar[getGun($tarih['Detay']['aileDogum'])]="";
					$mesajlar[getGun($tarih['Detay']['aileDogum'])].=$tarih['aileAd']."'in ".yas($tarih['Detay']['aileDogum']).". yaş günü.<br /><br/>";
				}
			}
			else
			{ 
				$d=getFark($tarih['Detay']['aileOlum']);
				if((($end-$d)<7 && ($end-$d)>0) || (($d-$start)<7 && ($d-$start)>0))
				{
					if(!isset($mesajlar[getGun($tarih['Detay']['aileOlum'])])) $mesajlar[getGun($tarih['Detay']['aileOlum'])]="";
					$mesajlar[getGun($tarih['Detay']['aileOlum'])].=$tarih['aileAd']."'in ".yas($tarih['Detay']['aileOlum']).". ölüm yıldönümü.<br /><br />";
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
			
			$page = Doctrine::getTable('main_Models_AppreciatePages')->find($hash);
			if($page)
				$page->appreciated=$page->appreciated+1;
			else
			{
				$page = new main_Models_AppreciatePages();
				$page->hash = $hash;
				$page->url = $url;
				$page->appreciated=1;
			}
			$page->save();
	
			$vote = new main_Models_AppreciateVotes();
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
		if(isset($_GET['hotspot']))
		{
			$hot = new main_Models_Hotspot();
			$hot->src = temizURL($_GET['hotspot']);
			$hot->val = ucwords(temizYazi($_GET['val']));
			$hot->spot= temizSayi($_GET['id']);
			$hot->x=temizSayi($_GET['x']);
			$hot->y=temizSayi($_GET['y']);
			$hot->save();
			echo $hot->id;
		}
		elseif(isset($_GET['remove']))
		{
			$q = Doctrine_Query::create()->delete('main_Models_Hotspot h')->where("h.src=? AND h.spot=?",array(temizURL($_GET['remove']),temizSayi($_GET['id'])));
			echo $q->execute();
		}
		elseif(isset($_GET['get']))
		{
			$q = Doctrine_Query::create()->from('main_Models_Hotspot h')->where('h.src=?', temizURL($_GET['get']))->orderby("h.spot DESC");
			$results = $q->fetchArray();
			header('Content-type: application/json');
			echo json_encode($results);
		}
	
	}
	
	public function aileAction()
	{
		if(!isset($_FILES['uploadResim']['name']))
			include_once "main/Helpers/ajax_guvenli.php";
		
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
		elseif(isset($_GET['akrabaAd'])) $this->selectAkraba(temizSayi($_GET['akrabaAd']));
		elseif(isset($_GET['aileBireyAdEkle'])) echo $this->insertAkraba(temizYazi($_GET['aileBireyAdEkle']),temizSayi($_GET['aileBireyEbeveynPHP']),temizYazi($_GET['aileBireyTanimPHP']),temizYazi($_GET['aileBireyDogumPHP']),temizYazi($_GET['aileBireyOlumPHP']),temizYazi($_GET['aileBireyEsPHP']),temizYazi($_GET['aileBireyAdresPHP']),temizEMail($_GET['aileBireyMailPHP']),temizTel($_GET['aileBireyTelPHP']),temizEMail($_GET['aileBireyMSNPHP']),temizYazi($_GET['aileBireyTwitterPHP']),temizYazi($_GET['aileBireyFlickrPHP']));
		elseif(isset($_GET['aileBireyGuncelleIDPHP'])) echo $this->updateAkraba(temizSayi($_GET['aileBireyGuncelleIDPHP']),temizYazi($_GET['aileBireyTanimPHP']),temizYazi($_GET['aileBireyDogumPHP']),temizYazi($_GET['aileBireyOlumPHP']),temizYazi($_GET['aileBireyEsPHP']),temizYazi($_GET['aileBireyAdresPHP']),temizEMail($_GET['aileBireyMailPHP']),temizTel($_GET['aileBireyTelPHP']),temizEMail($_GET['aileBireyMSNPHP']),temizYazi($_GET['aileBireyTwitterPHP']),temizYazi($_GET['aileBireyFlickrPHP']));
		elseif(isset($_GET['aileAraAd']))	echo $this->searchAkraba(temizYazi($_GET['aileAraAd']));
		elseif(isset($_GET['ailePuanIDAl'])) echo $this->getRating(temizSayi($_GET['ailePuanIDAl']));
		elseif(isset($_GET['ailePuanlaID'])) echo $this->setRating(temizSayi($_GET['ailePuanlaID']),$_GET['yildiz']);
		elseif(isset($_FILES['uploadResim']['name'])) echo $this->_helper->imager->upload($_FILES['uploadResim']);
		elseif(isset($_GET['resimHedefAileAd'])) echo $this->_helper->imager->save(temizSayi($_GET['resimHedefAileAd']),temizYazi($_GET['fileName']));
		elseif(isset($_POST['commentName'])) echo $this->submitComment(temizSayi($_POST['aileBireyIDHidden']));
		elseif(isset($_GET['aileYorumIDAl'])) echo $this->getComments(temizSayi($_GET['aileYorumIDAl']));
	}
	
	function selectAkraba($akrabaID)
	{
		try
		{
			if(empty($akrabaID) || $akrabaID==0 || $akrabaID==2)
				$akrabaID="11";
			$aile = Doctrine::getTable('main_Models_AileAgaciDetay')->find($akrabaID);
		}
		catch (Exception $e){ $aile = Doctrine::getTable('main_Models_AileAgaciDetay')->find("11"); }	
		$result =$aile->toArray();

		$client=Zend_Registry::get('client');
		try { $doc = $client->getDoc('aile'.$akrabaID); } 
		catch (Exception $e) 
		{
			if ( $e->getCode() == 404 ) 
			{
				$aile = Doctrine::getTable('main_Models_AileAgaci')->find($akrabaID); 
				$result2 =$aile->toArray();
				$this->insertAkrabaCouch($akrabaID,$result2['aileAd'],$result2['ebeveynID'],$result['aileTanim'],$result['aileDogum'],$result['aileOlum'],$result['aileBireyEs'],$result['aileBireyAdres'],$result['aileBireyMail'],$result['aileBireyTel'],$result['aileBireyMSN'],$result['aileBireyTwitter'],$result['aileBireyFlickr']);
			}
			else
				trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());
		}
		echo $result['aileDogum']."|".$result['aileOlum']."|".$result['aileBireyEs']."|".$result['aileBireyAdres']."|".$result['aileBireyMail']."|".$result['aileBireyTel']."|".$result['aileBireyMSN']."|".$result['aileBireyTwitter']."|".$result['aileBireyFlickr']."|".$result['aileTanim'];
	}

	function insertAkraba($aileBireyAd,$aileBireyEbeveyn,$aileBireyTanim,$aileBireyDogum,$aileBireyOlum,$aileBireyEs,$aileBireyAdres,$aileBireyMail,$aileBireyTel,$aileBireyMSN,$aileBireyTwitter,$aileBireyFlickr)
	{  	
		try 
		{	
			$conn = Doctrine_Manager::getInstance()->getCurrentConnection();
			$conn->beginTransaction();
				
			$this->_helper->cache->remove("aile"); 
			$this->_helper->cache->remove("aileDetay"); 

			$aile = new main_Models_AileAgaci();
			$aile->aileAd= ucwords($aileBireyAd);
			$aile->ebeveynID = $aileBireyEbeveyn;
			$aile->keyHash = NULL;
			
			$agacDetay = new main_Models_AileAgaciDetay();
			
			$ts = new DateTime($aileBireyDogum);
			$aileBireyDogum=$ts->format("Y-m-d");
			$ts = new DateTime($aileBireyOlum=="" ? "0000-00-00" : $aileBireyOlum);
			$aileBireyOlum=$ts->format("Y-m-d");

			$agacDetay->aileTanim = $aileBireyTanim;
			$agacDetay->aileDogum = $aileBireyDogum;
			$agacDetay->aileOlum = $aileBireyOlum;
			$agacDetay->aileBireyEs = ucwords($aileBireyEs);
			$agacDetay->aileBireyAdres = $aileBireyAdres;
			$agacDetay->aileBireyMail = $aileBireyMail;
			$agacDetay->aileBireyTel = $aileBireyTel;
			$agacDetay->aileBireyMSN = $aileBireyMSN;
			$agacDetay->aileBireyTwitter = $aileBireyTwitter;
			$agacDetay->aileBireyFlickr = $aileBireyFlickr;
			$aile->Detay=$agacDetay;
			
			$agacOy = new main_Models_AileAgaciOy();
			$agacOy->toplamPuan = 0;
			$agacOy->ortNorm = 0;
			$agacOy->toplamOy=0;
			$agacOy->ort=0;
			$aile->Oy=$agacOy;
			$aile->save();
			
			$item = new main_Models_AileAgaciRssItems();
			$item->title= "$aileBireyAd Aile ağacına eklendi";
			$item->description = "$aileBireyDogum doğumlu $aileBireyAd - ".$aile->aileID.' numarasıyla aile ağacına eklendi.';
			$item->link = getSiteName().'main/aile?id='.$aile->aileID;
			$item->save();
				
			$conn->commit();

			$this->insertAkrabaCouch($aile->aileID,$aileBireyAd,$aileBireyEbeveyn,$aileBireyTanim,$aileBireyDogum,$aileBireyOlum,$aileBireyEs,$aileBireyAdres,$aileBireyMail,$aileBireyTel,$aileBireyMSN,$aileBireyTwitter,$aileBireyFlickr);
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

	function insertAkrabaCouch($id,$ad,$ebeveyn,$tanim,$dogum,$olum,$es,$adres,$mail,$tel,$msn,$twitter,$flickr)
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
		$birey->msn = $msn;
		$birey->twitter = $twitter;
		$birey->flickr = $flickr;
		try { $response = $client->storeDoc($birey); } 
		catch (Exception $e) {trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode()); }
	}

	function updateAkraba($aileBireyGuncelleID,$aileBireyTanim,$aileBireyDogum,$aileBireyOlum,$aileBireyEs,$aileBireyAdres,$aileBireyMail,$aileBireyTel,$aileBireyMSN,$aileBireyTwitter,$aileBireyFlickr)
	{
		try{
			$this->_helper->cache->remove("aile"); 
			$this->_helper->cache->remove("aileDetay"); 
			
			$item = Doctrine::getTable('main_Models_AileAgaciDetay')->find($aileBireyGuncelleID);
			$item->aileTanim =$aileBireyTanim;

			$ts = new DateTime($aileBireyDogum);
			$aileBireyDogum=$ts->format("Y-m-d");
			$ts = new DateTime($aileBireyOlum=="" ? "0000-00-00" : $aileBireyOlum);
			$aileBireyOlum=$ts->format("Y-m-d");

			$item->aileDogum =$aileBireyDogum;
			$item->aileOlum =$aileBireyOlum;
			$item->aileBireyEs =ucwords($aileBireyEs);
			$item->aileBireyAdres =$aileBireyAdres;
			$item->aileBireyMail =$aileBireyMail;
			$item->aileBireyTel =$aileBireyTel;
			$item->aileBireyMSN =$aileBireyMSN;
			$item->aileBireyTwitter =$aileBireyTwitter;
			$item->aileBireyFlickr =$aileBireyFlickr;
			$item->save();

			$client=Zend_Registry::get('client');
			try { $doc = $client->getDoc('aile'.$aileBireyGuncelleID); } 
			catch (Exception $e) 
			{
				trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());
				return 1;
			}
			$doc->dogum = $aileBireyDogum;
			$doc->olum =$aileBireyOlum;
			$doc->es =ucwords($aileBireyEs);
			$doc->adres =$aileBireyAdres;
			$doc->mail =$aileBireyMail;
			$doc->tel =$aileBireyTel;
			$doc->msn =$aileBireyMSN;
			$doc->twitter =$aileBireyTwitter;
			$doc->flickr =$aileBireyFlickr;
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

	function searchAkraba($aileAraAd)
	{
		if(mb_strlen($aileAraAd,'utf-8')<3)
			die("&");
		$sonuc="";
		$q = Doctrine_Core::getTable('main_Models_AileAgaci');
		$results = $q->search($aileAraAd);
		foreach ($results as $result)
		{
			$aile = Doctrine::getTable('main_Models_AileAgaci')->find($result['aileid']);
			$row = $aile->toArray();
			$sonuc.= $row['aileID']."|".$row['aileAd']."|";
		}
		$q = Doctrine_Query::create()->from('main_Models_AileAgaci a')->where('a.aileAd=?', $aileAraAd);
		$row = $q->fetchOne();
		if($row)	$sonuc.= $row['aileID']."|".$row['aileAd']."|";
		$sonuc.= "&";
		$result=$this->_helper->cache("aile","main_Models_AileAgaci"); 
		foreach($result as $word) 
		{
			$word = strtolower($word["aileAd"]);
			if(!isset($dict[$word])) 
				$dict[$word] = 0;
			$dict[$word] += 1;
		} 
		unset($result);
		$word = strtolower($aileAraAd);
		$edits1 = $edits2 = array();
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
			$q = Doctrine_Query::create()->from('main_Models_AileAgaci a')->where('a.aileAd=?', $anahtar);
			$row = $q->fetchOne();
			$sonuc.= $row['aileID']."|".$anahtar."|";
		}
		if(count($edits2)) foreach ($edits2 as $anahtar=>$deger)
		{
			$q = Doctrine_Query::create()->from('main_Models_AileAgaci a')->where('a.aileAd=?', $anahtar);
			$row = $q->fetchOne();
			$sonuc.= $row['aileID']."|".$anahtar."|";
		}
		unset($dict);
		return $sonuc;
	}

	function getRating($ailePuanID)
	{
		$aile = Doctrine::getTable('main_Models_AileAgaciOy')->find($ailePuanID);
		$row = $aile->toArray();
		return $row['ortNorm']."|".$row['toplamOy']."|".$row['ort'];
	}

	function setRating($puanlaID,$yildiz)
	{
		preg_match('/star_([1-5]{1})/', $yildiz, $match);
		$vote = $match[1];
		$item = Doctrine::getTable('main_Models_AileAgaciOy')->find($puanlaID);
		$row = $item->toArray();
		$votes= $row['toplamOy'] + 1;
		$totalPoint = $row['toplamPuan'] + $vote;			
		$ortalama = round( $totalPoint / $votes, 1 );
		$normalOrta = round( $ortalama );
		$item->toplamOy =$votes;
		$item->toplamPuan =$totalPoint;
		$item->ortNorm =$normalOrta;
		$item->ort =$ortalama;
		$item->save();

		$client=Zend_Registry::get('client');
		try { 
			$doc = $client->getDoc('aile'.$puanlaID);
			$doc->oy["toplamOy"] = $votes;
			$doc->oy["toplamPuan"] = $totalPoint;
			$doc->oy["ortNorm"] = $normalOrta;
			$doc->oy["ort"] = $ortalama;
			try { $response = $client->storeDoc($doc); } 
			catch (Exception $e) {	trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode()); }
		} 
		catch (Exception $e) {trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());	}

		return $normalOrta."|".$votes."|".$ortalama;
	}

	function submitComment($aileID)
	{
		$arr['commentName']= temizYazi($_POST['commentName']);
		$arr['commentUrl']= temizURL($_POST['commentUrl']);
		$arr['commentEMail']= temizEMail($_POST['commentEMail']);
		$arr['commentBody']= temizYazi($_POST['commentBody']);
		$arr['dt'] = date('r',time());

		$client=Zend_Registry::get('client');
		try { 
			$doc = $client->getDoc('aile'.$aileID);
			$yorum = new stdClass();
			$yorum->isim = $arr['commentName'];
			$yorum->url = $arr['commentUrl'];
			$yorum->mail = $arr['commentEMail'];
			$yorum->body = $arr['commentBody'];
			$yorum->zaman = $arr['dt'];
			$doc->yorumlar[] = $yorum;
			try { $response = $client->storeDoc($doc); } 
			catch (Exception $e) {	trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode()); }
		} 
		catch (Exception $e) {trigger_error("Couch Hata: ".$e->getMessage().";errcode=".$e->getCode());	}

		$item = new main_Models_Yorumlar;
		$item->aileID= $aileID;
		$item->commentName = $arr['commentName'];
		$item->commentUrl = $arr['commentUrl'];
		$item->commentEMail = $arr['commentEMail'];
		$item->commentBody =$arr['commentBody'];
		$item->save();
		$arr['dt'] = date('r',time());
		$arr['id'] = $item->id;

		header('Content-Type: application/json');
		return json_encode(array('status'=>1,'html'=>markup($arr)));
	}
	
	function getComments($aileID)
	{
		$comments = array();
		$mesaj="";	
		$item = Doctrine_Query::create()->from('main_Models_Yorumlar a')->where("a.aileID=?",$aileID)->orderby("a.id ASC");
		$result = $item->fetchArray();
		$item->free();
		foreach($result as $row)
			$mesaj.= markup($row);
		return $mesaj."|".count($result);
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
