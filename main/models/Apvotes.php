<?php
Doctrine_Manager::getInstance()->bindComponent('main_models_Apvotes', 'doctrine');

class main_models_Apvotes extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('apvotes');
        $this->hasColumn('id', 'integer', 10, array(
             'type' => 'integer',
             'length' => 10,
             'fixed' => false,
             'unsigned' => true,
             'primary' => true,
             'notnull' => true,
             'autoincrement' => true,
             ));
        $this->hasColumn('ip', 'integer', 10, array(
             'type' => 'integer',
             'length' => 10,
             'fixed' => false,
             'unsigned' => true,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('pageid', 'integer', 10, array(
             'type' => 'integer',
             'length' => 10,
             'fixed' => false,
             'unsigned' => true,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('dt', 'string', null, array(
             'type' => 'string',
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
	$this->hasOne('main_models_Appages', array('local' => 'pageid','foreign' => 'id','onUpdate' => 'CASCADE'));
    }

}
