<?php

/**
 * main_models_OneriOy
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class main_models_Soo extends main_models_BaseSoo
{
    public function setUp()
    {
        parent::setUp();
		$this->hasOne('main_models_So', array('local' => 'oid','foreign' => 'id'));
    }
}
