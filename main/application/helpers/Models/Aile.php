<?php
class main_application_helpers_Models_Aile implements IteratorAggregate, Serializable 
{
	public $dom;
	private $data;
	const PATH='xml/aile.xml';
	public function __construct() 
	{
		$dom = new DomDocument;
		$dom->validateOnParse = true;
		$dom->preserveWhiteSpace = false;
		$dom->Load(self::PATH);
		$this->dom=$dom;
	}

	public function __destruct() 
	{
		//$this->dom->save(self::PATH);
	}

	public function __get($name) 
	{
		$xpath = new DOMXpath($this->dom);
		$names=explode("&",$name);
		$path="/aile";
		foreach($names as $name)
			$path.='/birey[@ad="'.urldecode($name).'"]';
		return $xpath->query($path)->item(0);
	}

	public function __set($name,$attributes) 
	{
		$elm=$this->dom->createElement("birey");
		foreach ($attributes as $attr=>$val)
		    $elm->setAttribute($attr, $val);
		$this->$name->appendChild($elm);
		$this->dom->save(self::PATH);
	}

	public function __isset($name) 
	{
		$xpath = new DOMXpath($this->dom);
		$names=explode("&",$name);
		$path="/aile";
		foreach($names as $name)
			$path.='/birey[@ad="'.urldecode($name).'"]';
		return $xpath->query($path)->length==1;
	}

	public function __unset($name) 
	{
		if(!isset($this->$name)) return false;	
		$node=$this->$name;	
   		$node->parentNode->removeChild($node); 
		$this->dom->save(self::PATH);
		return true;
	}

	public function __call($name, $arguments) 
	{
		$xpath = new DOMXpath($this->dom);
		return $xpath->query('//*[@'.$name.']');
	}

	public static function __callStatic($name, $arguments) 
	{
		$ins = new main_application_helpers_Models_Aile();
		return $ins->$name($arguments);
	}

	public function __toString()
	{
		return json_encode($this->getResult());
	}

	public function __invoke($x)
	{
		return $this->_process($this->dom);
	}

	public static function __set_state($an)
	{
		$obj = new main_application_helpers_Models_Aile();
		$obj->dom = $an['dom'];
		return $obj;
	}

	public function getIterator() 
	{
		return new ArrayIterator($this->getResult());
	}

	public function serialize() 
	{
		return json_encode($this->getResult());
	}

	public function unserialize($data) 
	{
		$this->data = json_decode($data);
	}

	public function update($name,$attributes)
	{
		$elm=$this->$name;
		foreach ($attributes as $attr=>$val)
		    $elm->setAttribute($attr, $val);
		$this->dom->save(self::PATH);
	}
 
	function _process($node) 
	{ 
		$occurance = array();
		foreach($node->childNodes as $child) 
			isset($occurance[$child->nodeName])?$occurance[$child->nodeName]++:$occurance[$child->nodeName]=1;
		if($node->nodeType == XML_TEXT_NODE) 
			$result = html_entity_decode(htmlentities($node->nodeValue, ENT_COMPAT, 'UTF-8'), ENT_COMPAT,'ISO-8859-15');
		else 
		{
			if($node->hasAttributes()) 
			{ 
				$attributes = $node->attributes;
				if(!is_null($attributes)) 
					foreach ($attributes as $key => $attr) 
						$result["@".$attr->name] = $attr->value;
			}

			if($node->hasChildNodes())
			{
				$children = $node->childNodes;
				for($i=0; $i<$children->length; $i++) 
				{
					$child = $children->item($i);
					if($child->nodeName != '#text') 
					{
						if($occurance[$child->nodeName] > 1) 
							$result[$child->nodeName][] = $this->_process($child);
						else 
							$result[$child->nodeName] = $this->_process($child);
					}
					else if ($child->nodeName == '#text') 
					{
						$text = $this->_process($child);
						if (trim($text) != '') 
							$result[$child->nodeName] = $this->_process($child);
					}
				}
			} 
		}
		return $result;
	}
 
	function getResult() 
	{	
		if(empty($this->data)) $this->data=$this->_process($this->dom);
		return $this->data;
	}

}
