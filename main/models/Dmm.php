<?php

Doctrine_Manager::getInstance()->bindComponent('main_models_Dmm', 'doctrine');

class main_models_Dmm extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('dmm');
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
    }

    public function setUp()
    {
        parent::setUp();
	$this->hasMany('main_models_Dm as Grup', array('local' => 'id','foreign' => 'mem'));
    }

}
