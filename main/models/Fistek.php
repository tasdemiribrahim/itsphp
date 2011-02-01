<?php

Doctrine_Manager::getInstance()->bindComponent('main_models_Fistek', 'doctrine');

class main_models_Fistek extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('fistek');
        $this->hasColumn('ad', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('istek', 'integer', 10, array(
             'type' => 'integer',
             'length' => 10,
             'fixed' => false,
             'unsigned' => true,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        
    }
}
