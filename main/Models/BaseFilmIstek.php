<?php
Doctrine_Manager::getInstance()->bindComponent('main_Models_FilmIstek', 'doctrine');

abstract class main_Models_BaseFilmIstek extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('film_istek');
        $this->hasColumn('film_ad', 'string', null, array(
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