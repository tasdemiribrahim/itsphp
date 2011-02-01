<?php

Doctrine_Manager::getInstance()->bindComponent('main_models_Sf', 'doctrine');

class main_models_Sf extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('sf');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => true,
             ));
        $this->hasColumn('dt', 'timestamp', null, array(
             'type' => 'timestamp',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('i', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('y', 'string', 128, array(
             'type' => 'string',
             'length' => 128,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('b', 'string', 128, array(
             'type' => 'string',
             'length' => 128,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->actAs('NestedSet', array('hasManyRoots'     => true,'rootColumnName'   => 'root_id'));
    }
}
