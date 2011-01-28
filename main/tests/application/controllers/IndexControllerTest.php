<?php 
class IndexControllerTest extends ControllerTestCase 
{
	public function testIndexPagesExist()
	{ 
		$this->markTestIncomplete("Sadece Kontrol action testleri yapıldı");  
		$this->dispatch('/'); 
		// check if we don't end up on an error page
		$this->assertNotController('error');
		$this->assertNotAction('error');
		$this->assertModule('default');
		$this->assertController('index');
		$this->assertAction('index'); 		// indexAction var mı?
		$this->assertAction('haber'); 
		$this->assertAction('izle'); 
		$this->assertAction('dinle'); 
		$this->assertAction('oku'); 
		$this->assertAction('ajax');
		$this->assertResponseCode(200);

	} 

}
