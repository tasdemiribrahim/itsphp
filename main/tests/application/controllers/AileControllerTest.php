<?php 
class AileControllerTest extends ControllerTestCase 
{
	public function testAilePagesExist()
	{ 
		$this->markTestIncomplete("Sadece Kontrol action testleri yapıldı");  
		$this->dispatch('/aile'); 
		$this->assertController('aile');
		$this->assertAction('index'); 		// indexAction var mı?
		$this->assertAction('agac');
		$this->assertAction('form');
		// Form kontrolü
		$this->assertQueryCount('form', 2);
		$this->assertQueryCount('input[type="email"]', 2);
		$this->assertQueryCount('textarea', 2);
	} 
}
