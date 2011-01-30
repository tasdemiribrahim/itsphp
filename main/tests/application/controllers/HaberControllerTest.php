<?php 
class HaberControllerTest extends ControllerTestCase 
{
	public function testPagesExist()
	{ 
		$this->markTestIncomplete("Sadece Kontrol action testleri yapıldı");  
		$this->dispatch('/haber'); 
		$this->assertController('haber');
		$this->assertAction('muzik');
		$this->assertAction('aile');
		$this->assertAction('matom');
		$this->assertAction('aatom');
		$this->assertAction('adsense');
	} 
}
