<?php 
class IndexControllerTest extends ControllerTestCase 
{
	public function testIndexPagesExist()
	{ 
		$this->dispatch('/ana'); 
		$this->assertController('index');
		$this->assertAction('index'); 		// indexAction var mı?
		$this->assertAction('feed'); 
		$this->assertAction('display'); 
		$this->assertAction('listen'); 
		$this->assertAction('watch'); 
		$this->assertAction('ajax');
	} 
}
