<?php
class SeleniumTestCase extends PHPUnit_Extensions_SeleniumTestCase
{
    protected function setUp()
    {
        $this->setHost('localhost');
        $this->setPort(4444);
        $this->setBrowser("*chrome");
        $this->setBrowserUrl("http://www.php.net/");
    }

    public function testPHP()
    {
        $this->open('/');
        $this->waitForPageToLoad('30000');
        $this->assertTextPresent('What is PHP?');

        $this->click('//a[@href="/downloads.php"]');
        $this->waitForPageToLoad('30000');
        $this->assertTextPresent('Binaries for other systems');

        // check this out, especially useful for debugging:
        $this->assertEquals('http://www.php.net/downloads.php', $this->drivers[0]->getLocation());
    }
}

