<?php 
class IletisimControllerTest extends ControllerTestCase 
{
	public function testAjaxPagesExist()
	{ 
		$this->markTestIncomplete("Sadece Kontrol action testleri yapıldı");  
		$this->dispatch('/sosyal'); 
		$this->assertController('iletisim');
		$this->assertAction('index');
		$this->assertAction('forum');
		$this->assertAction('chat');
		$this->assertAction('ajax');
	} 
}
