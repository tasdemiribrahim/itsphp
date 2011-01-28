<?php
Doctrine_Manager::getInstance()->bindComponent('main_models_Scl', 'doctrine');

abstract class main_models_BaseScl extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('scl');
        $this->hasColumn('id', 'integer', 10, array(
             'type' => 'integer',
             'length' => 10,
             'fixed' => false,
             'unsigned' => true,
             'primary' => true,
             'autoincrement' => true,
             ));
        $this->hasColumn('author', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('gravatar', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('text', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('ts', 'timestamp', null, array(
             'type' => 'timestamp',
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
    }
}
