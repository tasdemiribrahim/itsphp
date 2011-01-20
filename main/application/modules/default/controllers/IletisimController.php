<?php

class IletisimController extends Zend_Controller_Action
{
	public function preDispatch()
	{
		$this->view->isSosyal = true;
	}

   	public function indexAction()
	{
		$this->view->title="Sosyal";
		$this->view->h2="Mail | Arama | SSS | Öneri";
		$this->view->script="iletisim";
		$this->view->url="sosyal";
		$ip = sprintf('%u',ip2long($_SERVER['REMOTE_ADDR']));
		if(isset($_GET['suggestionText']))
			$this->submitOneri($_GET['suggestionText']);
		$q = Doctrine_Manager::getInstance()->getCurrentConnection();
		$result = $q->execute("SELECT s.*, if (v.ip IS NULL,0,1) AS have_voted FROM oneri AS s LEFT JOIN oneri_oy AS v ON(s.id = v.oneri_id AND v.gun = CURRENT_DATE AND v.ip = $ip) ORDER BY s.rating DESC, s.id DESC");
		$this->view->oneri = $result;

		if(isset($_GET['kimdenTextBox']) && isset($_GET['kimeTextBox']) && isset($_GET['cleditor']) && isset($_GET['konuTextBox']))
			$this->sendMail($_GET['kimdenTextBox'],$_GET['kimeTextBox'],$_GET['cleditor'],$_GET['konuTextBox']);
		$q = Doctrine_Query::create()->select("a.aileAd,d.aileBireyMail")->from('main_Models_AileAgaci a')->leftJoin("a.Detay d")->where("d.aileBireyMail IS NOT NULL")->addwhere("d.aileBireyMail <> ''");
		$this->view->mail = $q->fetchArray();
	}

	public function forumAction()
	{
		$this->view->title="Forum";
		$this->view->script="forum";
		$this->view->h2="Forum";
		$this->view->url="sosyal/forum";
		if (isset($_GET["permalink"]) && isset($_GET["mesaj"]) && isset($_GET["author"])) 
			$this->cevap($_GET["permalink"],$_GET["mesaj"],$_GET["author"]);
		if (isset($_GET["input_mesaj"]) && isset($_GET["input_author"]) && isset($_GET["input_title"]))
			$this->post($_GET["input_mesaj"],$_GET["input_author"],$_GET["input_title"]);
		$q = Doctrine_Query::create()->select("p.id, date_format(p.date,'%Y/%m/%d %H:%i:%s') as date, p.permalink, p.author")->from('main_Models_Posts p')->where("level=0");
		$this->view->forum=$q->fetchArray();

		if(isset($_GET['id']))
			$q = Doctrine_Query::create()->from('main_Models_Posts m')->where("m.id=?",temizSayi($_GET['id']));
		else
			$q = Doctrine_Query::create()->from('main_Models_Posts m')->where("level=0")->orderBy(' m.id DESC')->limit(1);
		$post=$q->fetchOne();
		$this->view->post=$post;
		$q = Doctrine_Core::getTable('main_Models_Posts')->find($post["id"]);
		$this->view->cevaplar=$q->getNode()->getChildren();
	}

	public function chatAction()
	{
		$this->view->title="Chat";
		$this->view->h2="Chat";
		$this->view->script="chat";
		$this->view->url="sosyal/chat";
	}
	
	private function submitOneri($content)
	{
		if(mb_strlen($content,'utf-8')<3)
			exit;
		$_content=temizYazi($content);
		try
		{
			$item = new main_Models_Oneri;
			$item->oneri= $_content;
			$item->save();
			return $item->id."|".$_content;
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$itemErrors = $item->getErrorStack();
			$error="";
			foreach($itemErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}

	private function cevap($permalink,$mesaj,$author)
	{
		try
		{
			$item = new main_Models_Posts;
			$item->content= temizYazi($mesaj);
			$item->author= temizYazi($author);
			$item->permalink= NULL;
		
			$q = Doctrine_Core::getTable('main_Models_Posts')->find(temizSayi($permalink));
	
			$item->getNode()->insertAsLastChildOf($q);

			return date('Y/m/d H:i:s');
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$itemErrors = $item->getErrorStack();
			$error="";
			foreach($itemErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
		}
	}

	private function sendMail($kimden,$kime,$mesaj,$konu)
	{
		$message = new Zend_Mail('utf-8');
		$message->setFrom( $kimden, 'ITSPHP')->setSubject($konu)->addHeader('Importance', 'high')->addTo($kime);

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
	
		$text = str_replace("[\\s]{2,}", " ",$mesaj);
		$text = str_replace("(<[b|B][r|R]/*>)+|(<[p|P](.|\\n)*?>)", "",$text);
		$text = str_replace("(\\s*&[n|N][b|B][s|S][p|P];\\s*)+", " ",$text);
		$text = str_replace("<(.|\\n)*?>", "",$text);
		$text = str_replace("'", "''",$text);
	
		$message->setBodyText($text);
		$message->setBodyHtml($mesaj);
		$message->setType(Zend_Mime::MULTIPART_RELATED);
		return $message->send();
	}

	private function post($konu,$author,$title)
	{
		try
		{
			$item = new main_Models_Posts;
			$item->content= temizYazi($konu);
			$item->author= temizYazi($author);
			$item->permalink= temizYazi($title);
			$item->save();
		
			$treeObject = Doctrine_Core::getTable('main_Models_Posts')->getTree();
			$treeObject->createRoot($item);

			return $item->id."|".$item->permalink."|".$item->date;
		}
		catch(Doctrine_Validator_Exception $e) 
		{
			$itemErrors = $item->getErrorStack();
			$error="";
			foreach($itemErrors as $fieldName => $errorCodes) 
				$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
			trigger_error($error);
			return "error 2";
		}
	}

	public function ajaxAction()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
		include_once "main/Helpers/ajax_guvenli.php";
	
		if(isset($_GET['kimden']) && isset($_GET['kime']) && isset($_GET['mesaj']) && isset($_GET['konu']))
			echo $this->sendMail($_GET['kimden'],$_GET['kime'],$_GET['mesaj'],$_GET['konu']);
		
		if(isset($_GET['action']) && $_GET['action'] == 'vote')
		{
			$v = temizSayi($_GET['vote']);
			$id = temizSayi($_GET['id']);
			try
			{
				$conn = Doctrine_Manager::getInstance()->getCurrentConnection();
				$conn->beginTransaction();

				$item = new main_Models_OneriOy;
				$item->oneri_id= $id;
				$item->ip = sprintf('%u',ip2long($_SERVER['REMOTE_ADDR']));
				$item->gun = date('Y-m-d', mktime());
				$item->oy = $v;
				$item->save();
				$item = Doctrine::getTable('main_Models_Oneri')->find($id);
				$v == 1 ? $item->oy_iyi=$item->oy_iyi +1 : $item->oy_kotu=$item->oy_kotu +1;
				$item->rating = $item->rating + $v;
				$item->save();
				$item->free(true);
				$conn->commit();
			}
			catch(Doctrine_Validator_Exception $e) 
			{
				$conn->rollback();
				$itemErrors = $item->getErrorStack();
				$error="";
				foreach($itemErrors as $fieldName => $errorCodes) 
					$error .= $fieldName . " - " . implode(', ', $errorCodes) . "\n";
				trigger_error($error);
			}
			catch(Doctrine_Exception $e)
			{
				$conn->rollback();
			}
		}
	
		if(isset($_GET['action']) && $_GET['action'] == 'submit')
			echo $this->submitOneri($_GET['content']);

		if (isset($_GET["permalink"]) && isset($_GET["mesaj"]) && isset($_GET["author"])) 
			echo $this->cevap($_GET["permalink"],$_GET["mesaj"],$_GET["author"]);

		if(isset($_GET['forumMesajGetir']))
		{
			$q = Doctrine_Core::getTable('main_Models_Posts')->find(temizSayi($_GET["forumMesajGetir"]));
			echo $q->content.'|';
			foreach( $q->getNode()->getChildren() as $node)
				echo $node['content'].'|'.$node['date'].'|'.$node['author'].'|';	
		}

		if (isset($_GET["konuPHP"]) && isset($_GET["authorKonu"]) && isset($_GET["titleKonu"]))
			echo $this->post($_GET["konuPHP"],$_GET["authorKonu"],$_GET["titleKonu"]);

		if(!isset($_GET['chat'])) die();
	
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
						$user = new main_Models_WebchatUsers;
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
						$q = Doctrine_Query::create()->delete('main_Models_WebchatUsers w')->where("w.name=?",$session->user['name']);
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
					$line = new main_Models_WebchatLines;
					$line->author = $session->user['name'];
					$line->gravatar = $session->user['gravatar'];
					$line->text = $text;
					$line->save();
					$response = array('status'	=> 1,'insertID'	=> $line->id);
				break;
			
				case 'getUsers':
					if($session->user['name'])
					{	
						$q = Doctrine_Manager::getInstance()->getCurrentConnection();
						$q->execute("INSERT INTO webchat_users (name, gravatar)
							VALUES (
								'".$session->user['name']."',
								'".$session->user['gravatar']."'
							) ON DUPLICATE KEY UPDATE last_activity = NOW()");						
					}
					$q = Doctrine_Query::create()->delete('main_Models_WebchatUsers w')->where("w.last_activity < SUBTIME(NOW(),'0:0:30')");
					$q->execute();
					$q = Doctrine_Query::create()->delete('main_Models_WebchatLines w')->where("w.ts < SUBTIME(NOW(),'0:5:0')");
					$q->execute();
				
					$q = Doctrine_Query::create()->from('main_Models_WebchatUsers w')->orderBy(' w.name ASC')->limit(18);
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
					$q = Doctrine_Query::create()->from('main_Models_WebchatLines w')->where("w.id > ".temizSayi($_GET['lastID']))->orderBy(' w.id ASC');
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

