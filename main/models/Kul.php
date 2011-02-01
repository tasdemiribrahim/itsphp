<?php

Doctrine_Manager::getInstance()->bindComponent('main_models_Kul', 'doctrine');

class main_models_Kul extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('kul');
        $this->hasColumn('ad', 'string', 25, array(
             'type' => 'string',
             'length' => 25,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('sifre', 'string', 50, array(
             'type' => 'string',
             'length' => 50,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('fid', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('fat', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));

	$this->index('myindex', array('fields' => array('sifre' => array('sorting' => 'ASC','length' => 10,"primary"=>true)),'type' => 'unique'));

    }

    public function setUp()
    {
        parent::setUp();
        
    }
}
