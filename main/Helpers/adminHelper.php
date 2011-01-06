<?php
function veriTabaniKontrol($vt)
{
	$mesaj = " <tr> <td ";
	if($vt=="ibase")
		$mesaj .= ( function_exists( 'ibase_connect' ) && function_exists( 'ibase_server_info' )) ? 'class="notError">iBase</td><td class="notError">'.ibase_server_info() : 'class="error">iBase</td><td class="error">Yok';
	elseif($vt=="mysql")
		$mesaj .= function_exists( 'mysql_connect' ) ? 'class="notError">MySQL</td><td class="notError">'.@mysql_get_client_info() : 'class="error">MySQL</td><td class="error">Yok';
	elseif($vt=="oci")
		$mesaj .= function_exists( 'oci_connect' ) ? 'class="notError">Oracle</td><td class="notError">'.ociserverversion() : 'class="error">Oracle</td><td class="error">Yok';
	elseif($vt=="sqlite")
		$mesaj .= function_exists( 'sqlite_open' ) ? 'class="notError">SQLite</td><td class="notError">'.sqlite_libversion() : 'class="error">SQLite</td><td class="error">Yok';
	else
		$mesaj .= function_exists( $vt.'_connect' ) ? 'class="notError">'.strtoupper($vt).'</td><td class="notError">Var' : 'class="error">'.strtoupper($vt).'</td><td class="error">Yok';
	return $mesaj ."</td></tr>";	
}

function dPgetIniSize($val) 
{
   $val = trim($val);
   if (strlen($val <= 1)) return $val;
   $last = $val{strlen($val)-1};
   switch($last) 
   {
	   case 'k':
	   case 'K':
		   return (int) $val * 1024;
		   break;
	   case 'm':
	   case 'M':
		   return (int) $val * 1048576;
		   break;
	   default:
		   return $val;
   }
}

function phpIniKontrol($iniVeri)
{
	$mesaj = " <tr> <td ";
	if($iniVeri=="phpversion")
	{
		$mesaj .=  version_compare(PHP_VERSION, '5', '<') ? 'class="error">PHP Versiyon</td><td class="error">' : 'class="notError">PHP Versiyon</td><td class="notError">';
		$mesaj .=  phpversion();
	}
	elseif($iniVeri=="cgi")
	{
		$mesaj .=  (php_sapi_name() == 'cgi') ? 'class="error">Sunucu API</td><td class="error">' : 'class="notError">Sunucu API</td><td class="notError">';
		$mesaj .=  php_sapi_name();
	}
	elseif($iniVeri=="file_uploads")
	{
		$mesaj .=  ini_get("file_uploads") ? 'class="notError">Dosya Yukleme</td><td class="notError">' : 'class="error">Dosya Yukleme</td><td class="error">';
		$maxfileuploadsize = min(dPgetIniSize(ini_get('upload_max_filesize')), dPgetIniSize(ini_get('post_max_size')));
		$memory_limit = dPgetIniSize(ini_get('memory_limit'));
		if ($memory_limit > 0 && $memory_limit < $maxfileuploadsize) $maxfileuploadsize = $memory_limit;
		if ($maxfileuploadsize > 1048576) 
			$mesaj .=  (int)($maxfileuploadsize / 1048576) . 'M';
		 else if ($maxfileuploadsize > 1024) 
			$mesaj .=  (int)($maxfileuploadsize / 1024) . 'K';
	}
	elseif($iniVeri=="tarayici")
		$mesaj .=  (stristr($_SERVER['HTTP_USER_AGENT'], 'msie') == true) ? 'class="error">Tarayici</td><td class="error">IE guvenlik riskleri, onbellekleme problemleri, javascript sorunlari, HTML5 teknolojisini desteklememesi vb. problemler yuzunden Firefox kullanmaniz tavsiye edilir.' : 'class="notError">Tarayici</td><td class="notError">'.$_SERVER['HTTP_USER_AGENT'];
	elseif($iniVeri=="sunucu")
		$mesaj .=  (stristr($_SERVER['SERVER_SOFTWARE'], 'apache') == false) ? 'class="error">Sunucu</td><td class="error">Bu yazilim apache sunucusunda gelistirilmis ve denenmistir. Diger sunucularda hatalar olusabilir.' : 'class="notError">Sunucu</td><td class="notError">'.$_SERVER['SERVER_SOFTWARE'];
	else
	{
		$mesaj .=  ini_get($iniVeri) ? 'class="error">'.strtoupper($iniVeri).'</td><td class="error">' : 'class="notError">'.strtoupper($iniVeri).'</td><td class="notError">';
		$mesaj .=  "Kapali Olmasi Tavsiye Edilir";	
	}
	return $mesaj . "</td></tr>";
}

function ls($dir)
{ 
	$handle = dir($dir);
	$veri="";
	while ($filename = $handle->read())
	{
		if ($filename == "." || $filename == "..")  continue;
		$size = filesize("$dir$filename");
		if (is_dir("$dir$filename"))
		{
			if (is_readable("$dir$filename"))
			{
				$line = str_pad($size, 15); 
				$line .= "<a href=\"{$this->view->url(array(), 'dosya')}?dir=$dir$filename/\">$filename/</a>";
			}
			else
			{
				$line = str_pad($size, 15);
				$line .= "$filename/";
			}
		}
		else
		{ 
			if (is_readable("$dir$filename"))
			{
				$line = str_pad($size, 15);
				$line .= "<a href=\"{$this->view->url(array(), 'dosya')}?file=$dir$filename\">$filename</a>";
			}
			else
			{
				$line = str_pad($size, 15);
				$line .= $filename;
			}
		}
		$veri .= "$line\n";
	}
	$handle->close();
	return $veri;
}

function cat($file) 
{
/*
	ob_start();
	readfile($file); 
	$contents = ob_get_contents();
	ob_clean();
	echo htmlentities($contents);
	return true; 
	*/
}

class fileFilter extends FilterIterator
{
   private $filters;
   public function __construct(Iterator $iterator, $filters)
   {
	   parent::__construct($iterator);
	   $this->filters = $filters;
   }

   public function accept()
   {
	   $dir = $this->getInnerIterator()->current();
	   foreach($this->filters as $filter)
		   if(strpos($dir, $filter) !== false)
			   return false;
	   if (strpos($dir, ".htaccess") !== false)
		   return true;
		return false;
   }
}

class InstallationChecker
{
	const PHP_EXTENSION_ERRORS = 'PHP Fonksiyonlari';
	const PEAR_EXTENSION_ERRORS = 'PEAR Paketleri';
	const PHP_MANUAL_LINK_FRAGMENT = 'http://php.net/manual/en/book.';
	const PHP_PEAR_LINK_FRAGMENT = 'http://pear.php.net/package-info.php?package=';
	
	public function __construct($REQUIRED_EXTENSIONS,$_allErrors,$kontrol)
	{
		$this->REQUIRED_EXTENSIONS=$REQUIRED_EXTENSIONS;
		$this->_allErrors=$_allErrors;			
		$this->kontrol=$kontrol;		
		$this->validatePHPExtensions();
		$this->sonuc="";
		while(list($key,$value) = each($this->_allErrors))
		{	
			$this->sonuc.= "<tr><td colspan=2 class=\"verification_type\"><strong>".$key."</strong></td></tr>";
			while(list($i,$AllErrorsErrors) = each($value['errors']))
			{
				if($value['warn'][$i])
					$this->sonuc.= "<tr><td class=\"error\">" . $value['tested'][$i] . "</td><td class=\"error\">" . $AllErrorsErrors . "</td></tr>";
				else
					$this->sonuc.= "<tr><td class=\"notError\">" . $value['tested'][$i] . "</td><td class=\"notError\">" . $AllErrorsErrors . "</td></tr>";
			}
		}
	}
	
	public function getSonuc()
	{
		return $this->sonuc;
	}
	
	private function validatePHPExtensions()
	{
		$phpExtensionErrorFunctions = array();
		$phpExtensionErrors = array();
		while(list($key,$requiredExtension) = each($this->REQUIRED_EXTENSIONS))
		{	
			$chk=0;
			if($this->kontrol==1)
			{
				$path=split(";", ini_get('include_path'));
				while(list($key,$incPath) = each($path))
					if(file_exists($incPath.str_replace("_","/",$requiredExtension).".php"))
					{
						$chk=1;
						break;
					}
			}
			elseif (extension_loaded($requiredExtension)) 
				$chk=1;
			if(!$chk)
			{
				$phpExtensionErrors[] = $this->kontrol==2 ? 
				$this->checkAndAddHTMLLink(self::PHP_MANUAL_LINK_FRAGMENT . $requiredExtension . '.php') : 
				$this->checkAndAddHTMLLink(self::PHP_PEAR_LINK_FRAGMENT . $requiredExtension);
				$phpExtensionErrorWarnings[] = true;
				$requiredExtension .= $this->kontrol==2 ? ' fonksiyonu eksik' : ' paketi eksik';
			}
			else
			{
				$phpExtensionErrors[] = $this->kontrol==2 ? ' Fonksiyon var' : ' Paket var';
				$phpExtensionErrorWarnings[] = false;
			}
			$phpExtensionErrorFunctions[]=$requiredExtension;	
		}
		$icerik= $this->kontrol==2 ? self::PHP_EXTENSION_ERRORS : self::PEAR_EXTENSION_ERRORS;
		
		$this->_allErrors[$icerik]['tested'] = $phpExtensionErrorFunctions; 
		$this->_allErrors[$icerik]['warn'] = $phpExtensionErrorWarnings; 
		$this->_allErrors[$icerik]['errors'] = $phpExtensionErrors;
		
		unset($phpExtensionErrorFunctions,$phpExtensionErrorWarnings,$phpExtensionErrors);
	}

	private function checkAndAddHTMLLink($inputString) 
	{
		return '<a href="'. $inputString . '" target="_blank">' . $inputString . '</a>';
	}
}
		
