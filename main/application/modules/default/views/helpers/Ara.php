<?php
class Zend_View_Helper_Ara extends Zend_View_Helper_Abstract
{
	public function ara()
	{
		return '<h3 class="ui-widget ui-widget-header">Arama Formu</h3>
			<form id="sf" action="/main/" role="search"><br />
				<input type="search" name="q" id="q" placeholder="Ara.." required aria-required />
				<input type="submit" class="bonBonButton xs drop pink glass" value="" />
				<section class="sakla">
					<input type="radio" name="check" value="site" id="ss" checked/>
					<label for="ss">Bu sitede</label>
					<input type="radio" name="check" value="web" id="sw"/>
					<label for="sw">Nette</label>
				</section>
				<nav role="navigation" class="sakla">
					<ol class="sakla">
						<li class="web" title="Sayfa Ara" data-st="web">Net</li>
						<li class="images" title="Resim Ara" data-st="images">Resim</li>
						<li class="news" title="Haber Ara" data-st="news">Haber</li>
						<li class="videos" title="Görüntü Ara" data-st="video">Görüntü</li>
					</ol>
				</nav>
				<br class="clear"/>
			</form>';
	}
}

