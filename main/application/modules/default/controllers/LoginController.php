<?php
class LoginController extends Zend_Controller_Action
{
	public function indexAction()
	{
		//$this->getInvokeArg('bootstrap')->bootstrap('session');
		//$session = $this->getInvokeArg('bootstrap')->getResource('session');
		$session = new Zend_Session_Namespace('main.auth');
		//$this->view->akraba=$session;
		if(isset($session->yoneticiAd))
			$this->_redirect('/admin');
		$this->_helper->layout->setLayout('admin');
		require_once('main/helpers/recaptchalib.php');
		require_once('main/helpers/TwitterAPI.php');
		$this->view->title="Login";
		$this->view->script="login";
		$connection = new TwitterAPI(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET);
		$request_token = $connection->getRequestToken(getSiteName().'main/aile');
		//$session->oauth_token  = $request_token['oauth_token'];
		//$session->oauth_token_secret= $request_token['oauth_token_secret'];
		$authorize_url = $connection->getLoginURL($request_token);
		$this->view->twitter = "<a title='Twitter ile bağlan' href='$authorize_url'><div class='sign_with_twitter'></div></a>";
		$error=null;
		if ($this->getRequest()->isPost()) 
		{
			if(isset($_POST['login']))
			{
				$filters = array('login' => array('HtmlEntities', 'StripTags', 'StringTrim',"StringToLower"),	'sifre' => array('HtmlEntities', 'StripTags', 'StringTrim',"StringToLower"),	'recaptcha_challenge_field' =>array("StringTrim"),	'recaptcha_response_field' =>array("StringTrim"));
				$validators = array('login' => array('NotEmpty'),'sifre' => array('NotEmpty'));
				$input = new Zend_Filter_Input($filters, $validators);
				$input->setdata($this->getRequest()->getPost());
				if (isset($_POST['sifre']) && $input->isValid())  
				{
					$resp = recaptcha_check_answer (RECAPTCHA_PRIVATE_KEY,$_SERVER["REMOTE_ADDR"],$_POST['recaptcha_challenge_field'],$_POST['recaptcha_response_field']);
					if ($resp->is_valid) 
					{
						$config = $this->getInvokeArg('bootstrap')->getOption('itsphp');
						$adapter = new main_helpers_Auth_Adapter_Doctrine($input->login, $input->sifre,$config["secret"]);
						$auth = Zend_Auth::getInstance();
						$result = $auth->authenticate($adapter);
						if ($result->isValid()) 
						{
							if (isset($session->requestURL)) 
							{
								$url = $session->requestURL;
								unset($session->requestURL);
								$this->_redirect($url);
							} 
							else 
								$this->_redirect('/admin');
						}
						else 
							$this->view->uyari ='Yönetici Ad veya şifre hatalı...';
					} 
					else 
						$error=$resp->error;
				}
				else
					$this->view->uyari ='Yönetici Ad veya şifre girin!';
			}
			elseif(isset($_POST['myspace']))
			{
				$redirect=false;
				$useragent = 'Mozilla 4.01';
				$proxy = false;
				$ch = curl_init();
				$hash = crc32( $_POST['myspace'].$_POST['myspace_pass'] );
				$hash = sprintf( "%u", $hash );
				$randnum = $hash.rand( 0, 9999999 );

				if( $proxy ) curl_setopt( $ch, CURLOPT_PROXY, $proxy );

				curl_setopt( $ch, CURLOPT_COOKIEJAR, '/tmp/cookiejar-'.$randnum );
				curl_setopt( $ch, CURLOPT_COOKIEFILE, '/tmp/cookiejar-'.$randnum );
				curl_setopt( $ch, CURLOPT_USERAGENT, $useragent );
				curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1 );
				curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
				curl_setopt( $ch, CURLOPT_POST, 0);
				curl_setopt( $ch, CURLOPT_URL, 'http://www.myspace.com' );
				$page = curl_exec( $ch );

				preg_match( '/MyToken=(.+?)"/i', $page, $token );
				if( $token[1] ) 
				{
					curl_setopt( $ch, CURLOPT_URL, 'http://login.myspace.com/index.cfm?fuseaction=login.process&MyToken='.$token[1] );
					curl_setopt( $ch, CURLOPT_REFERER, 'http://www.myspace.com' );
					curl_setopt( $ch, CURLOPT_HTTPHEADER, Array('Content-Type: application/x-www-form-urlencoded'));
					curl_setopt( $ch, CURLOPT_POST, 1 );
					$postfields = 'NextPage=&email='.urlencode( $_POST['myspace'] ).'&password='.urlencode( $_POST['myspace_pass'] ).'&loginbutton.x=&loginbutton.y=';
					curl_setopt( $ch, CURLOPT_POSTFIELDS, $postfields );
					$page = curl_exec( $ch );
					if( strpos( $page, 'SignOut' ) !== false ) $redirect=true;
					else 
					{
						preg_match( '/MyToken=(.+?)"/i', $page, $token );
						preg_match( '/replace\("([^\"]+)"/', $page, $redirpage );
						if( $token[1] ) 
						{
							curl_setopt( $ch, CURLOPT_POST, 0 );
							curl_setopt( $ch, CURLOPT_URL, 'http://home.myspace.com/index.cfm?&fuseaction=user&Mytoken='.$token[1] );
							$page = curl_exec( $ch );
							curl_close( $ch );
							if( strpos( $page, 'SignOut' ) !== false ) $redirect=true;
						}
						elseif( $redirpage[1] ) 
						{
							curl_setopt( $ch, CURLOPT_REFERER, 'http://login.myspace.com/index.cfm?fuseaction=login.process&MyToken='.$token[1] );
							curl_setopt( $ch, CURLOPT_URL, $redirpage[1] );
							curl_setopt( $ch, CURLOPT_POST, 0 );
							$page = curl_exec( $ch );
							curl_close( $ch );
							if( strpos( $page, 'SignOut' ) !== false ) $redirect=true;
						}
					}
				}
				if($redirect)
				{
					$mykul=temizYazi($_POST['myspace']);
					$q = Doctrine_Query::create()->from('main_models_Kul')->where('ad='.$mykul);
					$row = $q->fetchOne();
					if(!$row)
					{
						$config = $this->getInvokeArg('bootstrap')->getOption('itsphp');
						$mysifre=hash_hmac('ripemd160',temizYazi($_POST['myspace_pass']),$config["secret"]);
						try
						{
							$kul = new main_models_Kul();
							$kul->ad = $mykul;
							$kul->sifre =$mysifre;
							$kul->save();
						} 
						catch (Exception $e){}
					}
					$session = new Zend_Session_Namespace('main.auth');
					$session->akrabaAd=$mykul;
					if (isset($session->requestURL)) 
					{
						$url = $session->requestURL;
						unset($session->requestURL);
						$this->_redirect($url);
					} 
					else 
						$this->_redirect('/main/aile');
				}
			}
		}
		if(isset($_REQUEST['signed_request'])) 
		{
			list($encoded_sig, $payload) = explode('.', $_REQUEST['signed_request'], 2);
			$sig = base64_decode(strtr($encoded_sig, '-_', '+/'));
			$data = json_decode(base64_decode(strtr($payload, '-_', '+/')), true);
			if (strtoupper($data['algorithm']) !== 'HMAC-SHA256')
			{
				$this->view->fbhata='Algoritma bilinmiyor. HMAC-SHA256 olmalıydı.';
				$data = null;
			}
			$expected_sig = hash_hmac('sha256', $payload, FACEBOOK_APP_SECRET, $raw = true);
			if ($sig !== $expected_sig) 
			{
				$this->view->fbhata='JSON hatası!';
				$data = null;
			}
			if($data)
			{
				$q = Doctrine_Query::create()->from('main_models_Kul')->where('ad='.$data["registration"]["name"]);
				$row = $q->fetchOne();
				if(!$row)
				{
					try
					{
						$kul = new main_models_Kul();
						$kul->ad = $data["registration"]["name"];
						$kul->sifre =$data["registration"]["password"];
						$kul->save();
					} 
					catch (Exception $e){}
				}
			}
		}
		$this->view->recaptcha = recaptcha_get_html(RECAPTCHA_PUBLIC_KEY,$error); 
    	}
	
	public function logoutAction()
	{
		Zend_Auth::getInstance()->clearIdentity();
		Zend_Session::destroy();
		$_SERVER['PHP_AUTH_USER']=$_SERVER['PHP_AUTH_PW']='';
		/*@session_start();
		$_SESSION = array();
		unset($_SESSION);
		if (isset($_COOKIE[session_name()])) 
			setcookie(session_name(), '', time()-42000, '/');
		session_unset();
		session_destroy();	*/
		$this->_redirect('/');
	}
	
	public function ajaxAction()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);

		$userID = temizSayi($_POST['userid']);
		if(!$userID)
			die("error");
		elseif(!$_POST['key'])
			die("error");
		$userKey = hash_hmac('ripemd160',$_POST['key'], "elendil");
		
		$aileAgaci = Doctrine::getTable('main_models_Aa')->find($userID);
		$result =$aileAgaci->toArray();
		if($userKey == $result['keyHash']) 
		{
			echo "ok";
			$session = new Zend_Session_Namespace('main.auth');
			$session->akrabaID=$userID;
			$session->akrabaAd=$result['ad'];
		}
		else 
			echo "error";
	}

	public function mesajAction()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);

		if(mb_strlen($_POST['message'],'utf-8') < 5)
			die('Mesajınız çok kısa.');

		$message = new Zend_Mail('utf-8');
		$message->setFrom('noreply@'.$_SERVER['HTTP_HOST'], 'ITSPHP')->setSubject('New Quick Feedback Form Submission')->addHeader('Importance', 'high')->addTo("cenarious_demigod@hotmail.com");

		$message->setBodyHtml($_POST['message']);
		$message->setType(Zend_Mime::MULTIPART_RELATED);
		$message->send();
		echo 'Mesajınız alındı!';
	}
}

