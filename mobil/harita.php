<?php include_once("admin/input.php"); ?>
<!DOCTYPE html>  
<html lang="tr">
<head>
	<meta charset="utf-8">
	<title>Harita | ITSPHP</title>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0a2/jquery.mobile-1.0a2.min.js"></script>
</head>
<body>
<img alt="<?php echo temizYazi($_GET['a']) ?>" src="http://maps.google.com/maps/api/staticmap?zoom=14&size=400x400&format=png&sensor=false&maptype=roadmap&markers=color:blue|size:normal|label:A|<?php echo urlencode(temizYazi($_GET['h'])); ?>" />
</body>
</html>
