<?php

Doctrine_Manager::getInstance()->bindComponent('main_models_Soo', 'doctrine');

class main_models_Soo extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('soo');
        $this->hasColumn('oid', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => true,
             'primary' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('ip', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => true,
             'primary' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('gun', 'date', null, array(
             'type' => 'date',
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('oy', 'integer', 1, array(
             'type' => 'integer',
             'length' => 1,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'default' => '0',
             'notnull' => true,
             'autoincrement' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
	$this->hasOne('main_models_So', array('local' => 'oid','foreign' => 'id','onDelete' => 'CASCADE'));
    }
}
