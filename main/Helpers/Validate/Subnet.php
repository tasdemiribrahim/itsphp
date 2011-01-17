<?php

class main_Helpers_Validate_Subnet extends Zend_Validate_Abstract
{

    const NOT_ON_SUBNET = 'not-on-subnet';
    
    private $_subnet;
    private $_netmask;
    
    protected $_messageTemplates = array(
        self::NOT_ON_SUBNET => "'%value%' is not on the subnet",
    );
    
    public function __construct($subnet, $netmask = null)
    {
        if ($netmask === null && strpos($subnet, '/') === false) {
            throw new Zend_Validate_Exception(
                 'If the netmask is not specified then the CIDR (e.g. /24) must be provided');
        }
        if ($netmask === null) {
            $this->_subnet    = ip2long(substr($subnet, 0, strpos($subnet, '/')));
            $cidr = substr($subnet, strpos($subnet, '/') + 1);
            // /0 is used to denote the default route.  Since we're not doing routing,
            // we will use it for error checking
            if ($cidr < 1 || $cidr > 32) {
                throw new Zend_Validate_Exception('Invalid CIDR specified');
            }
            $this->_netmask = -1 << (32 - (int)$cidr);
           
        } else {
            $this->_subnet    = ip2long($subnet);
            $this->_netmask = ip2long($netmask);
        }
       
    }
    
    public function isValid ($value)
    {
        $this->_setValue($value);
        $host = ip2long($value);


        $check1 = $host & $this->_netmask;
        $check2 = $this->_subnet & $this->_netmask;
       
        if ($check1 == $check2) {
            return true;
        }
        $this->_error(self::NOT_ON_SUBNET);
        return false;
    }    
}
