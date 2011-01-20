{include file="header.tpl" title="Müzik Tavsiyeleri"}

		<h2>Müzik Tavsiyeleri</h2>
		{assign var = "turVeri" value = ""}
		{foreach key=deger item=dizi from=$rows}
			{if $turVeri ne $dizi["tur"]}
				{if $turVeri ne ""}
					;
				{/if}
				{assign var = "turVeri" value = $dizi["tur"]}
				<br /><b>{$turVeri}:</b>
			{else}
				,
			{/if}
			<a href='muzik.php?id={$dizi["grupID"]}'>{$dizi["grupAd"]}</a>
		{/foreach}
		;
		<h3>{$row["memleket"]}'den {$row["grupAd"]}</h3>
		<a href='http://www.youtube.com/watch?v={$row["grupClip"]}' rel='nofollow' target='_blank'>Klibini izle</a>
		<img title='{$row["grupAd"]}' src='{$resim}' alt='{$row["grupAd"]}' /><br />
		{$row["tanim"]}
		<h4>Elemanlar</h4>
		<ul>
			{foreach item=dizi from=$elemanlar}
				<li>{$dizi['elemanAd']}({$dizi['enstruman']})</li>
			{/foreach}
		</ul>
		<h4>Albümler</h4>
		<ul>
			{foreach item=dizi from=$albumler}
				<li>{$dizi['albumYil']}-{$dizi['albumAd']}</li>
			{/foreach}
		</ul>

{include file="footer.tpl"}
