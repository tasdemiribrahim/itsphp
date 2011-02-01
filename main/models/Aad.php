<?php

Doctrine_Manager::getInstance()->bindComponent('main_models_Aad', 'doctrine');

class main_models_Aad extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('aad');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => false,
             ));
        $this->hasColumn('tanim', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('dogum', 'date', null, array(
             'type' => 'date',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'past' => true,
             ));
        $this->hasColumn('olum', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'default' => '0000-00-00',
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('es', 'string', 50, array(
             'type' => 'string',
             'length' => 50,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('adres', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('mail', 'string', 50, array(
             'type' => 'string',
             'length' => 50,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('tel', 'string', 50, array(
             'type' => 'string',
             'length' => 50,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('twitter', 'string', 15, array(
             'type' => 'string',
             'length' => 15,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('flickr', 'string', 15, array(
             'type' => 'string',
             'length' => 15,
             'fixed' => false,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
    }

    public function setUp()
    {
        $this->actAs('Timestampable');
        $this->actAs('Versionable', array('versionColumn' => 'version','className' => 'aad_version','auditLog' => true
               // 'generateFiles'   => true,
               // 'generatePath'    => '/path/to/generate'
        ));
        $this->actAs('SoftDelete');
        parent::setUp();
	$this->hasOne('main_models_Aa', array('local' => 'id','foreign' => 'id'));
    }
}
