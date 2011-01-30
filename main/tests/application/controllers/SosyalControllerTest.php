<?php 
class SosyalControllerTest extends ControllerTestCase 
{
	public function testPagesExist()
	{ 
		$this->markTestIncomplete("Sadece Kontrol action testleri yapıldı");  
		$this->dispatch('/sosyal'); 
		$this->assertController('sosyal');
		$this->assertAction('index');
		$this->assertAction('forum');
		$this->assertAction('chat');
		$this->assertAction('ajax');
	} 
}
