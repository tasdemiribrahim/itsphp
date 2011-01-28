<?php
/**
 * Common File Processes PHP API class
 * Copyright (c) 2010, İbrahim Taşdemir
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the organisation nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * @author İbrahim Taşdemir <tasdemiribrahim@mynet.com>
 * @since 10.10.2010
 * @date 10.10.2010
 * @copyright İbrahim Taşdemir
 * @version 0.0.1
 * @license BSD http://www.opensource.org/licenses/bsd-license.php
 *
 * @package main
 * @subpackage Helpers
 * @todo check other file types
 * @uses Zend_Filter_File_Encrypt uses on crypt and decrypt
 */
class main_helpers_Filer extends Zend_Controller_Action_Helper_Abstract 
{ 
	/**
	* Encryption type
	*
	* @access protected
	* @var string Openssl or Mcrypt
	*/
	private $enc='mcrypt';
	/**
	* Initialization vector
	*
	* @access protected
	* @var string
	*/
	private $vector= '236587hgtyujkirtfgty5678';
	/**
	* Encryption algorithm
	*
	* @access protected
	* @var string
	*/
	private $algorithm = 'rijndael-192';
	/**
	* Encryption key
	*
	* @access protected
	* @var string
	*/
	private $key = 'KFJGKDK$$##^FFS345678FG2';
	/**
	* Checks if mp3,ogg or pdf file is safe to upload and adds proper comments to the file
	*
	* @param string $file The path of the file
	*
	* @return boolean Returns false when the file is unsafe. Returns true when the file is safe or not ogg,mp3 or pdf
	*/
	public function direct($file)
	{
		$uzanti=strtolower(substr($file,-4));
		if(strcmp($uzanti,".mp3")===0 && function_exists("id3_set_tag"))
		{
				if(id3_set_tag( $file, array("comment" => " ITSPHP Tarafindan Yuklendi."), ID3_V1_0))
					return true;
				else
					return false;
		}
		elseif(strcmp($uzanti,".ogg")===0 && extension_loaded("oggVorbis"))
		{
			$fp = fopen('ogg://'.$file, 'r');
			$metadata = stream_get_meta_data($fp);
			fclose($fp);
			$songdata = $metadata['wrapper_data'][0];
			if(isset($songdata['channels'],$songdata['bitrate'],$songdata['rate']))
				return true;
			else
				return false;
		}
		elseif(strcmp($uzanti,".pdf")===0)
		{
			try
			{
				$pdf = Zend_Pdf::load($file);
				$pdf->properties['Title'] = $pdf->properties['Title'] .' | ITSPHP';
				$pdf->save($file);
				return true;
			}
			catch(Exception $e){	return false;	}
		}
		else
			return true;
	}
	/**
	* Encryptes the file to the file.enc
	*
	* @param string $file The path of the file
	*
	* @return null
	*/
	private function crypt($file)
	{
		$options = array(
				'adapter' => $this->enc,
				'vector' => $this->vector,
				'algorithm' => $this->algorithm,
				'key' => $this->key
				);
		 
		$encrypt = new Zend_Filter_File_Encrypt($options);

		$filter->setFilename($file.'.enc');
		 
		$encrypt->filter($file);
	}
	/**
	* Decryptes the crypted file.enc to the file
	*
	* @param string $file The path of the crypted file
	*
	* @return null
	*/
	private function decrypt($file)
	{
		$options = array(
				'adapter' => $this->enc,
				'vector' => $this->vector,
				'algorithm' => $this->algorithm,
				'key' => $this->key
				);
		 
		$decrypt = new Zend_Filter_File_Decrypt($options);
		 
		$filter->setFilename($file);
		 
		$decrypt->filter($file.'.enc');
	}
	/**
	* Download interface for the file
	*
	* @param string $file The path of the file to be downloaded
	*
	* @return download stream
	*/
	public function dowload($file)
	{
		$filename = $_SERVER['DOCUMENT_ROOT']."/main/images/temp/$file.enc";
		$destination = $_SERVER['DOCUMENT_ROOT']."/main/images/temp/$file";
		 
		if(!file_exists($filename)) 
		    die "Error accessing the file.";
		 
		$this->decrypt($filename);
		$fp = @fopen($destination, 'rb');
		if (strstr($_SERVER['HTTP_USER_AGENT'], "MSIE"))
		{
		    header('Content-Type: "application/octet-stream"');
		    header('Content-Disposition: attachment; filename="' . $file . '"');
		    header('Expires: 0');
		    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		    header("Content-Transfer-Encoding: binary");
		    header('Pragma: public');
		    header("Content-Length: ".filesize($destination));
		}
		else
		{
		    header('Content-Type: "application/octet-stream"');
		    header('Content-Disposition: attachment; filename="' . $file . '"');
		    header("Content-Transfer-Encoding: binary");
		    header('Expires: 0');
		    header('Pragma: no-cache');
		    header("Content-Length: ".filesize($destination));
		}
		fpassthru($fp);
		fclose($fp);
		unlink($destination);
	}
}
