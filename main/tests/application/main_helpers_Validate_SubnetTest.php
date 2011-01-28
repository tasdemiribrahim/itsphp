<?php
require_once 'bootstrap.php';
require_once 'main\helpers\Validate\Subnet.php';
require_once 'PHPUnit\Framework\TestCase.php';

class main_helpers_Validate_SubnetTest extends PHPUnit_Framework_TestCase
{

    public function testValidSubnetAndNetmask()
    {
        $sn = new Esc_Validate_Subnet('192.168.0.1', '255.255.255.0');
        $this->assertTrue($sn->isValid('192.168.0.2'));
    }
    
    public function testValidSubnetWithCIDR()
    {
        $sn = new Esc_Validate_Subnet('192.168.0.1/24');
        $this->assertTrue($sn->isValid('192.168.0.2'));
    }
    
    public function testInvalidSubnetAndNetmask()
    {
        $sn = new Esc_Validate_Subnet('192.168.1.1', '255.255.255.0');
        $this->assertFalse($sn->isValid('192.168.0.2'));
    }
    
    public function testInvalidSubnetWithCIDR()
    {
        $sn = new Esc_Validate_Subnet('192.168.1.1/24');
        $this->assertFalse($sn->isValid('192.168.0.2'));
    }
    
    /**
     * @expectedException Zend_Validate_Exception
     */
    
    public function testMalformedCIDRBadSeperator()
    {
        $sn = new Esc_Validate_Subnet('192.168.0.1_24');
        $this->assertTrue($sn->isValid('192.168.0.2'));
    }
    
    /**
     * @expectedException Zend_Validate_Exception
     */
    
    public function testMalformedCIDRNumericalCIDR()
    {
        $sn = new Esc_Validate_Subnet('192.168.0.1/abc');
        $this->assertTrue($sn->isValid('192.168.0.2'));
    }
    
    /**
     * @expectedException Zend_Validate_Exception
     */
    
    public function testMalformedCIDRLowCIDR()
    {
        $sn = new Esc_Validate_Subnet('192.168.0.1/-1');
        $this->assertTrue($sn->isValid('192.168.0.2'));
    }
    /**
     * @expectedException Zend_Validate_Exception
     */
    
    public function testMalformedCIDRHighCIDR()
    {
        $sn = new Esc_Validate_Subnet('192.168.0.1/33');
        $this->assertTrue($sn->isValid('192.168.0.2'));
    }
    
}
