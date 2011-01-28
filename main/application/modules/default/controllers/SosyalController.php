<?php

class SosyalController extends Zend_Controller_Action
{
	public function preDispatch()
	{
		$this->view->isSosyal = true;
	}

   	public function indexAction()
	{
		$this->view->title="Sosyal";
		$this->view->h2="SSS | Öneri";
		$this->view->script="sosyal";
		$this->view->url="sosyal";
		$ip = sprintf('%u',ip2long($_SERVER['REMOTE_ADDR']));

		if(isset($_GET['s']))
			$this->submitOneri($_GET['s']);
		$q = Doctrine_Manager::getInstance()->getCurrentConnection();
		if(isset($_GET['f']) && isset($_GET['t']) && isset($_GET['cleditor']) && isset($_GET['h']))
			$this->sendMail($_GET['f'],$_GET['t'],$_GET['cleditor'],$_GET['h']);

		$result = $q->execute("SELECT s.*, if (v.ip IS NULL,0,1) AS hv FROM oneri AS s LEFT JOIN soo AS v ON(s.id = v.oid AND v.gun = CURRENT_DATE AND v.ip = $ip) ORDER BY s.rating DESC, s.id DESC");
		$this->view->oneri = $result;
		$q = Doctrine_Query::create()->select("a.aileAd,d.aileBireyMail")->from('main_models_AileAgaci a')->leftJoin("a.Detay d")->where("d.aileBireyMail IS NOT NULL")->addwhere("d.aileBireyMail <> ''");
		$this->view->mail = $q->fetchArray();
	}

	public function forumAction()
	{
		$this->view->title="Forum";
		$this->view->script="sosyal_forum";
		$this->view->h2="Forum";
		$this->view->url="sosyal/forum";
		//if (isset($_GET["id"]) && isset($_GET["i"]) && isset($_GET["y"])) 
		//	$this->cevap($_GET["id"],$_GET["i"],$_GET["y"]);
		//if (isset($_GET["yi"]) && isset($_GET["yy"]) && isset($_GET["yb"]))
		//	$this->post($_GET["yi"],$_GET["yy"],$_GET["yb"]);
		$q = Doctrine_Query::create()->select("p.id, date_format(p.dt,'%Y/%m/%d %H:%i:%s') as date, p.b, p.y")->from('main_models_Sf p')->where("level=0");
		$this->view->forum=$q->fetchArray();

		if(isset($_GET['id']))
			$q = Doctrine_Query::create()->from('main_models_Sf m')->where("m.id=?",temizSayi($_GET['id']));
		else
			$q = Doctrine_Query::create()->from('main_models_Sf m')->where("level=0")->orderBy(' m.id DESC')->limit(1);
		$post=$q->fetchOne();
		$this->view->post=$post;
		$q = Doctrine_Core::getTable('main_models_Sf')->find($post["id"]);
		$this->view->cevaplar=$q->getNode()->getChildren();
	}

	public function chatAction()
	{
		$this->view->title="Chat";
		$this->view->h2="Chat";
		$this->view->script="sosyal_chat";
		$this->view->url="sosyal/chat";
	}
	
	private function submitOneri($content)
	{
		if(mb_strlen($content,'utf-8')<3)
			exit;
		$_content=temizYazi($content);
		try
		{
			$item = new main_models_So;
			$item->oneri= $_content;
			$item->save();
			return json_encode(array("durum"=>"ok","id"=>$item->id,"content"=>$_content));
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$itemErrors = $item->getErrorStack();
			$error="";
			foreach($itemErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			return json_encode(array("durum"=>"error","mesaj"=>$error));
		}
	}

	private function cevap($id,$mesaj,$author)
	{
		try
		{
			$item = new main_models_Sf;
			$item->content= temizYazi($mesaj);
			$item->author= temizYazi($author);
			$item->baslik= NULL;
		
			$q = Doctrine_Core::getTable('main_models_Sf')->find(temizSayi($id));
	
			$item->getNode()->insertAsLastChildOf($q);

			return json_encode(array("durum"=>"ok","date"=>date('Y/m/d H:i:s')));
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$itemErrors = $item->getErrorStack();
			$error="";
			foreach($itemErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			return json_encode(array("durum"=>"error","mesaj"=>$error));
		}
	}

	private function sendMail($f,$t,$m,$h)
	{
		$message = new Zend_Mail('utf-8');
		$message->setFrom( $f, 'ITSPHP')->setSubject($h)->addHeader('Importance', 'high')->addTo($t);

		/*
		// Add a PDF attachment (Will be base64 encoded)
		$pdf = $message->createAttachment(file_get_contents('report.pdf'));
		$pdf->type = 'application/pdf';
		$pdf->filename = 'report.pdf';

		// Add a logo to the message - referenced from the message HTML body
		$img = $message->createAttachment(file_get_contents('logo.png'));
		$img->type = 'image/png';
		$img->id = 'logo-image-png@example.com';
		$img->filename = 'logo.png';
		$img->disposition = Zend_Mime::DISPOSITION_INLINE;
	
		//Sending multiple e-mails efficiently
		require_once 'Zend/Mail/Transport/Smtp.php';
		// Set up a transport using smtp.example.com as SMTP server
		$smtpConn = new Zend_Mail_Transport_Smtp('smtp.example.com');
		// Send a bunch of e-mail messages
		$message->send($smtpConn);
		$message2->send($smtpConn);
		*/
	
		$text = str_replace("[\\s]{2,}", " ",$m);
		$text = str_replace("(<[b|B][r|R]/*>)+|(<[p|P](.|\\n)*?>)", "",$text);
		$text = str_replace("(\\s*&[n|N][b|B][s|S][p|P];\\s*)+", " ",$text);
		$text = str_replace("<(.|\\n)*?>", "",$text);
		$text = str_replace("'", "''",$text);
	
		$message->setBodyText($text);
		$message->setBodyHtml($m);
		$message->setType(Zend_Mime::MULTIPART_RELATED);
		return $message->send();
	}

	private function post($i,$y,$b)
	{
		try
		{
			$item = new main_models_Sf;
			$item->i= temizYazi($i);
			$item->y= temizYazi($y);
			$item->b= temizYazi($b);
			$item->save();
		
			$treeObject = Doctrine_Core::getTable('main_models_Sf')->getTree();
			$treeObject->createRoot($item);

			return json_encode(array("durum"=>"ok","id"=>$item->id,"b"=>$item->b,"dt"=>$item->dt,"y"=>$item->y));
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$itemErrors = $item->getErrorStack();
			$error="";
			foreach($itemErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			return json_encode(array("durum"=>"error","mesaj"=>$error));
		}
	}

	public function ajaxAction()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
		include_once "main/helpers/ajax_guvenli.php";
	
		if(isset($_GET['f']) && isset($_GET['t']) && isset($_GET['cleditor']) && isset($_GET['h']))
			echo $this->sendMail($_GET['f'],$_GET['t'],$_GET['cleditor'],$_GET['h']);
		elseif(isset($_GET['action']) && $_GET['action'] == 'submit')
			echo $this->submitOneri($_GET['content']);
		elseif (isset($_GET["id"]) && isset($_GET["i"]) && isset($_GET["y"])) 
			echo $this->cevap($_GET["id"],$_GET["i"],$_GET["y"]);
		elseif (isset($_GET["yi"]) && isset($_GET["yy"]) && isset($_GET["yb"]))
			echo $this->post($_GET["yi"],$_GET["yy"],$_GET["yb"]);
		elseif(isset($_GET['action']) && $_GET['action'] == 'vote')
		{
			$v = temizSayi($_GET['vote']);
			$id = temizSayi($_GET['id']);
			try
			{
				$conn = Doctrine_Manager::getInstance()->getCurrentConnection();
				$conn->beginTransaction();

				$item = new main_models_Soo;
				$item->oid= $id;
				$item->ip = sprintf('%u',ip2long($_SERVER['REMOTE_ADDR']));
				$item->gun = date('Y-m-d', mktime());
				$item->oy = $v;
				$item->save();
				$item = Doctrine::getTable('main_models_So')->find($id);
				$v == 1 ? $item->oyi=$item->oyi +1 : $item->oyk=$item->oyk +1;
				$item->rating = $item->rating + $v;
				$item->save();
				$item->free(true);
				$conn->commit();
				echo json_encode(array("durum"=>"ok"));
			}
			catch(Doctrine_Validator_Exception $e) 
			{
				$conn->rollback();
				$itemErrors = $item->getErrorStack();
				$error="";
				foreach($itemErrors as $fieldName => $errorCodes) 
					$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
				echo json_encode(array("durum"=>"error","mesaj"=>$error));
			}
			catch(Doctrine_Exception $e)
			{
				$conn->rollback();
			}
		}
		elseif(isset($_GET['fid']))
		{
			$q = Doctrine_Core::getTable('main_models_Sf')->find(temizSayi($_GET["fid"]));
			echo $q->content.'|';
			foreach( $q->getNode()->getChildren() as $node)
				echo $node['i'].'|'.$node['dt'].'|'.$node['y'].'|';	
		}
		elseif(!isset($_GET['chat'])) die();
	
	/*	if(get_magic_quotes_gpc()){
			array_walk_recursive($_GET,create_function('&$v,$k','$v = stripslashes($v);'));
			array_walk_recursive($_POST,create_function('&$v,$k','$v = stripslashes($v);'));
		}*/
	
		try{
			$session = new Zend_Session_Namespace('webchat');
			$response = array();
			switch($_GET['chat']){
			
				case 'login':
					$name=temizYazi($_POST['name']);
					$gravatar = temizEMail($_POST['email']);
				
					try{
						$user = new main_models_Scu;
						$user->name = $name;
						$user->gravatar = $gravatar;
						$user->save();
					} catch(Exception $e){	die('Bu isim kullanılıyor!');	}
				
					$session->user	= array('name'=> $name,'gravatar'=> $gravatar);
					$response = array('status'	=> 1,'name' => $name,'gravatar' => gravatar($gravatar));
				break;
			
				case 'checkLogged':
					$response = array('logged' => false);
					if($session->user['name'])
					{
						$response['logged'] = true;
						$response['loggedAs'] = array('name'	=> $session->user['name'],	'gravatar' => gravatar($session->user['gravatar']));
					}
				break;
			
				case 'logout':
						$q = Doctrine_Query::create()->delete('main_models_Scu w')->where("w.name=?",$session->user['name']);
						$q->execute();
						Zend_Session::destroy();
						$_SERVER['PHP_AUTH_USER']=$_SERVER['PHP_AUTH_PW']='';
						$_SESSION = array();
						unset($_SESSION);
						$response = array('status' => 1);
				break;
			
				case 'submitChat':
					$text=temizYazi($_POST['chatText']);
					if(!$session->user)
						die('Önce giriş yapın!');
					if(!$text)
						die('Bir mesaj girin.');
					$line = new main_models_Scl;
					$line->author = $session->user['name'];
					$line->gravatar = $session->user['gravatar'];
					$line->text = $text;
					$line->save();
					$response = array('status'=> 1,'insertID'	=> $line->id);
				break;
			
				case 'getUsers':
					if($session->user['name'])
					{	
						$q = Doctrine_Manager::getInstance()->getCurrentConnection();
						$q->execute("INSERT INTO scu (name, gravatar)
							VALUES (
								'".$session->user['name']."',
								'".$session->user['gravatar']."'
							) ON DUPLICATE KEY UPDATE last = NOW()");						
					}
					$q = Doctrine_Query::create()->delete('main_models_Scu w')->where("w.last < SUBTIME(NOW(),'0:0:30')");
					$q->execute();
					$q = Doctrine_Query::create()->delete('main_models_Scl w')->where("w.ts < SUBTIME(NOW(),'0:5:0')");
					$q->execute();
				
					$q = Doctrine_Query::create()->from('main_models_Scu w')->orderBy(' w.name ASC')->limit(18);
					$users=$q->fetchArray();
					$i=0;
					$u = array();
					foreach($users as $user)
					{
						$user['gravatar'] = gravatar($user['gravatar'],30);
						$u[] = $user;
						$i++;
					}
					$response = array('users' => $u,'total' => $i);
				break;
			
				case 'getChats':
					$q = Doctrine_Query::create()->from('main_models_Scl w')->where("w.id > ".temizSayi($_GET['lastID']))->orderBy(' w.id ASC');
					$chats=$q->fetchArray();
					$c = array();
					foreach($chats as $chat)
					{
						$chat['time'] = array(	'hours' => gmdate('H',strtotime($chat['ts'])),'minutes'	=> gmdate('i',strtotime($chat['ts'])));
						$chat['gravatar'] = gravatar($chat['gravatar']);
						$c[] = $chat;
					}
					$response = array('chats' => $c);
				break;
			
				default:
					die();
			}
		
			echo json_encode($response);
		}
		catch(Exception $e){	die(json_encode(array('error' => $e->getMessage())));	}
	}
}

