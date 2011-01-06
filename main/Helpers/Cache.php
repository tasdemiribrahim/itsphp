<?php
class main_Helpers_Cache extends Zend_Controller_Action_Helper_Abstract 
{ 
	/**
	* Frontend Options
	*
	* @access protected
	* @var array
	*/
	private $frontendOptions = array('lifetime' => null,'automatic_serialization' => true);
	/**
	* Backend Options
	*
	* @access protected
	* @var array
	*/
	private $backendOptions = array('cache_dir' =>"../cache");
	/**
	* Cache Lite Options
	*
	* @access protected
	* @var array
	*/
	private $options = array('cacheDir' =>"../cache",'lifeTime' => 36000,'automaticSerialization' => true);
	/**
	* Zend Cache Frontend
	*
	* @access protected
	* @var string
	*/
	private $frontend ='Core';
	/**
	* Zend Cache Backend
	*
	* @access protected
	* @var string
	*/
	private $backend ='File';
	/**
	* Returns all rows of the $table and saves it to $name cache
	*
	* @param string $name
	* @param string $table
	*
	* @return array
	*/
	public function direct($name,$table) 
	{ 
		
		if(file_exists('Cache/Lite.php'))
		{
			require_once('Cache/Lite.php');

			//10 saat
			$Cache_Lite = new Cache_Lite($this->options);
			if(!($c = $Cache_Lite->get($name))) 
			{
				$t = Doctrine::getTable($table)->findAll();	
				$c=$t->toArray();
				$Cache_Lite->save($c,$name); 
			}
		}
		elseif(function_exists("apc_fetch"))
		{
			if (apc_exists($name)) 
			{
			 	$c = apc_fetch($name);
			} 
			else 
			{ 
				$t = Doctrine::getTable($table)->findAll();	
				$c=$t->toArray();
			  	apc_add($name, $c, 24*60);
			}

		}
		else
		{
			$cache = Zend_Cache::factory($this->frontend, $this->backend, $this->frontendOptions, $this->backendOptions);
			if(!($c = $cache->load($name)))
			{
				$t = Doctrine::getTable($table)->findAll();	
				$c=$t->toArray();
				$cache->save($c);
			}
		}
		return $c;
	}
	/**
	* Removes $name cache instance
	*
	* @param string $name
	*/
	public function remove($name)
	{
		if(file_exists('Cache/Lite.php'))
		{
			require_once('Cache/Lite.php');
			$Cache_Lite = new Cache_Lite($this->options);
			$Cache_Lite->remove($name); 
		}
		elseif(function_exists("apc_fetch"))
		{
			apc_clear_cache($name);
		}
		else
		{
			$cache = Zend_Cache::factory($this->frontend, $this->backend, $this->frontendOptions, $this->backendOptions);
			$cache->remove($name);
		}
	}
	/**
	* Return a key's expiration time.
	*
	* @param string $key The name of the key.
	*
	* @return mixed Returns false when no keys are cached or when the key
	*               does not exist. Returns int 0 when the key never expires
	*               (ttl = 0) or an integer (unix timestamp) otherwise.
	*/
	public function apc_expire($key) 
	{
		$cache = apc_cache_info('user');
		if (empty($cache['cache_list'])) 
			return false;
		foreach ($cache['cache_list'] as $entry) 
		{
			if ($entry['info'] != $key) 
			    continue;
			if ($entry['ttl'] == 0) 
			    return 0;
			$expire = $entry['creation_time']+$entry['ttl'];
			return $expire;
		}
		return false;
	}
}
