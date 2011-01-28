<?php
class main_helpers_Session_SaveHandler_Encrypted extends Zend_Session_Namespace 
{

    const CIPHER = MCRYPT_3DES;
    const MODE = MCRYPT_MODE_CBC;
    
    private $_iv;
    
    public function __construct($namespace = 'Default', $singleInstance = false)
    {
        parent::__construct($namespace, $singleInstance); // Must be true because of iv
        $storeKey = __CLASS__ . '_Data' . '_' . $namespace;
        if (!isset($_COOKIE[$storeKey]) || !isset($this->secretKey)) 
	{
		$this->unsetAll();
		$maxKeySize = mcrypt_get_key_size(self::CIPHER, self::MODE);
		$secretKey = '';
		while( strlen($secretKey)<$maxKeySize) 
		    $secretKey .= dechex(rand());//uniqid(rand(), true);
		$this->secretKey = substr($secretKey, 0, $maxKeySize);
		$iv_size = mcrypt_get_iv_size(self::CIPHER, self::MODE);
		$this->_iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
		$hmac = hash_hmac('md5',$this->_iv,$this->secretKey);
		$unique = base64_encode($this->_iv);
		// The cookie has the same parameters as the session cookie
		$cookie_param = session_get_cookie_params();
		setcookie(
			$storeKey,
			$hmac.$unique,
			$cookie_param['lifetime'],
			$cookie_param['path'],
			$cookie_param['domain'],
			$cookie_param['secure'],
			$cookie_param['httponly']
		);
        } 
	else 
	{
            $hmac = substr($_COOKIE[$storeKey],0,32);
            $unique = base64_decode(substr($_COOKIE[$storeKey],32));
            $check = hash_hmac('md5',$unique,$this->secretKey);
            if($hmac !== $check) 
                 throw new Zend_Session_Exception('Invalid Session Data');
            $this->_iv = $unique;
           
        }        
    }
    
    public function setEncrypted($key, $value)
    {
        $this->$key = bin2hex(
            mcrypt_encrypt(
                self::CIPHER,
                $this->secretKey,
                $value,
                self::MODE,
                $this->_iv
            )
        );
    }

    public function getEncrypted($key)
    {
        if (isset($this->$key)) 
	{
            $decrypt = mcrypt_decrypt(
                self::CIPHER,
                $this->secretKey,
                pack('H*',$this->$key),
                self::MODE,
                $this->_iv
            );
            return rtrim($decrypt, "\0"); // remove null characters off of the end
        }
        return null;
    }
}
