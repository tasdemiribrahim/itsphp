<?php
if(!empty($_REQUEST['fax']))
	exit;
if(!empty($_REQUEST['formKeyJS']))
{
    $formKey = base64_decode($_REQUEST['formKeyJS']);
    $formKeyDifference = time() - $formKey;
    if($formKeyDifference > 1800)
		exit;
}
if(isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] !='XMLHttpRequest')
	exit;
