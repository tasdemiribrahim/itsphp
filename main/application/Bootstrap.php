<?php
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	protected function _initDoctrine()
	{
		require_once 'Doctrine/Doctrine.php';
		require_once 'Doctrine/Firebug.php';
		$this->getApplication()->getAutoloader()->pushAutoloader(array('Doctrine', 'autoload'),'Doctrine');
		$manager = Doctrine_Manager::getInstance();
		$manager->setAttribute('portability',Doctrine::PORTABILITY_ALL);
		$manager->setAttribute(Doctrine::ATTR_MODEL_LOADING,Doctrine::MODEL_LOADING_CONSERVATIVE);
		$manager->setAttribute(Doctrine::ATTR_QUOTE_IDENTIFIER, false);
		$manager->setAttribute(Doctrine::ATTR_EXPORT,Doctrine::EXPORT_ALL ^ Doctrine::EXPORT_CONSTRAINTS);
		$manager->setAttribute(Doctrine::ATTR_IDXNAME_FORMAT, '%s_index');
		$manager->setAttribute(Doctrine::ATTR_SEQNAME_FORMAT, '%s_seq');
		$manager->setAttribute(Doctrine_Core::ATTR_AUTO_ACCESSOR_OVERRIDE, true);
		$manager->setAttribute(Doctrine_Core::ATTR_VALIDATE, Doctrine_Core::VALIDATE_ALL);
		$manager->setAttribute(Doctrine_Core::ATTR_USE_DQL_CALLBACKS, true);	
		$manager->setAttribute(Doctrine_Core::ATTR_AUTOCOMMIT, false);
		$config = $this->getOption('doctrine');
		try{ $conn = Doctrine_Manager::connection($config['dsn'],'doctrine'); } 
		catch (Doctrine_Manager_Exception $e) {	trigger_error("Doctrine baðlantý hatasý :".$config['dsn']."-Mesaj:".$e->getMessage()); }
		$conn->setCharset($config['charset']);
		$profiler = new Doctrine_Firebug();
		$conn->setListener($profiler);	

		/*
		$this->getApplication()->getAutoloader()->registerNamespace('sfYaml')->pushAutoloader(array('Doctrine', 'autoload'), 'sfYaml');
		Doctrine_Core::compile('Doctrine.compiled.php', array('mysql'));
		Doctrine::generateModelsFromDb('models',array('doctrine'),$config['compile']);
		Doctrine::generateYamlFromDb('models/schema.yml');
		Doctrine::createDatabases();
		Doctrine::generateYamlFromModels('models/schema.yml','models');
		Doctrine::createTablesFromModels('models');
		*/

		/*	
		$cacheDriver = new Doctrine_Cache_Memcache($config['memcache']);
		$cacheDriver = new Doctrine_Cache_Apc();
		$cacheDriver = new Doctrine_Cache_Db(array('connection' => Doctrine_Manager::connection(new PDO('sqlite::memory:'))));
		$conn->setAttribute(Doctrine_Core::ATTR_QUERY_CACHE, $cacheDriver);
		$conn->setAttribute(Doctrine_Core::ATTR_RESULT_CACHE_LIFESPAN, 3600);
		*/
		$migration = new Doctrine_Migration($config['migration']);
		$latestVersion = $migration->getLatestVersion();
		$currentVersion = $migration->getCurrentVersion();
		if ($latestVersion> $currentVersion) 
		{
		    try {
			$migration->migrate($currentVersion);
			$migration->setCurrentVersion($latestVersion);
		    } catch (Exception $e) {
			trigger_error('Caught exception: '.$e->getMessage());
		    }
		}
		return $conn;
	}

	protected function _initCouchDB()
	{
		require_once "PhpOnCouch/couch.php";
		require_once "PhpOnCouch/couchClient.php";
		require_once "PhpOnCouch/couchDocument.php";

		$config = $this->getOption('couch');
		$client = new couchClient($config['host'],$config['db']);

		$registry = Zend_Registry::getInstance();
		$registry->set('client', $client);
		return $client;
	}

	protected function _initLocale()
	{
		$session = new Zend_Session_Namespace('main.l10n');
		if ($session->locale) 
			$locale = new Zend_Locale($session->locale);
		if (empty($locale) || $locale === null) 
		{
			$config = $this->getOption('locale');
			try { $locale = new Zend_Locale($config['type']); } 
			catch (Zend_Locale_Exception $e) { $locale = new Zend_Locale($config['lang']); }
		}
		$registry = Zend_Registry::getInstance();
		$registry->set('Zend_Locale', $locale);
		return $locale;
	}   
	
	protected function _initSession()
	{
		$opts = $this->getOptions();
		Zend_Session::setSaveHandler(new main_helpers_Session_SaveHandler_Doctrine($opts['resources']['session']['saveHandler']['options']['table'])); 
		return Zend_Session::start();
	}

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

	/*
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
	}

	protected function _initCache()
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
		Zend_Controller_Action_HelperBroker::addHelper(new main_helper_Navigation());
	} */
}
