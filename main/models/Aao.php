<?php

/**
 * main_models_AileAgaciOy
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class main_models_Aao extends main_models_BaseAao
{
    public function setUp()
    {
        parent::setUp();
		$this->hasOne('main_models_Aa', array('local' => 'id','foreign' => 'id'));
    }

}