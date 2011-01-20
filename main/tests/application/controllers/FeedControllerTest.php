<?php 
class FeedControllerTest extends ControllerTestCase 
{
	public function testAjaxPagesExist()
	{ 
		$this->markTestIncomplete("Sadece Kontrol action testleri yapıldı");  
		$this->dispatch('/feed'); 
		$this->assertController('feed');
		$this->assertAction('muzik'); 		// indexAction var mı?
		$this->assertAction('aileagaci');
		$this->assertAction('adsense');
	} 
}
