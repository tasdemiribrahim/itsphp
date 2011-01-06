<?php  
require_once('../../library/simpletest/autorun.php');  
require_once('../Helpers/input.php');  
require_once('../Helpers/Imager.php');

 class TestInput extends UnitTestCase 
 {  
	function testTemizYaziSayiTelEMailURLFunction()  
	{  
		$this->assertEqual(temizYazi("' OR ''='"),"' OR ''='");
		$this->assertEqual(temizYazi("İbrahim Taşdemir"),"İbrahim Taşdemir");
		$this->assertEqual(temizYazi("<script>alert('asd'); alert(\"asd\")</script>"),"alert('asd'); alert(\"asd\")");
		$this->assertEqual(temizSayi(""),"");
		$this->assertEqual(temizSayi("0"),"0");
		$this->assertEqual(temizSayi("İbrahim Taşdemir"),"0");
		$this->assertEqual(temizSayi("11"),"11");
		$this->assertEqual(temizTel("5546719441"),"5546719441");
		$this->assertEqual(temizTel("554-671-94-41"),"5546719441");
		$this->assertEqual(temizTel("554 671 94 41"),"5546719441");
		$this->assertEqual(temizTel("554.671.94.41"),"5546719441");
		$this->assertEqual(temizTel("ibrahim"),"");
		$this->assertEqual(temizEMail("deneme@den.com.tr"),"deneme@den.com.tr");
		$this->assertEqual(temizEMail("deneme"),"");
		$this->assertEqual(temizURL("http://tasdemir.0fees.net/common/input.php"),"http://tasdemir.0fees.net/common/input.php");$this->assertEqual(temizURL("<script>alert('asd'); alert(\"asd\")</script>"),"&lt;script&gt;alert('asd');alert(&quot;asd&quot;)&lt;/script&gt;");
	}  

	function testGuvenliResimFunction()
	{
		$imager = new main_Helpers_Imager();
		$file=array("error"=>1,'tmp_name'=>"/home/vol2/0fees.net/fees0_6133083/htdocs/main/images/agac.png","size"=>62000000,"type"=>'image/jpeg');
		$this->assertEqual("error1",$imager->upload($file));	
		$file["size"]=64000000;
		$this->assertEqual("error1",$imager->upload($file));
		$file["size"]=62000000;
		$file["error"]=2;
		$this->assertEqual("error2",$imager->upload($file));
		$file["error"]=3;
		$this->assertEqual("error3",$imager->upload($file));
		$file["error"]=4;
		$this->assertEqual("error4",$imager->upload($file));
		$file["error"]=5;
		$this->assertEqual("error5",$imager->upload($file));
		$file["error"]=0;
		$file["type"]="text/html";
		$this->assertEqual("error6",$imager->upload($file));
		$file["type"]="image/jpeg";
		$file["tmp_name"]="home/vol2/0fees.net/fees0_6133083/htdocs/yok.jpg";
		$this->assertEqual("error7",$imager->upload($file));
		$file["tmp_name"]="home/vol2/0fees.net/fees0_6133083/htdocs/mobil/index.php";
		$this->assertEqual("error8",$imager->upload($file));
	}
}  
  
  
  
  
  
  
  
  
  
  
  /*
  assertTrue($x) 	Fail if $x is false
assertFalse($x) 	Fail if $x is true
assertNull($x) 	Fail if $x is set
assertNotNull($x) 	Fail if $x not set
assertNotA($x, $t) 	Fail if $x is of the class or type $t
assertWithinMargin($x, $y, $m) 	Fail if abs($x  $y) < $m is false
assertOutsideMargin($x, $y, $m) 	Fail if abs($x  $y) < $m is true
assertIdentical($x, $y) 	Fail if $x == $y is false or a type mismatch
assertNotIdentical($x, $y) 	Fail if $x == $y is true and types match
assertReference($x, $y) 	Fail unless $x and $y are the same variable
assertClone($x, $y) 	Fail unless $x and $y are identical copies
assertNoPattern($p, $x) 	Fail if the regex $p matches $x
expectError($x) 	Swallows any upcoming matching error
assert($e)	Fail on failed expectation object $e
*/
