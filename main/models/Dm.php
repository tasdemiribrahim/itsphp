<?php

Doctrine_Manager::getInstance()->bindComponent('main_Models_Dm', 'doctrine');

class main_models_Dm extends Doctrine_Record
{
    public function setUp()
    {
        parent::setUp();
	$this->hasMany('main_models_Dma as Albumler', array('local' => 'id','foreign' => 'grupID'));
	$this->hasMany('main_models_Dme as Elemanlar', array('local' => 'id','foreign' => 'grupID'));
	$this->hasOne('main_models_Dmt as Turler', array('local' => 'tur','foreign' => 'id'));
	$this->hasOne('main_models_Dmm as Memleket', array('local' => 'mem','foreign' => 'id'));
    } 

    public function setTableDefinition()
    {
        $this->setTableName('dm');
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
        $this->hasColumn('tur', 'integer', 25, array(
             'type' => 'integer',
             'length' => 25,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('mem', 'integer', 25, array(
             'type' => 'integer',
             'length' => 25,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('tanim', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('clip', 'string', 50, array(
             'type' => 'string',
             'length' => 50,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
    }
}
