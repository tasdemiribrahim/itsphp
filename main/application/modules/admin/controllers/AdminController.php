<?php
class Admin_AdminController extends Zend_Controller_Action
{
	public function preDispatch()
	{
		if (!Zend_Auth::getInstance()->hasIdentity()) 
		{
			$session = new Zend_Session_Namespace('main.auth');
			$session->requestURL = $this->getRequest()->getRequestUri();
			$this->_redirect('/login');
		}
		include_once"main/Helpers/adminHelper.php";
	}

	public function indexAction()
	{
		$this->view->h2="Admin Ayarları";
		$this->view->url="admin";
		$this->view->title="Admin Ayarları";
		$this->view->script="admin";
		$this->view->muzik=$this->_helper->cache("metal","main_Models_Muzik"); 
	}

	public function jsAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="JS Test";
	}
	
	public function abuseAction()
	{
		include_once"main/Helpers/abuseCheck.php";
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Hacker Ayarlar";
		$abuse = new abuse_check();
		$now = time();
		$abuse->get_lock();
		switch ($_REQUEST['cmd']) 
		{
			case 'clear':
				$abuse->data['traffic_start'] = 0;
				$abuse->data['abusive_users'] = array();
				$abuse->data['user_traffic'] = array();
				break;
			case 'add':
				$abuse->data['abusive_users'][$_REQUEST['user']] = 'web @ '.strftime('%c',$now);
				break;
			case 'remove':
				$abuse->data['abusive_users'][$_REQUEST['user']] = 0;
				break;
		}
		$abuse->release_lock();
		$this->view->traffic=$abuse->data['traffic_start'];
		$this->view->user_traffic=$abuse->data['user_traffic'];
		$this->view->abusive_users=$abuse->data['abusive_users'];
		$this->view->now=$now;
	}
	
	public function apiAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Api";	
	}
	
	public function hataAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Hata Ayarlar";	
		if ($this->getRequest()->isPost()) 
		{
			if(isset($_POST['silHatalar'])) file_put_contents($_SERVER['DOCUMENT_ROOT']."/error/hata.log",$_POST['silHatalar']);
			elseif(isset($_POST['silEx'])) file_put_contents($_SERVER['DOCUMENT_ROOT']."/error/hataEx.log",$_POST['silEx']);
			elseif(isset($_POST['silJS'])) file_put_contents($_SERVER['DOCUMENT_ROOT']."/error/hataJS.log",$_POST['silJS']);
			$this->_helper->layout->disableLayout();
			$this->getHelper('viewRenderer')->setNoRender(true);
		}
		$this->view->hatalar=htmlspecialchars(file_get_contents($_SERVER['DOCUMENT_ROOT']."/error/hata.log"));
		$this->view->hatalarEX=htmlspecialchars(file_get_contents($_SERVER['DOCUMENT_ROOT']."/error/hataEx.log"));
		$this->view->hatalarJS=htmlspecialchars(file_get_contents($_SERVER['DOCUMENT_ROOT']."/error/hataJS.log"));
	}
	
	public function hizAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Hız";
		$url = 'http://tasdemir.0fees.net/main/images/heavyMetal-bg.jpg';
		$ch = curl_init($url);

		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_USERAGENT, 'Sitepoint Examples (thread 581410; http://www.sitepoint.com/forums/showthread.php?t=581410)');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
		curl_setopt($ch, CURLOPT_TIMEOUT, 60);

		$execute = curl_exec($ch);
		$info = curl_getinfo($ch);

		$time = $info['total_time'] - $info['namelookup_time'] - $info['connect_time'] - $info['pretransfer_time'] - $info['starttransfer_time'] - $info['redirect_time'];

		$this->view->indirme = sprintf("%0.4f saniyede %d byte indirildi.<br>", $time, $info['size_download']);
		$this->view->indirme .=sprintf("Yani %0.4f mbps<br>", $info['size_download'] * 8 / $time / 1024 / 1024);
		$this->view->indirme .=sprintf("CURL'ye göre %0.4f mbps<br>", $info['speed_download'] * 8 / 1024 / 1024);
		$this->view->indirme .= "<br><br>curl_getinfo() sonucu:<br>". str_repeat('-', 31 + strlen($url)). "<br>";
		$this->view->info = $info;
	}
	
	public function sunucuAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Sunucu Ayarlar";
		$startPath = realpath("../");
		$ite= new RecursiveDirectoryIterator($startPath);
		$filters = array(".svn", ".cvs");
		$sapi_type = php_sapi_name();
		if (substr($sapi_type, 0, 3) == 'cli' && count($argv) > 0)
		{
		   unset($argv[0]);
		   $filters = array_merge($filters, $argv);
		}
		foreach (new fileFilter(new RecursiveIteratorIterator($ite), $filters) as $filename=>$cur)
		   $htaccessFiles[] = $filename;
		if (count($htaccessFiles) == 0)
		{
			$this->view->title=".htaccess dosyası yok!";
		   return;
		}
		$flags = 0; 
		$this->view->htaccess = " ";
		foreach($htaccessFiles as $file)
		{
		   $path = realpath(pathinfo($file, PATHINFO_DIRNAME));
		   $this->view->htaccess .= "<h2>Directory=$path</h2>";
		   $lines = file($file);
		   if(count($lines) > 0)
		   {
			   foreach($lines as $line)
			   {
				   $this->view->htaccess .=  "<br>".htmlentities($line);
				   if(stripos($line, "RedirectBase") !== FALSE)
				   {
					   $this->view->htaccess .=  "# UYARI Yukarıdaki satır RedirectBase barındırıyor. Bir conf dosyasına dönüştürülemeyebilir. Lütfen kontrol edin.<br>";
					   $flags++;
				   }
			   }
			   if (in_array(substr($line, -1), array("\n", "\r")))
				   $this->view->htaccess .=  "---Directory---<br><br>";
			   else
				   $this->view->htaccess .=  "<br>---Directory--<br><br>";
		   }else
			   $this->view->htaccess .=  "<br>---Directory---<br><br>";
		}

		if ($flags > 0)
		   $this->view->htaccess .=  "# $flags uyari tespit edildi. Lütfen belirtilen hatalari düzeltin.<br>";
		else
		   $this->view->htaccess .=  "# Hata bulunamadi! <br>";
		$this->view->htaccess .=  "# Yayinlamadan önce kontrol et. Bu işin şakası olmaz! <br>";
	}
	
	public function dosyaAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Dosya Yönetimi";
		if (isset($_GET['dir']))
			 $this->view->dosyalar = ls($_GET['dir']);
		elseif (isset($_GET['file']))
			 $this->view->dosyalar = cat($_GET['file']); 
		else
			 $this->view->dosyalar = ls(realpath("../")."/");
	}
	
	public function shellAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Shell";
	}
	
	public function statsAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Ziyaretçiler";
		$aile = Doctrine::getTable('main_Models_Tracker')->findAll();
		$this->view->stats=$aile->toArray();
		$this->view->statSayi = count($aile->toArray());
	}
	
	public function midwareAction()
	{
		$this->_helper->layout->setLayout('admin');
		$this->view->title="Midware Ayarlar";
		
		$iniVerileri=array('file_uploads','phpversion','cgi','safe_mode','session.bug_compat_42','session.bug_compat_warn','register_globals','magic_quotes_gpc','magic_quotes_runtime','scream.enabled','session.auto_start','tarayici','sunucu');
		while(list($key,$value)=each($iniVerileri))
			$this->view->ini .= phpIniKontrol($value);
		
		foreach(filter_list() as $id =>$filter) 
			$this->view->filter .= "<tr><td class=\"notError\">$filter</td><td class=\"notError\">".filter_id($filter)."</td></tr> ";
			
		$veriTabanlari=array("ibase","ifx","ldap","msql","mssql","mysql","odbc","oci","pg","sqlite","sybase");
		sort($veriTabanlari);
		while(list($key,$value)=each($veriTabanlari))
			$this->view->veriTabani .= veriTabaniKontrol($value);
		$this->view->drivers=PDO::getAvailableDrivers();

		$REQUIRED_EXTENSIONS = array();
		/*
			require_once 'PHP/CompatInfo.php';
			$r['extensions']=array();
			$kaynak = dirname(dirname($_SERVER['SCRIPT_FILENAME']));
			$ayarlar = array('ignore_dirs' => array('css','images','js'));
			$pci = new PHP_CompatInfo('null');
			$r = $pci->parseArray(array($kaynak,"./"),$ayarlar);
			$REQUIRED_EXTENSIONS = $r['extensions'];
			unset($r);
		*/
		$_allErrors = array();
		$IC = new InstallationChecker($REQUIRED_EXTENSIONS,$_allErrors,2);
		$this->view->phpFunction=$IC->getSonuc();
		$this->view->algos=hash_algos();
		
		$list = Zend_Locale::getTranslationList('language');
		foreach($list as $language => $content) 
		{
			$lang = Zend_Locale::getTranslation($language, 'language', $language);
			$this->view->local.= "<tr><td class=\"notError\">$language</td><td class=\"notError\">$lang</td></tr> ";
		}
		
	}
	
	public function fulltextAction()
	{
		$config = $this->getInvokeArg('bootstrap')->getOption('indexes');
		$index = Zend_Search_Lucene::create($config['indexPath']);
		$result=$this->_helper->cache("aile","main_Models_AileAgaci"); 
		foreach ($result as $r) 
		{
			$doc = new Zend_Search_Lucene_Document();
			$doc->addField(Zend_Search_Lucene_Field::Text('ad',$r['aileAd']));
			$doc->addField(Zend_Search_Lucene_Field::Keyword('id',$r['aileID']));
			$doc->addField(Zend_Search_Lucene_Field::Text('page',"aile"));
			$index->addDocument($doc);
		}
		$result=$this->_helper->cache("aileDetay","main_Models_AileAgaciDetay"); 
		foreach ($result as $r) 
		{
			$doc = new Zend_Search_Lucene_Document();
			$doc->addField(Zend_Search_Lucene_Field::Text('ad',$r['aileBireyEs']));
			$doc->addField(Zend_Search_Lucene_Field::Keyword('id',$r['aileID']));
			$doc->addField(Zend_Search_Lucene_Field::Text('page',"aile"));
			$index->addDocument($doc);
		}	
		$result=$this->_helper->cache("metal","main_Models_Muzik"); 
		foreach ($result as $r) 
		{
			$doc = new Zend_Search_Lucene_Document();
			$doc->addField(Zend_Search_Lucene_Field::Text('grupAd',$r['grupAd']));
			$doc->addField(Zend_Search_Lucene_Field::Keyword('id',$r['grupID']));
			$doc->addField(Zend_Search_Lucene_Field::Text('tur',$r['tur']));
			$doc->addField(Zend_Search_Lucene_Field::Text('memleket',$r['memleket']));
			$doc->addField(Zend_Search_Lucene_Field::Text('page',"muzik"));
			$index->addDocument($doc);
		}
		$result=$this->_helper->cache("film","main_Models_Film"); 
		foreach ($result as $r) 
		{
			$doc = new Zend_Search_Lucene_Document();
			$doc->addField(Zend_Search_Lucene_Field::Text('ad',$r['film_ad']));
			$doc->addField(Zend_Search_Lucene_Field::Keyword('id',$r['id']));
			$doc->addField(Zend_Search_Lucene_Field::Text('page',"film"));
			$index->addDocument($doc);
		}
		$indexSourceDir = '../feed/';
		$dir = opendir($indexSourceDir);
		while (($file = readdir($dir)) !== false) 
		{
			if (is_dir($indexSourceDir . $file)) 
				continue;
			if (strcasecmp(substr($file, strlen($file)-4), '.xml') != 0) 
				continue;
			$xml = simplexml_load_file($indexSourceDir . $file);
			foreach($xml->channel->item as $item)
			{
				$doc = new Zend_Search_Lucene_Document();
				$doc->addField(Zend_Search_Lucene_Field::Text('title', $item->title));
				$doc->addField(Zend_Search_Lucene_Field::Keyword('id',"feed"));
				$doc->addField(Zend_Search_Lucene_Field::Text('page',"feed"));
				$index->addDocument($doc);
			}
			flush();
		}
		closedir($dir);
		$index->optimize();
		$this->_redirect('/admin');
	}
	
	public function ajaxAction()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
		if(!isset($_FILES['uploadResim']['name']))
			include_once "main/Helpers/ajax_guvenli.php";

		if(isset($_POST['kaydet'])) echo $this->insertMuzik(temizYazi($_POST['grupAd']),temizYazi($_POST['grupTur']),temizYazi($_POST['grupMemleket']),$_POST['grupTanim'],temizYazi($_POST['grupClip']));
		elseif(isset($_POST['silID'])) $this->deleteMuzik(temizSayi($_POST['silID']));
		elseif(isset($_POST['guncelleID'])) echo $this->selectMuzik(temizSayi($_POST['guncelleID']));
		elseif(isset($_POST['guncellenecekID'])) $this->updateMuzik(temizSayi($_POST['guncellenecekID']),temizYazi($_POST['grupAd']),temizYazi($_POST['grupTur']),temizYazi($_POST['grupMemleket']),$_POST['grupTanim'],$_POST['grupClip']);
		elseif(isset($_POST['yeniAlbum'])) echo $this->insertAlbum(temizSayi($_POST['grupAd']),temizSayi($_POST['albumYil']),temizYazi($_POST['albumAd']));
		elseif(isset($_POST['yeniEleman'])) echo $this->insertEleman(temizSayi($_POST['grupAd']),temizYazi($_POST['enstruman']),temizYazi($_POST['elemanAd']));
		elseif(isset($_POST['silAlbum'])) $this->deleteAlbum(temizSayi($_POST['silAlbum']));
		elseif(isset($_POST['silEleman'])) $this->deleteEleman(temizSayi($_POST['silEleman']));
		elseif(isset($_FILES['uploadResim']['name'])) echo $this->_helper->imager->upload($_FILES['uploadResim']);
		elseif(isset($_POST['resimHedefGrupID'])) echo $this->_helper->imager->save(temizSayi($_POST['resimHedefGrupID']),temizYazi($_POST['fileName']),"muzik");
		elseif(isset($_POST['film_ad'])) echo $this->insertFilm(temizYazi($_POST['film_ad']),temizYazi($_POST['uzunluk']),temizURL($_POST['mp4']),temizURL($_POST['ogg']),temizURL($_POST['webm']),temizYazi($_POST['tube']),temizURL($_POST['desc']),temizURL($_POST['chap']),temizURL($_POST['meta']),temizURL($_POST['en']),temizURL($_POST['tr']));
	}	
	
	function insertFilm($film_ad,$uzunluk,$mp4,$ogg,$webm,$tube,$desc,$chap,$meta,$en,$tr)
	{
		try
		{
			$film = new main_Models_Film();
			$film->film_ad=$film_ad;
			$film->uzunluk=$uzunluk;
			$film->mp4=$mp4;
			$film->ogg=$ogg;
			$film->webm=$webm;
			$film->tube=$tube;
			$film->desc=$desc;
			$film->chap=$chap;
			$film->meta=$meta;
			$film->en=$en;
			$film->tr=$tr;
			$film->save();
			return $film->id;
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$filmErrors = $film->getErrorStack();
			$error="";
			foreach($filmErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}
	
	function insertMuzik($grupAd,$grupTur,$grupMemleket,$grupTanim,$grupClip)
	{  	
		try 
		{
			$this->_helper->cache->remove("metal"); 

			$conn = Doctrine_Manager::getInstance()->getCurrentConnection();
			$conn->beginTransaction();
			
			$muzik = new main_Models_Muzik();
			$muzik->grupAd=$grupAd;
			$muzik->tur=$grupTur;
			$muzik->memleket=$grupMemleket;
			$muzik->tanim=$grupTanim;
			$muzik->grupClip=$grupClip;
			$muzik->save();

			$rss = new main_Models_MuzikRssItems();
			$rss->title="$grupAd - $grupTur";
			$rss->description =$grupTanim;
			$rss->link =getSiteName()."main/dinle/metal?id=".$muzik->grupID;
			$rss->save();
			
			$conn->commit();
				
			return $muzik->grupID;
		} 
		catch(Doctrine_Validator_Exception $e) 
		{
			$conn->rollback();
			$muzikErrors = $muzik->getErrorStack();
			$rssErrors = $rss->getErrorStack();
			$error="";
			foreach($muzikErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			foreach($rssErrors as $fieldName => $errorCodes) 
				$error .=  $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
			return 0;	
		}
		catch(Doctrine_Exception $e)
		{
			$conn->rollback();
			return "-1";	
		}
		catch (Exception $e) 	
		{
			$conn->rollback();	
			return "-2";	
		}
	}

	function deleteMuzik($silID)
	{
		$this->_helper->cache->remove("metal"); 
		$muzik = Doctrine::getTable('main_Models_Muzik')->find($silID);
		$muzik->delete();
	}

	function selectMuzik($guncelleID)
	{
		$q = Doctrine_Query::create()->from('main_Models_Muzik m')->leftJoin('m.Albumler d')->leftJoin('m.Elemanlar e')->where("grupID=$guncelleID");
		$row = $q->fetchOne();
		$mesaj= $row['tanim']."|".$row['grupAd']."|".$row['tur']."|".$row['memleket']."|".$row['grupClip']."&";
		foreach ($row->Albumler as $album)
			$mesaj.= $album['albumID']."|".$album['albumAd']."|".$album['albumYil']."|";
		$mesaj.= "&";
		foreach ($row->Elemanlar as $eleman)
			$mesaj.= $eleman['elemanID']."|".$eleman['elemanAd']."|".$eleman['enstruman']."|";
		unset($row);
		return $mesaj."&";
	}

	function updateMuzik($guncellenecekID,$grupAd,$grupTur,$grupMemleket,$grupTanim,$grupClip)
	{  	
		try
		{
			$this->_helper->cache->remove("metal"); 
			$muzik = Doctrine::getTable('main_Models_Muzik')->find($guncellenecekID);
			$muzik->grupAd=$grupAd;
			$muzik->tur=$grupTur;
			$muzik->memleket=$grupMemleket;
			$muzik->tanim=$grupTanim;
			$muzik->grupClip=$grupClip;
			$muzik->save();
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$muzikErrors = $muzik->getErrorStack();
			$error="";
			foreach($muzikErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}

	function insertAlbum($grupAd,$albumYil,$albumAd)
	{  	
		try
		{
			$album = new main_Models_Album();
			$album->albumAd=$albumAd;
			$album->albumYil=$albumYil;
			$album->grupID=$grupAd;
			$album->save();
			return $album->albumID;
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$albumErrors = $album->getErrorStack();
			$error="";
			foreach($albumErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}

	function insertEleman($grupAd,$enstruman,$elemanAd)
	{  	
		try
		{
			$eleman = new main_Models_Eleman();
			$eleman->elemanAd=$elemanAd;
			$eleman->enstruman=$enstruman;
			$eleman->grupID=$grupAd;
			$eleman->save();
			return $eleman->elemanID;
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$elemanErrors = $eleman->getErrorStack();
			$error="";
			foreach($elemanErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}

	function deleteAlbum($silAlbum)
	{
		$album = Doctrine::getTable('main_Models_Album')->find($silAlbum);
		$album->delete();
	}

	function deleteEleman($silEleman)
	{
		$eleman = Doctrine::getTable('main_Models_Eleman')->find($silEleman);
		$eleman->delete();
	}

	function updateAlbum($guncellenecekAlbumID,$albumAD,$albumYil)
	{  	
		try
		{
			$album = Doctrine::getTable('main_Models_Album')->find($guncellenecekAlbumID);
			$album->albumAd=$albumAD;
			$album->albumYil=$albumYil;
			$album->save();
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$albumErrors = $album->getErrorStack();
			$error="";
			foreach($albumErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}

	function updateEleman($guncellenecekElemanID,$elemanAD,$enstruman)
	{  	
		try
		{
			$eleman = Doctrine::getTable('main_Models_Eleman')->find($guncellenecekElemanID);
			$eleman->elemanAd=$elemanAd;
			$eleman->enstruman=$enstruman;
			$eleman->save();
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$elemanErrors = $eleman->getErrorStack();
			$error="";
			foreach($elemanErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}
	
	public function setdebugAction()
    {
        $cookies = array(
            'start_debug'            => '1',
            'debug_stop'             => '1',
            'debug_fastfile'         => '1',
            'debug_coverage'         => '1',   
            'use_remote'             => '1',
            'send_sess_end'         => '1',
            'debug_session_id'         => '2000',  
            'debug_start_session'     => '1',
            'debug_port'             => '10137',
            'debug_host'             => '127.0.0.1'
        );
        foreach ($cookies as $name => $value) {
            $this->_response->setHeader(
                'Set-Cookie',
                new Zend_Http_Cookie(
                    $name,
                    $value,
                    $this->_request->getHttpHost()
                    )
            );
        }
       
        $this->_helper->viewRenderer->setNoRender(true);
        echo "Debug set";
    }
	
}
