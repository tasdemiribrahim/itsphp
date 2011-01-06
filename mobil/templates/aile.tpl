{include file="header.tpl" title="Aile Ağacı"}

		<h2>Aile Ağacı</h2>
		<ul data-role='listview' data-inset='true' data-dividertheme='a'>
			{if !!$aileAd}
				<li data-role='list-divider'>{$aileAd|capitalize}</li>
			{/if}
			{foreach item=row from=$rows}
				<li class="{cycle values='ODD, EVEN'}"><a href="aile.php?id={$row['aileID']}">{$row['aileAd']}</a></li>
			{/foreach}
		</ul>
		<br /><br /><br />
		<div data-role='collapsible' data-collapsed='true'>
			<h3>{$record["aileAd"]}</h3>
			<img src='{$resim}' alt='{$record["aileAd"]}' title='{$record["aileAd"]}' /><br />
			<p><b>Doğum:</b>{$record["aileDogum"]}</p>
			<p><b>Ölüm:</b>{$record["aileOlum"]}</p>
			<p><b>Eşi:</b>{$record["aileBireyEs"]}</p>
			<p><b>Adres:</b>{$record["aileBireyAdres"]}</p>
			<p><b>Mail:</b><a href='mailto:{$record["aileBireyMail"]}'>{$record["aileBireyMail"]}</a></p>
			<p><b>Tel:</b><a href='tel:{$record["aileBireyTel"]}'>{$record["aileBireyTel"]}</a></p>
			<p><b>MSN:</b>{$record["aileBireyMSN"]}</p><p><b>Twitter:</b>{$record["aileBireyTwitter"]}</p>
			<p>{$record["aileTanim"]}</p>
		</div>

{include file="footer.tpl"}
