<?php
/**
 * Common Image Processes PHP API class
 * Copyright (c) 2010, İbrahim Taşdemir
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the organisation nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * @author İbrahim Taşdemir
 * @since 10.10.2010
 * @date 10.10.2010
 * @copyright İbrahim Taşdemir
 * @version 0.0.1
 * @license BSD http://www.opensource.org/licenses/bsd-license.php
 */
class main_helpers_Imager extends Zend_Controller_Action_Helper_Abstract
{ 
	/**
	* Checks if png,gif,jpg image is safe to upload and moves uploaded image to the "/main/images/temp/image"
	*
	* @param FILE $uploadResim uploaded file
	*
	* @return string Returns "error1" or "error2" when the image is too big. Returns "error3" when the image is partially uploaded. Returns "error4" or "error7" when the image is not uploaded. Returns "error5" when unknown error accourred. Returns "error6" or "error8" when image is not gif,jpg or png. Returns "error9" when the image is not moved to the new destination. Returns "error5" when an exception accourred during proccess.  Returns the moved file name when everything went well.
	*/
	function upload($uploadResim)
	{
		try{
			if($uploadResim['tmp_name']==".")
				return true;
			$max_photo_size = 63000000;
			switch ($uploadResim['error']) 
			{	
				case UPLOAD_ERR_OK: 
					if ($uploadResim['size'] > $max_photo_size)
						return "error1";
					break ;
				case UPLOAD_ERR_INI_SIZE:
					return "error1";
				case UPLOAD_ERR_FORM_SIZE:
					return "error2";
				case UPLOAD_ERR_PARTIAL:
					return "error3";
				case UPLOAD_ERR_NO_FILE:
					return "error4";
				default:
					return "error5";
			}
			if (!in_array($uploadResim['type'],array ('image/jpeg', 'image/pjpeg', 'image/png', 'image/gif'))) 
				return "error6";
			if(file_exists($uploadResim['tmp_name'])) $imagetype = exif_imagetype($uploadResim['tmp_name']);
			else return "error7";
			if(($fp = fopen($uploadResim['tmp_name'], "rb")) !== false)
			{
				$data = fread ($fp, 20);
				$header = unpack ('A6version', $data);
				$ver = $header['version'];
			
				$imageinfo = getimagesize($uploadResim['tmp_name']);
				$line =substr($data,0,4);
				fclose($fp);
				if(($line === "\377\330\377\340" && ($imageinfo['mime'] === "image/jpeg" || $imageinfo['mime'] === "image/pjpeg") && $imagetype=="2") || (strtolower(substr($line,1)) === "png" && $imageinfo['mime'] === "image/png" && $imagetype=="3") || (strtolower(substr($line,0,3)) === "gif" && $imageinfo['mime'] === "image/gif" && $imagetype=="1" && ($ver == 'GIF87a' || $ver == 'GIF89a')))
				{
					$file = temizYazi($_SERVER['DOCUMENT_ROOT']."/main/images/temp/".basename($uploadResim['name']));
					if (!move_uploaded_file($uploadResim['tmp_name'], $file)) 
						return "error9";
					else
						return $file;
				}
				else return "error8";
			}
			else
				return "error7";
		}catch(Exception $e){	return "error5";	}
	}
	/**
	* Saves the png,gif,jpg image to the "/main/images/$dosya/$id.jpg"
	*
	* @param string $dosya folder to look up
	* @param string $id name of the file without jpg extension
	*
	* @return string Returns "/main/images/$dosya/$id.jpg"
	*/
	function save($id,$resim,$dosya="aile")
	{
		rename($resim,$_SERVER['DOCUMENT_ROOT']."/main/images/resimler/$dosya/$id.jpg");
		@unlink($resim);
		return "/main/images/resimler/$dosya/$id.jpg";
	}
	/**
	* Crops the image
	*
	* @param string $filename name of the file to crop
	* @param int $left left position start to crop 
	* @param int $top top position start to crop 
	* @param int $crop_width width of the crop result default 100
	* @param int $crop_height height of the crop result default 100
	*
	* @return string Returns filename when cropping is successfull.Returns error when an exception accoured.
	*/
	function crop($filename,$left,$top,$crop_width=100,$crop_height=100)
	{
		try{
			list($current_width, $current_height) = getimagesize($filename);
			$new = imagecreatetruecolor($crop_width, $crop_height);
			$current_image = imagecreatefromjpeg($filename);
			imagecopy($new, $current_image, 0, 0, $left, $top, $current_width, $current_height);
			imagejpeg($new, $filename, 100);
			return $filename;
		}
		catch(Exception $e){	return "error";	}
	}
	/**
	* Download interface for the image
	*
	* @param string $filename name of the file to download
	*
	* @return download stream
	*/
	function download($file)
	{
		$file=$_SERVER['DOCUMENT_ROOT'].$file;
		if(is_dir($file))exit;
		header('Content-Description: File Transfer');
		header('Content-Type: application/octet-stream');
		header('Content-Disposition: attachment; filename='.basename($file));
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Content-Control: must-revalidate,post-check=0, pre-check=0');
		header('Pragma: public');
		header('Content-Length: ' . filesize($file));
		ob_clean();
		flush();
		readfile($file);
		exit;
	}
	/**
	* Checks if Imagick extension is loaded
	*
	* @return boolean Returns true when Imagick extension is loaded, false when not
	*/
	function checkImagick()
	{
		if(function_exists(Imagick)) return true;
		return false;
	}
	/**
	* Rotates the image
	*
	* @param string $file name of the file to rotate
	* @param int $deg rotate degree default 90
	*/
	function rotate($file,$deg=90)
	{
		if($this->checkImagick())
		{
			$image=new Imagick($_SERVER['DOCUMENT_ROOT'].$file);
			$image->rotateImage(new ImagickPixel(),$deg);
			$image->writeImage($_SERVER['DOCUMENT_ROOT'].$file);
		}
	}
}
