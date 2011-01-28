<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('main_models_Session', 'doctrine');

abstract class main_models_BaseSession extends Doctrine_Record
{
    public function setTableDefinition() 
    { 
        $this->setTableName('session'); 
        $this->hasColumn('id', 'string', 32, array('type' => 'string', 'fixed' => 1, 'primary' => true, 'length' => '32')); 
        $this->hasColumn('modified', 'integer', null, array('type' => 'integer')); 
        $this->hasColumn('lifetime', 'integer', null, array('type' => 'integer')); 
        $this->hasColumn('data', 'string', null, array('type' => 'string')); 
        $this->hasColumn('name', 'string', null, array('type' => 'string')); 
    } 
	
    public function setUp()
    {
        parent::setUp();
        
    }
}
