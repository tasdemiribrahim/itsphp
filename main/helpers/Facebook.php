<?php
/**
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
class main_helpers_Facebook extends Zend_Controller_Action_Helper_Abstract
{
	/**
	* The encrypted Facebook sigs POSTed through signed_request
	* @var string
	*/
	private $_fbSigs;
	/**
	* Has the user authenticated successfully?
	* @var bool
	*/
	public $isAuthed = false;
	/**
	* Has the user actually installed (allowed) the app?
	* @var bool
	*/
	public $hasInstalled = false;
	/**
	* Facebook passed data
	* @var array
	*/
	public $fbData;

	public function direct($signed_request)
	{
		// Check the signed request is what we would have expected
		if(!is_string($signed_request) || empty($signed_request))
			throw new Exception('Invalid signed_request');
		// Set the private variable to the passed string
		$this->_fbSigs = $signed_request;
		// Parse the sigs
		$this->_parse_signed_request();
	}

	private function _parse_signed_request()
	{
		// If the Facbook Sigs are not valid, set authed param and return false
		if (!is_string($this->_fbSigs) || empty($this->_fbSigs))
		{
			$this->isAuthed = false;
			return false;
		}
		// Split the sigs into 2 parts
		list($encoded_sig, $payload) = explode('.', $this->_fbSigs, 2);
		// decode the data
		$sig = $this->_base64_url_decode($encoded_sig);
		$data = json_decode($this->_base64_url_decode($payload), true);
		// Check if the encryption is valid
		if (strtoupper($data['algorithm']) !== 'HMAC-SHA256')
		{
			$this->isAuthed = false;
			return false;
		}
		// Check the sigs are valid
		$expected_sig =	hash_hmac('sha256', $payload, FACEBOOK_APP_SECRET, $raw = true);
		if ($sig !== $expected_sig)
		{
			$this->isAuthed = false;
			return false;
		}
		// Sigs are valid, set the variables
		$this->isAuthed = true;
		$this->fbData = $data;
		// If an oAuth token is sent, we know that the user has allowed the app
		if (isset($this->fbData['oauth_token']) && is_string($this->fbData['oauth_token']) && !empty($this->fbData['oauth_token']))
			$this->hasInstalled = true;
		return true;
	}
	/**
	* base64 url decoder
	* @param string $input
	* @return string
	*/
	private function _base64_url_decode($input)
	{
		return base64_decode(strtr($input, '-_', '+/'));
	}
}
