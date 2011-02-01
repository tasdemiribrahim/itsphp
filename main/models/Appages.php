<?php
Doctrine_Manager::getInstance()->bindComponent('main_models_Appages', 'doctrine');

class main_models_Appages extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('appages');
        $this->hasColumn('id', 'integer', 10, array(
             'type' => 'integer',
             'length' => 10,
             'fixed' => false,
             'unsigned' => true,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => true,
             ));
        $this->hasColumn('hash', 'string', 32, array(
             'type' => 'string',
             'length' => 32,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('url', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('ap', 'integer', 10, array(
             'type' => 'integer',
             'length' => 10,
             'fixed' => false,
             'unsigned' => true,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
	$this->hasMany('main_models_Apvotes as Oy', array('local' => 'id','foreign' => 'pageid')); 
    }

}
