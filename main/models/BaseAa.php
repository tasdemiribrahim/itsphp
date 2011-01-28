<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('main_models_Aa', 'doctrine');

/**
 * main_models_BaseAileAgaci
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $aileID
 * @property string $aileAd
 * @property integer $ebeveynID
 * @property string $keyHash
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class main_models_BaseAa extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('aa');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => true,
             ));
        $this->hasColumn('ad', 'string', 50, array(
             'type' => 'string',
             'length' => 50,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('eid', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('keyHash', 'string', 40, array(
             'type' => 'string',
             'length' => 40,
             'fixed' => true,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
    }

    public function setUp()
    {
        $this->actAs('Timestampable');       
		$this->actAs('Sluggable', array(
                'unique'    => true,
                'fields'    => array('aileAd'),
                'canUpdate' => true
            )
        );
        $this->actAs('Searchable', array(
                'fields' => array('aileAd')
            )
        );
        $this->actAs('SoftDelete');
        parent::setUp();
    }
}