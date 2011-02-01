<?php

Doctrine_Manager::getInstance()->bindComponent('main_models_Aa', 'doctrine');

class main_models_Aa extends Doctrine_Record
{    
    public function setTableDefinition()
    {
        $this->setTableName('aa');
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
        $this->hasColumn('eid', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('keyHash', 'string', 40, array(
             'type' => 'string',
             'length' => 40,
             'fixed' => true,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
    }

    public function setUp()
    {
        $this->actAs('Timestampable');       
	$this->actAs('Sluggable', array('unique' => true,'fields'=> array('ad'),'canUpdate' => true));
        $this->actAs('Searchable', array('fields' => array('ad')));
        $this->actAs('SoftDelete');
        parent::setUp();
	$this->hasOne('main_models_Aad as Detay', array('local' => 'id','foreign' => 'id','cascade' => array('delete')));
	$this->hasOne('main_models_Aao as Oy', array('local' => 'id','foreign' => 'id'));
	$this->hasMany('main_models_Aay as Yorumlar', array('local' => 'id','foreign' => 'aileID','cascade' => array('delete'))); 
	$this->hasOne('main_models_Aa as Ebeveyn', array('local' => 'eid','foreign' => 'id','cascade' => array('delete')));
	$this->hasMany('main_models_Aa as Cocuklar', array('local' => 'id','foreign' => 'eid','cascade' => array('delete')));
    }

}
