<?php
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	protected function _initDoctrine()
	{
		require_once 'Doctrine/Doctrine.php';
		require_once 'Doctrine/Firebug.php';
		$this->getApplication()->getAutoloader()->pushAutoloader(array('Doctrine', 'autoload'),'Doctrine');
		$manager = Doctrine_Manager::getInstance();
		$manager->setAttribute(Doctrine::ATTR_MODEL_LOADING,Doctrine::MODEL_LOADING_CONSERVATIVE);
		$manager->setAttribute(Doctrine_Core::ATTR_AUTO_ACCESSOR_OVERRIDE, true);
		$manager->setAttribute(Doctrine_Core::ATTR_VALIDATE, Doctrine_Core::VALIDATE_ALL);
		$manager->setAttribute(Doctrine_Core::ATTR_USE_DQL_CALLBACKS, true);	
		$manager->setAttribute(Doctrine_Core::ATTR_AUTOCOMMIT, false);
		$config = $this->getOption('doctrine');
		try{
		$conn = Doctrine_Manager::connection($config['dsn'],'doctrine');
		} catch (Doctrine_Manager_Exception $e) {
			trigger_error("Doctrine bağlantı hatası :".$config['dsn']."-Mesaj:".$e->getMessage());
		}
		$conn->setCharset('utf8');
		$profiler = new Doctrine_Firebug();
		//$conn->setListener($profiler);	
		/*	
		$servers = array(
			'host' => 'localhost',
			'port' => 11211,
			'persistent' => true
		);

		$cacheDriver = new Doctrine_Cache_Memcache(array(
				'servers' => $servers,
				'compression' => false
			)
		);
		$cacheDriver = new Doctrine_Cache_Apc();
		$cacheConn = Doctrine_Manager::connection(new PDO('sqlite::memory:'));
		$cacheDriver = new Doctrine_Cache_Db(array('connection' => $cacheConn));
		$conn->setAttribute(Doctrine_Core::ATTR_QUERY_CACHE, $cacheDriver);
		$conn->setAttribute(Doctrine_Core::ATTR_RESULT_CACHE_LIFESPAN, 3600);
		*/
		return $conn;
	}

	protected function _initCouchDB()
	{
		require_once "PhpOnCouch/couch.php";
		require_once "PhpOnCouch/couchClient.php";
		require_once "PhpOnCouch/couchDocument.php";

		$client = new couchClient("http://user:pass@url","db");

		$registry = Zend_Registry::getInstance();
		$registry->set('client', $client);
		return $client;
		//$client=Zend_Registry::get('client');
	}

	protected function _initLocale()
	{
		$session = new Zend_Session_Namespace('main.l10n');
		if ($session->locale) 
			$locale = new Zend_Locale($session->locale);
		if (empty($locale) || $locale === null) {
			try {
				$locale = new Zend_Locale('browser');	// auto,environment
			} catch (Zend_Locale_Exception $e) {
				$locale = new Zend_Locale('tr_TR');
			}
		}
		$registry = Zend_Registry::getInstance();
		$registry->set('Zend_Locale', $locale);
	}   

	/**
	* Initialize the Cache Manager
	* Initializes the memcached cache into
	* the registry and returns the cache manager.
	*
	* @return Zend_Cache_Manager
	*
	protected function _initCachemanager()
	{
		$cachemanager = $this->getPluginResource('cachemanager')->init();

		// fetch the current revision from svn and use it as a prefix
		// why: we do not want to restart memcached, or you will lose sessions.
		if (!$appVersion = apc_fetch('progsite_version')) 
		{
		    $dir = getcwd();
		    chdir(dirname(__FILE__));
		    $appVersion = filter_var(`svn info | grep "Revision"`, FILTER_SANITIZE_NUMBER_INT);
		    chdir($dir);
		    unset($dir);
		    if (!$appVersion) 
			$appVersion = mt_rand(0, 99999); // simply handles an export instead of checkout
		    apc_store('progsite_version', $appVersion);
		}

		$memcached = $cachemanager->getCache('memcached');
		$memcached->setOption('cache_id_prefix', APPLICATION_ENV . '_' . $appVersion);

		return $cachemanager;
	}*/
	
	protected function _initSession()
	{
		$config = array( 
			'tableName'         => 'Session', 
			'dataColumn'        => 'data', 
			'lifetimeColumn'    => 'lifetime', 
			'modifiedColumn'    => 'modified', 
			'primaryKeyColumn'  => 'id', 
		); 
		 
		Zend_Session::setSaveHandler(new main_Helpers_Session_SaveHandler_Doctrine($config)); 
		return Zend_Session::start();
	}

	/**
	* Initialize the Session Id
	* This code initializes the session and then
	* will ensure that we force them into an id to
	* prevent session fixation / hijacking.
	*
	* @return void
	*/
	protected function _initSessionId()
	{
		$this->bootstrap('session');
		$opts = $this->getOptions();
		if ('Zend_Session_SaveHandler_Cache' == $opts['resources']['session']['saveHandler']['class']) 
		{
		    $cache = $this->bootstrap('cachemanager')->getResource('cachemanager')->getCache('memcached'); 
		    $cache = clone $cache;
		    $cache->setOption('cache_id_prefix', APPLICATION_ENV);

		    Zend_Session::getSaveHandler()->setCache($cache);
		}
		$defaultNamespace = new Zend_Session_Namespace();
		if (!isset($defaultNamespace->initialized)) 
		{
		    Zend_Session::regenerateId();
		    $defaultNamespace->initialized = true;
		}
	}
	
	protected function _initAcl()
	{
		  $acl = new Zend_Acl();
		  $roleGuest = new Zend_Acl_Role('guest');
		  $acl->addRole($roleGuest);
		  $acl->addRole(new Zend_Acl_Role('aile'), $roleGuest);
		  $acl->addRole(new Zend_Acl_Role('administrator'));
		  $acl->allow($roleGuest, null, 'view');
		  $acl->allow('aile', null, array('aile', 'aile/form'));
		  $acl->allow('administrator');
	 }
	  
	protected function _initFirePHP()
	{
		require_once('FirePHPCore/FirePHP.class.php');
		$firephp = FirePHP::getInstance(true);
		//$profiler = new Zend_Db_Profiler_Firebug('All DB Queries');
		//$profiler->setEnabled(true);
		//$db->setProfiler($profiler);	
		$firephp->setOption('maxDepth', 5);
		$registry = Zend_Registry::getInstance();
		$registry->set('FirePHP', $firephp);
	}
	
/*	protected function _initCache()
	{
		$this->bootstrap('cachemanager');
		$manager = $this->getResource('cachemanager');
		$memoryCache = $manager->getCache('memory');
		Zend_Locale::setCache($memoryCache);
		Zend_Translate::setCache($memoryCache);
	}
	
	protected function _initNavigation()
	{
		$config = new Zend_Config_Xml(APPLICATION_PATH . '/navigation.xml');
		$container = new Zend_Navigation($config);
		$registry = Zend_Registry::getInstance();
		$registry->set('Zend_Navigation', $container);
		Zend_Controller_Action_HelperBroker::addHelper(new main_Helper_Navigation());
	}
	
	protected function _initTranslate()
	{
		$translate = new Zend_Translate('array',APPLICATION_PATH . '/../../lang/',null,array('scan' => Zend_Translate::LOCALE_FILENAME));
		$registry->set('Zend_Translate', $translate);
	} 
	
	protected function _initDojo()
	{
		$this->bootstrap('view');
		$view = $this->getResource('view');
		Zend_Dojo::enableView($view);
		$view->dojo()->setCdnBase(Zend_Dojo::CDN_BASE_AOL)->addStyleSheetModule('dijit.themes.tundra')->disable();
	} */
}
