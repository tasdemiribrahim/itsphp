<?php  
$js = '';   
for ($i = 0, $j = count($jsfiles); $i < $j; $i++)   
{  
	$fn = $jsfiles[$i];  
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $fn);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$jscode = curl_exec($ch);
	curl_close($ch);  
	$js .= $jscode . "\n";  
}  
$jsfiles = array("jquery/jquery.twitter.search.js","jquery/jquery.twitterpopup.js","jquery/jquery.html5form-1.2-min.js","main.js");  
for ($i = 0, $j = count($jsfiles); $i < $j; $i++)   
{  
	$fn = $jsfiles[$i];  
	$jscode = @file_get_contents($fn);  
	$js .= $jscode . "\n";  
}  

$js .= '  
  MediaQueryFallBack.LoadCss([], "/main/css/handheld.css", 480);
  
	  
	// ------------------
	// Copyright 2010 Kevin Lieser, kleaserarts - Mediendesign
	// info@ka-mediendesign.de, www.ka-mediendesign.de
	// ------------------
	var fbVObject=document.getElementsByTagName("body");for(i=0;i<fbVObject.length;i++){var fbRObject=fbVObject[i].innerHTML;var fbRObject=fbRObject.replace(/<!-- FBML /g,"");var fbRObject=fbRObject.replace(/ FBML -->/g,"");fbVObject[i].innerHTML=fbRObject;}

	
	  window.fbAsyncInit = function() {
	FB.init({appId: "124214627626880", status: true, cookie: true,xfbml: true});
	  };
	  (function() {
		var e = document.createElement("script"); e.async = true;
		e.src = document.location.protocol + "//connect.facebook.net/en_US/all.js";
		document.getElementById("fb-root").appendChild(e);
	  }());
  
	
	';
#
# $js = '';       // code to compress  
# $jscomp = '';           // compressed JS  
#   $apiArgs = array(  
#     'compilation_level'=>'ADVANCED_OPTIMIZATIONS',  
#     'output_format' => 'text',  
#     'output_info' => 'compiled_code'  
#    );  
#    $args = 'js_code=' . urlencode($js);  
#    foreach ($apiArgs as $key => $value) {  
#      $args .= '&' . $key .'='. urlencode($value);  
#    }  
#   $call = curl_init();  
#   curl_setopt_array($call, array(  
#     CURLOPT_URL =>   'http://closure-compiler.appspot.com/compile',  
#     CURLOPT_POST => 1,  
#     CURLOPT_POSTFIELDS => $args,  
#     CURLOPT_RETURNTRANSFER => 1,  
#     CURLOPT_HEADER => 0,  
#     CURLOPT_FOLLOWLOCATION => 0  
#   ));  
#   $jscomp = curl_exec($call);  
#   curl_close($call);  
#	header('Content-type: text/javascript');   
#	echo $jscomp;   
header('Cache-Control: max-age=2592000, public');
header('Expires-Active: On');
header('Expires: Fri, 1 Jan 2500 01:01:01 GMT');
header('Pragma:');
header('Content-type: text/javascript; charset=utf-8');
 
echo $js;   

/*
heliohost için Adsense ekle
<script type="text/javascript">
window.google_analytics_uacct = "UA-17794118-1";
</script>
*/
