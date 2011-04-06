<?php
class main_application_helpers_Models_Film implements Iterator,arrayaccess,Countable
{
	private $xml,$node,$i;
	const PATH='xml/film.xml';
	public function __construct() 
	{
		$this->xml = simplexml_load_file(self::PATH);
		$this->i=0;
	}

	public function rewind()
	{
		$this->i=0;
	}

	public function current()
	{
		list($key,$value)=each($this->xml->film[$this->i]["ad"]);
		return $value;
	}

	public function key() 
	{
		return $this->i;
	}

	public function next() 
	{
		$this->i++;
	}

	public function valid()
	{
		return (isset($this->xml->film[$this->i]) && !empty($this->xml->film[$this->i]["ad"]));
	}

	public function __sleep()
	{	
		$sonuc=array();
		foreach($this->xml as $film)
			$sonuc[$film["ad"]]=$film;
		return $sonuc;
	}

	public function __wakeup()
	{
		$this->xml = simplexml_load_file(self::PATH);
		$this->i=0;
		$this->rewind();
	}

	public function offsetSet($offset, $value) 
	{
	}

	public function offsetExists($offset) 
	{
		$film = $this->xml->xpath("/filmler/film[@ad='$offset']"); 
		$film = $film[0];
		return !empty($film) && isset($film["ad"]);
	}

	public function offsetUnset($offset) 
	{
	}

	public function offsetGet($offset) 
	{
		$last = $this->xml->xpath("/filmler/film[@ad='$offset']"); 
		$last = $last[0];
		return array_merge(array($last),$this->tmdb($last["ad"]));
	}

	public function count()
	{
		return count($this->xml);
	}

	public function getLast()
	{
		$last = $this->xml->xpath("/filmler/film[last()]"); 
		$last = $last[0];
		return array_merge(array($last),$this->tmdb($last["ad"]));
	}

	private function tmdb($ad)
	{
		require_once 'application/helpers/API/TMDb.php';
		$t = new TMDb(TMDB_API_KEY);
		$m = json_decode($t->searchMovie($ad));
		return  array_merge((array)$m[0],array("language"=>($m[0]->language=="en" ? "İngilizce" : $m[0]->language),"posters"=> isset($m[0]->posters[0]) ? $m[0]->posters[0]->image->url : "images/blankImage.jpg"));
	}
}
