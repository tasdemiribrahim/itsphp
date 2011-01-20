<?php 
class AjaxControllerTest extends ControllerTestCase 
{
	public function testAjaxPagesExist()
	{ 
		$this->markTestIncomplete("Sadece Kontrol action testleri yapıldı");  
		$this->dispatch('/ajax'); 
		$this->assertController('ajax');
		$this->assertAction('takvim'); 		// indexAction var mı?
		$this->assertAction('appreciate');
		$this->assertAction('hotspot');
		$this->assertAction('aile');
	} 
}
