<?php 
class AjaxControllerTest extends ControllerTestCase 
{
	public function testAjaxPagesExist()
	{ 
		$this->dispatch('/ajax'); 
		$this->assertController('ajax');
		$this->assertAction('takvim'); 		// indexAction var mı?
		$this->assertAction('appreciate');
		$this->assertAction('hotspot');
		$this->assertAction('aile');
	} 
}
