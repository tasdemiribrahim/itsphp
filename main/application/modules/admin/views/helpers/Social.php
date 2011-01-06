<?php
class Zend_View_Helper_Social extends Zend_View_Helper_Abstract
{
	public function social()
	{
		$url=urlencode(getSiteName()."main/".$this->view->url);
		$title=urlencode($this->view->title." | ITSPHP");
		$title2="İbrahim Taşdemir'in Kişisel Ana Sayfası - ".$this->view->h2;
		$username="tasdemiribrahim";
		return '<a target="_blank" class="delicious-button"  href="http://delicious.com/save" data-button="{url:location.href ,title:document.title}">Delicious</a>
			<!-- AddThis Button BEGIN -->
			<div class="addthis_toolbox addthis_default_style iframe">
			<a class="addthis_counter"></a>
			</div>
			<script>var addthis_config = {"data_track_clickback":true};</script>
			<script src="http://s7.addthis.com/js/250/addthis_widget.js#username='.$username.'"></script>
			<!-- AddThis Button END -->
			<input type="hidden" value="'.$url.'" name="URL" id="URL" />';
	}
}

