<?php 
class LoginControllerTest extends ControllerTestCase 
{
	public function testValidLoginShouldInitializeSessionAndRedirectToAilePage() 
	{ 
		$this->getRequest()->setMethod('POST'); 
		$this->getRequest()->setPost(array( 'userid' => '11', 'key' => 'rm' ) ); 
		$this->dispatch('/main/login/ajax'); 
		$this->assertRedirectTo('/main/aile'); 
		
		//$this->loginUser('admin@xmlteam.com');
		//$this->assertQuery('td .rettd', 'Checking we have return TD stats');
	} 

	public function testLoginPagesExist()
	{ 
		$this->dispatch('/login'); 
		$this->assertController('login');
		$this->assertAction('index');
		$this->assertAction('logout');
		$this->assertAction('mesaj');
		$this->assertAction('ajax');
	} 

	public function testValidLogoutShouldKillSessionAndRedirectToAnaPage() 
	{ 
		$this->dispatch('/main/login/logout'); 
		$this->assertRedirectTo('/main'); 
	} 
}
