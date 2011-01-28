{include file="header.tpl" title="Aile Ağacı"}

		<h2>Aile Ağacı</h2>
		<ul data-role='listview' data-inset='true' data-dividertheme='a'>
			{if !!$ad}
				<li data-role='list-divider' role="heading" tabindex="0" class="ui-li ui-li-divider ui-bar-b ui-corner-top">{$ad|capitalize}</li>
			{/if}
			{foreach item=row from=$rows}
				<li class="{cycle values='ODD, EVEN'}"><a href="aile.php?id={$row['id']}">{$row['ad']}</a></li>
			{/foreach}
		</ul>
		<br /><br /><br />
		<div data-role='collapsible' data-collapsed='true'>
			<h3>{$record["ad"]}</h3>
			<img src='{$resim}' alt='{$record["ad"]}' title='{$record["ad"]}' /><br />
			<p><b>Doğum:</b>{$record["dogum"]}</p>
			<p><b>Ölüm:</b>{$record["olum"]}</p>
			<p><b>Eşi:</b>{$record["es"]}</p>
			<p><b>Adres:</b>{$record["adres"]}</p>
			{strip}
			{if $record["adres"] ne ""}				
				<p><a href="harita.php?h={$record["adres"]}&a={$record["ad"]}" data-rel="dialog">Haritada Göster</a></p>
			{/if}
			{/strip}
			<p><b>Mail:</b><a href='mailto:{$record["mail"]}' class="ui-link-inherit">{$record["mail"]}</a></p>
			<p><b>Tel:</b><a href='tel:{$record["tel"]}' class="ui-link-inherit">{$record["tel"]}</a></p>
			<p><b>Twitter:</b>{$record["twitter"]}</p>
			<p>{$record["tanim"]}</p>
		</div>

{include file="footer.tpl"}
