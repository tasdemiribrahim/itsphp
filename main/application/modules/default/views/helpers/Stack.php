<?php
class Zend_View_Helper_Stack extends Zend_View_Helper_Abstract
{
	public function stack()
	{
		$yanit=array();
		$mesaj="";
		$params=array('sort' => 'featured', 'body' => 'true', 'answers' => 'false','tagged'=>'php');
		if(file_exists('StackPHP/Stack_Base.php') && file_exists('StackPHP/Post_Exchange.php'))
		{
			require_once 'StackPHP/Stack_Base.php';
			require_once 'StackPHP/Post_Exchange.php';

			$service = new Post_Exchange('stackoverflow', null, 0);
			$yanit = $service->unanswered($params);
		}
		elseif(function_exists('http_inflate'))
		{
			$response = json_decode(http_inflate(file_get_contents(sprintf('%s%s?%s', 'http://api.stackoverflow.com/1.0', '/questions', http_build_query(array_merge($params,array('type' => 'jsontext')))))));
			$yanit=$response->questions;
		}
		if($yanit[0])
		{
			$q=$yanit[0];
			$ts = new DateTime($q->creation_date);
			return "
			<details open>
				<summary class='st_r ui-widget ui-widget-header'>Günün Sorusu</summary>
				<article>
					<header> 
					 	<h4><a target='_blank' rel='nofollow' href='http://www.stackoverflow.com/questions/".$q->question_id."'>".$q->title."</a></h4>
					  	<small><time datetime='".$ts->format(DATE_ISO8601)."'>".$ts->format('\G\ü\n\: Y-m-d \S\a\a\t\: H:i')."</time> | ".$q->answer_count." cevap</small>
					</header> 
					<p>".$q->body."</p> 
				</article>
			</details>";
		}
	}
}

