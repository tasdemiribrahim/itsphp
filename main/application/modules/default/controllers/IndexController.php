<?php

class IndexController extends Zend_Controller_Action
{
	public function __call( $method, $args )
	{
		if('Action' == substr($method, -6)) 
			$this->_forward('index');
	}

	public function indexAction()
	{	
		$this->view->title="İbrahim Taşdemir'in Kişisel Ana Sayfası";
		$this->view->script="index";
		$this->view->h2="ITSPHP";
		$q = Doctrine_Query::create()->from('main_models_Aa a')->leftJoin('a.Detay d')->leftJoin('a.Ebeveyn e')->orderBy(' a.id DESC')->limit(1);
		$aile = $q->fetchOne();
		$this->view->aileEbeveyn = $aile->Ebeveyn['ad'];
		$this->view->aileAd = $aile['ad'];
		$this->view->aileID = $aile['id'];
		$this->view->aileTanim = $aile->Detay['tanim'];
		$q = Doctrine_Query::create()->from('main_models_Dm')->orderBy('id DESC')->limit(1);
		$this->view->muzik=$q->fetchOne();

		if (!empty($_GET['q'])) 
		{
			$config = $this->getInvokeArg('bootstrap')->getOption('indexes');
			$index = Zend_Search_Lucene::open($config['indexPath']);
			$results = $index->find(Zend_Search_Lucene_Search_QueryParser::parse($_GET['q']));
			$this->view->results = $results;
		}
		
		require_once 'main/helpers/TMDb.php';
		$tmdb = new TMDb(TMDB_API_KEY);
		$q = Doctrine_Query::create()->from('main_models_Film m')->orderBy(' m.id DESC')->limit(1);
		$film=$q->fetchOne();
		$movies_result = json_decode($tmdb->searchMovie($film['ad']));
		$this->view->film=$film;
		$this->view->rating =$movies_result[0]->rating;
		$this->view->language= ($movies_result[0]->language=="en" ? "İngilizce" : $movies_result[0]->language);
		$this->view->overview=$movies_result[0]->overview;
		$this->view->href=$movies_result[0]->url;
		$this->view->released=$movies_result[0]->released;
		$this->view->poster=$movies_result[0]->posters[0]->image->url;
	}
	
	public function haberAction()
	{
		$this->view->title="Haber";
		$this->view->script="haber";
		$this->view->url="haber";
		$this->view->h2="RSS Haber(Feed)";
		$this->view->isHaber = true;
		/*require_once "Facebook/facebook.php";

		$facebook = new Facebook(array("appId" => FACEBOOK_APP_ID,"secret" => FACEBOOK_APP_SECRET,"cookie"=>true));

		if(is_null($facebook->getUser()))
		{
			header("Location:{$facebook->getLoginUrl(array('req_perms' => 'user_status,publish_stream,user_photos'))}");
			exit;
		}
		$statuses = $facebook->api("/me/statuses");
		$this->view->statuses=$statuses["data"];

		$albums = $facebook->api(‘"/me/albums");
		foreach($albums['data'] as $album)
		{
			$photos = $facebook->api("/{$album['id']}/photos");
			foreach($photos[‘data’] as $photo)
				$this->view->photos.= "<img src='{$photo['source']}' />", "<br />";
		}*/

		if(file_exists('Services/Digg2.php'))
		{
			require_once 'Services/Digg2.php';
			try
			{ 
				$service = new Services_Digg2;
				$service->setVersion('2.0');
				$result = $service->story->getTopNews();
				$this->view->digg=$result->stories[0];
			} 
			catch (Exception $e) 
			{
			  	trigger_error('Digg Error: ' . $e->getMessage());  
			}
			try
			{ 
				$result = $service->search->search(array('query' => "ibrahim tasdemir"));
				$this->view->diggme=$result->stories[0];
			} 
			catch (Exception $e) 
			{
				trigger_error('Diggme Error: ' . $e->getMessage());  
			}
		}
	}
	
	public function okuAction()
	{
		$page = temizYazi($this->getRequest()->getParam('page',"programlama"));
		if (file_exists($this->view->getScriptPath(null) . "/" . $this->getRequest()->getControllerName() . "/$page." . $this->viewSuffix)) 
		{
			$this->view->isOku = true;
			$this->view->title=ucfirst($page)." Kitapları";
			$this->view->h2=ucfirst($page)." Kitapları";
			$this->view->script="oku_$page";
			$this->view->url="oku/".$page;
			$this->render($page);
		}
		else 
			throw new Zend_Controller_Action_Exception('Page not found', 404);
	}    

	public function dinleAction()
	{
		$page = temizYazi($this->getRequest()->getParam('page',"metal"));
		if (file_exists($this->view->getScriptPath(null) . "/" . $this->getRequest()->getControllerName() . "/$page." . $this->viewSuffix)) 
		{
			$this->view->isMuzik = true;
			$this->view->title=ucfirst($page)." Müzik";
			$this->view->h2=ucfirst($page)." Müzik";
			$this->view->script="dinle_$page";
			$this->view->url="dinle/".$page;		
			$q = Doctrine_Query::create()->from('main_models_Dmt t')->leftJoin('t.Grup m')->leftJoin('m.Memleket')->orderBy('t.ad DESC');
			$this->view->muzik=$q->fetchArray();	
			$q->free();
			if(isset($_GET['id']))
				$q = Doctrine_Query::create()->from('main_models_Dm m')->where("m.id=?",temizSayi($_GET['id']));
			else
				$q = Doctrine_Query::create()->from('main_models_Dm m')->orderBy(' m.id DESC')->limit(1);
			$muzik=$q->fetchOne();
			$this->view->grup=$muzik;
			$q = Doctrine_Query::create()->from('main_models_Dma m')->where("m.grupID=?",$muzik["id"]);
			$this->view->Albumler=$q->fetchArray();
			$q = Doctrine_Query::create()->from('main_models_Dme m')->where("m.grupID=?",$muzik["id"]);
			$this->view->Elemanlar=$q->fetchArray();
			$this->render($page);
		}
		else 
			throw new Zend_Controller_Action_Exception('Page not found', 404);
	}
	
	public function izleAction()
	{
		$this->view->isFilm = true;
		$this->view->h2="Kısa Film İzle";
		$this->view->script="izle";
		$this->view->url="izle";
		$this->view->bread='<li><a href="#">Kısa Film</a></li>';
		$filters = array(
			'sort' => array('HtmlEntities', 'StripTags', 'StringTrim'),
			'dir' => array('HtmlEntities', 'StripTags', 'StringTrim'),
			'page' => array('HtmlEntities', 'StripTags', 'StringTrim')
		);
		$validators = array(
			'sort' => array('Alpha',array('InArray', 'haystack' =>array("id",'ad', 'uz'))),
			'dir' => array('Alpha',array('InArray', 'haystack' =>array('asc', 'desc'))),
			'page' => array('Int')
		);
		$input = new Zend_Filter_Input($filters, $validators);
		$input->setData($this->getRequest()->getParams());
		if ($input->isValid()) 
		{
			$s=$input->sort ? $input->sort : "id";
			$d=$input->dir ? $input->dir : "asc";
			$m=isset($_GET['m']) ? "00:".$_GET['m'].":00" : "00:00:00";
			$x=isset($_GET['x']) ? "00:".$_GET['x'].":00" : "00:35:00";
			if($input->page>1)
				$this->view->he='<link rel="prev" href="'.$this->view->url(array('page' => $input->page-1,'dir'=>$d,'sort'=>$s), 'watch').'?m='.$m.'&x='.$x.'">';
			$this->view->he.='<link rel="start" href="'.$this->view->url(array(), 'watch').'" title="Kısa Film İzle"><link rel="next" href="'.$this->view->url(array('page' => $input->page+1,'dir'=>$d,'sort'=>$s), 'watch').'?m='.$m.'&x='.$x.'">';

			$this->view->title="Kısa Film İzle Sayfa ".$input->page;
			$q = Doctrine_Query::create()->from('main_models_Film ')->where("uz BETWEEN ? AND ?",array($m,$x))->orderBy(sprintf('%s %s',$s,$d));
			$pager = new Doctrine_Pager($q, $input->page, 5);
			$result = $pager->execute(array(), Doctrine::HYDRATE_ARRAY);
			$pagerRange = new Doctrine_Pager_Range_Sliding(array('chunk' => 10), $pager);
			$pagerUrlBase = $this->view->url(array(), 'watch', 1) . "/{%page_number}";
			$pagerLayout = new PagerLayoutWithArrows($pager, $pagerRange, $pagerUrlBase);
			$pagerLayout->setTemplate('<a href="{%url}">{%page}</a>');
			$pagerLayout->setSelectedTemplate('<span class="current">{%page}</span>');
			$pagerLayout->setSeparatorTemplate('-');
			
			require_once 'main/helpers/TMDb.php';
			$tmdb = new TMDb(TMDB_API_KEY);
			foreach($result as &$res)
			{
				$movies_result = json_decode($tmdb->searchMovie($res['ad']));
				$res['poster']= isset($movies_result[0]) ? (isset($movies_result[0]->posters[0]) ? $movies_result[0]->posters[0]->image->url : "/main/images/blankImage.jpg") : "/main/images/blankImage.jpg";
				unset($movies_result);
			}
			$this->view->records = $result;
			
			if(isset($_GET['id']))
				$q = Doctrine_Query::create()->from('main_models_Film m')->where("m.id=?",temizSayi($_GET['id']));
			else
				$q = Doctrine_Query::create()->from('main_models_Film m')->orderBy(' m.id DESC')->limit(1);
			$film=$q->fetchOne();
			$movies_result = json_decode($tmdb->searchMovie($film['ad']));
			$this->view->film=$film;
			$this->view->rating =$movies_result[0]->rating;
			$this->view->dil=($movies_result[0]->language=="en" ? "İngilizce" : $movies_result[0]->language);
			$this->view->overview=$movies_result[0]->overview;
			$this->view->href=$movies_result[0]->url;
			$this->view->released=$movies_result[0]->released;
			$this->view->poster=$movies_result[0]->posters[0]->image->url;
			
			$this->view->pages = $pagerLayout->display(null, true);

			$q = Doctrine_Query::create()->from('main_models_Fistek m')->orderBy(' m.istek DESC');
			$this->view->istek=$q->fetchArray();
		}
		else 
			throw new Zend_Controller_Action_Exception('Invalid input');
	}

	public function galeriAction()
	{
		$this->_helper->layout->setLayout('minimal');
		$this->view->title = "Galeri";
		$this->view->script = "jquery/jquery.gallery";
	}
	
	public function ajaxAction()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
		
		if(isset($_GET["resim"]))
			die(getResim($_GET["resim"],$_GET["dosya"]));
		elseif(isset($_GET['mid']))
		{
			header('Content-Type: application/json');
			if(!temizSayi($_GET['mid']))
				die(json_encode(array("durum"=>"error")));
			$q = Doctrine_Query::create()->from('main_models_Dm m')->leftJoin('m.Elemanlar e')->leftJoin('m.Albumler a')->where("m.id=?",temizSayi($_GET['mid']));
			$row=$q->fetchArray();
			$row[0]["durum"]="ok";
			echo json_encode($row[0]);
		}
		elseif(isset($_GET['fid']))
		{
			if(!temizSayi($_GET['fid']))
				die(json_encode(array("durum"=>"error")));
			$item = Doctrine::getTable('main_models_Film')->find(temizSayi($_GET['fid']));   
			$row = $item->toArray();
			require_once 'main/helpers/TMDb.php';
			$tmdb = new TMDb(TMDB_API_KEY);
			$movies_result = json_decode($tmdb->searchMovie($row['ad']));
			$row['durum']='ok';
			$row['rating']=$movies_result[0]->rating;
			$row['dil']=($movies_result[0]->language=="en" ? "İngilizce" : $movies_result[0]->language);
			$row['view']=$movies_result[0]->overview;
			$row['url']=$movies_result[0]->url;
			$row['released']=$movies_result[0]->released;
			$row['poster']=isset($movies_result[0]) ? (isset($movies_result[0]->posters[0]) ? $movies_result[0]->posters[0]->image->url : "/main/images/blankImage.jpg") : "/main/images/blankImage.jpg";
			header('Content-Type: application/json');
			echo json_encode($row);
			unset($row,$movies_result);
		}
		elseif(isset($_GET['term']))
		{
			require_once 'main/helpers/TMDb.php';
			$tmdb = new TMDb(TMDB_API_KEY);
			$json = json_decode($tmdb->searchMovie($_GET['term']));
			$response = array();
			$i=0;
			foreach($json as $movie)
			{
				if(!$movie->imdb_id || $movie->adult) continue;
				if($i >= 8) break;
				$response[$i]['value'] = $movie->name;
				$response[$i]['label'] = $movie->name . ' <time>(' . date('Y',strtotime($movie->released)).')</time>';
				$i++;
			}
			header('Content-Type: application/json');
			echo json_encode($response);
		}
		elseif(isset($_GET["fkay"]))
		{
			if(!$_GET['fkay'])
				die(json_encode(array("durum"=>"error")));
			$film = Doctrine::getTable('main_models_Fistek')->find(temizYazi($_GET["fkay"]));
			if($film)
			{
				$film->istek=$film->istek+1;
				$film->save();
			}
			else
			{
				$film=new main_models_Fistek();
				$film->ad=temizYazi($_GET["fkay"]);
				$film->istek=1;
				$film->save();
			}
		}
		elseif(isset($_GET['album']))
		{
			$album = temizYazi($_GET['album']);
			$imagesAr = array();
			$i = 0;
			if(file_exists($_SERVER['DOCUMENT_ROOT'].'/main/images/resimler/'.$album)) 
			{
				$files = array_slice(scandir($_SERVER['DOCUMENT_ROOT'].'/main/images/resimler/'.$album), 2);
				if(count($files)) 
					foreach($files as $file) 
				    		if($file != '.' && $file != '..') 
							$imagesArr[] = array('src' => '/main/images/resimler/'.$album.'/'.$file,'alt'=> '/main/images/resimler/'.$album.'/'.$file,'desc'=> "");
			}
			header('Content-Type: application/json');
			echo json_encode($imagesArr);
		}
	}
}

class PagerLayoutWithArrows extends Doctrine_Pager_Layout
{
    public function display($options = array(), $return = false)
    {
        $pager = $this->getPager();
        $str = '';
        // First page
        $this->addMaskReplacement('page', '&laquo;', true);
        $options['page_number'] = $pager->getFirstPage();
        $str .= $this->processPage($options);
        // Previous page
        $this->addMaskReplacement('page', '&lsaquo;', true);
        $options['page_number'] = $pager->getPreviousPage();
        $str .= $this->processPage($options);
        // Pages listing
        $this->removeMaskReplacement('page');
        $str .= parent::display($options, true);
        // Next page
        $this->addMaskReplacement('page', '&rsaquo;', true);
        $options['page_number'] = $pager->getNextPage();
        $str .= $this->processPage($options);
        // Last page
        $this->addMaskReplacement('page', '&raquo;', true);
        $options['page_number'] = $pager->getLastPage();
        $str .= $this->processPage($options);
        if ($return) 
            return $str;
        echo $str;
    }
}
