<?php

/**
 * main_Models_Yorumlar
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class main_Models_Yorumlar extends main_Models_BaseYorumlar
{
    public function setUp()
    {
        parent::setUp();
		$this->hasOne('main_Models_AileAgaci', array('local' => 'aileID','foreign' => 'aileID'));
    }

}