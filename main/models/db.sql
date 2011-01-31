SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `aa` (
  `id` int(11) NOT NULL auto_increment,
  `ad` varchar(50) collate utf8_unicode_ci NOT NULL,
  `eid` int(11) NOT NULL,
  `keyHash` char(40) collate utf8_unicode_ci default NULL,
  `created_at` timestamp NULL default '0000-00-00 00:00:00',
  `updated_at` timestamp NULL default '0000-00-00 00:00:00',
  `slug` varchar(255) collate utf8_unicode_ci default NULL,
  `deleted_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `aad` (
  `id` int(11) NOT NULL,
  `tanim` text collate utf8_unicode_ci,
  `dogum` date default NULL,
  `olum` date default '0000-00-00',
  `es` varchar(50) collate utf8_unicode_ci default NULL,
  `adres` text collate utf8_unicode_ci,
  `mail` varchar(50) collate utf8_unicode_ci default NULL,
  `tel` bigint(20) default NULL,
  `twitter` varchar(15) collate utf8_unicode_ci default NULL,
  `flickr` varchar(15) collate utf8_unicode_ci default NULL,
  `version` bigint(20) default '1',
  `created_at` timestamp NULL default '0000-00-00 00:00:00',
  `updated_at` timestamp NULL default '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `aad_version` (
  `id` int(11) NOT NULL default '0',
  `tanim` text collate utf8_unicode_ci,
  `dogum` date default NULL,
  `olum` date default '0000-00-00',
  `es` varchar(50) collate utf8_unicode_ci default NULL,
  `adres` text collate utf8_unicode_ci,
  `mail` varchar(50) collate utf8_unicode_ci default NULL,
  `tel` bigint(20) default NULL,
  `twitter` varchar(15) collate utf8_unicode_ci default NULL,
  `flickr` varchar(15) collate utf8_unicode_ci default NULL,
  `version` bigint(20) NOT NULL default '0',
  `created_at` timestamp NULL default '0000-00-00 00:00:00',
  `updated_at` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `aao` (
  `id` int(11) NOT NULL,
  `tp` int(11) NOT NULL default '0',
  `on` int(11) NOT NULL default '0',
  `to` int(11) NOT NULL default '0',
  `ort` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aar` (
  `id` int(11) NOT NULL auto_increment,
  `title` text collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `link` text collate utf8_unicode_ci,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `aarh` (
  `id` bigint(20) NOT NULL auto_increment,
  `src` varchar(255) collate utf8_unicode_ci NOT NULL,
  `spot` int(11) NOT NULL,
  `val` varchar(255) collate utf8_unicode_ci NOT NULL,
  `x` bigint(20) NOT NULL,
  `y` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `aay` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aileID` int(10) unsigned NOT NULL,
  `n` varchar(255) collate utf8_unicode_ci NOT NULL,
  `u` varchar(255) collate utf8_unicode_ci NOT NULL,
  `m` varchar(255) collate utf8_unicode_ci NOT NULL,
  `b` text collate utf8_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `appages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hash` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `url` text collate utf8_unicode_ci NOT NULL,
  `ap` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `apvotes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ip` int(10) unsigned NOT NULL default '0',
  `pageid` int(10) unsigned NOT NULL default '0',
  `dt` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `vote` (`ip`,`pageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `kul` (
  `ad` varchar(255) collate utf8_unicode_ci NOT NULL,
  `sifre` varchar(255) collate utf8_unicode_ci NOT NULL,
  `fid` varchar(255) collate utf8_unicode_ci,
  `fat`  varchar(255) collate utf8_unicode_ci,
  PRIMARY KEY  (`ad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dm` (
  `id` int(11) NOT NULL auto_increment,
  `ad` varchar(50) collate utf8_unicode_ci NOT NULL,
  `tur` int(25) NOT NULL,
  `mem` int(25) NOT NULL,
  `tanim` text collate utf8_unicode_ci NOT NULL,
  `clip` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dma` (
  `id` int(11) NOT NULL auto_increment,
  `ad` varchar(255) collate utf8_unicode_ci NOT NULL,
  `yil` int(11) NOT NULL,
  `grupID` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dme` (
  `id` int(11) NOT NULL auto_increment,
  `ad` varchar(255) collate utf8_unicode_ci NOT NULL,
  `ens` varchar(255) collate utf8_unicode_ci NOT NULL,
  `grupID` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dmm` (
  `id` int(12) NOT NULL auto_increment,
  `ad` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ad` (`ad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dmr` (
  `id` int(11) NOT NULL auto_increment,
  `title` text collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `link` text collate utf8_unicode_ci,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dmt` (
  `id` int(12) NOT NULL auto_increment,
  `ad` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ad` (`ad`),
  KEY `ad_2` (`ad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `download` (
  `day` date NOT NULL,
  `downloads` int(11) default NULL,
  PRIMARY KEY  (`day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `film` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `uz` time NOT NULL,
  `mp4` varchar(250) collate utf8_unicode_ci default NULL,
  `ogg` varchar(250) collate utf8_unicode_ci default NULL,
  `webm` varchar(250) collate utf8_unicode_ci default NULL,
  `tr` varchar(250) collate utf8_unicode_ci default NULL,
  `ad` varchar(250) collate utf8_unicode_ci NOT NULL,
  `ac` varchar(255) collate utf8_unicode_ci default NULL,
  `chap` varchar(255) collate utf8_unicode_ci default NULL,
  `meta` varchar(255) collate utf8_unicode_ci default NULL,
  `en` varchar(255) collate utf8_unicode_ci default NULL,
  `tube` char(12) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fistek` (
  `ad` varchar(255) collate utf8_unicode_ci NOT NULL,
  `istek` int(11) NOT NULL default '1',
  PRIMARY KEY  (`ad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `main__models__aa_index` (
  `id` bigint(20) NOT NULL default '0',
  `keyword` varchar(200) collate utf8_unicode_ci NOT NULL default '',
  `field` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `position` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`,`keyword`,`field`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migration_version` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `scl` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `author` varchar(255) collate utf8_unicode_ci NOT NULL,
  `gravatar` varchar(255) collate utf8_unicode_ci NOT NULL,
  `text` varchar(255) collate utf8_unicode_ci NOT NULL,
  `ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `ts` (`ts`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `scu` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `gravatar` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `last` (`last`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `session` (
  `id` char(32) collate utf8_unicode_ci NOT NULL default '',
  `modified` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `data` text collate utf8_unicode_ci,
  `name` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sf` (
  `id` int(10) NOT NULL auto_increment,
  `dt` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `i` text collate utf8_unicode_ci NOT NULL,
  `y` varchar(128) collate utf8_unicode_ci NOT NULL,
  `b` varchar(128) collate utf8_unicode_ci default NULL,
  `root_id` bigint(20) default NULL,
  `lft` bigint(20) default NULL,
  `rgt` bigint(20) default NULL,
  `level` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `so` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `oneri` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `oyi` int(6) unsigned NOT NULL default '0',
  `oyk` int(6) unsigned NOT NULL default '0',
  `rating` int(6) NOT NULL default '0',
  `tarih` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `rating` (`rating`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `soo` (
  `oid` int(10) unsigned NOT NULL default '0',
  `ip` int(10) unsigned NOT NULL default '0',
  `gun` date NOT NULL default '0000-00-00',
  `oy` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`oid`,`ip`,`gun`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tracker` (
  `date` date NOT NULL,
  `time` time NOT NULL,
  `ip` varchar(20) collate utf8_unicode_ci NOT NULL,
  `country` text collate utf8_unicode_ci NOT NULL,
  `city` text collate utf8_unicode_ci NOT NULL,
  `query` text collate utf8_unicode_ci NOT NULL,
  `ref` text collate utf8_unicode_ci NOT NULL,
  `agent` text collate utf8_unicode_ci NOT NULL,
  `isbot` int(1) NOT NULL,
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

