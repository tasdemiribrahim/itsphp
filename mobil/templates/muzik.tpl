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
			<a href='muzik.php?id={$dizi["id"]}'>{$dizi["ad"]}</a>
		{/foreach}
		;
		<h3>{$row["mem"]}'den {$row["ad"]}</h3>
		<a href='http://www.youtube.com/watch?v={$row["clip"]}' rel='nofollow' target='_blank'>Klibini izle</a>
		<img title='{$row["ad"]}' src='{$resim}' alt='{$row["ad"]}' /><br />
		{$row["tanim"]}
		<p><b>Elemanlar:</b>
			{foreach item=dizi from=$elemanlar name=el}
				{$dizi['ad']}({$dizi['ens']})
				{if not $smarty.foreach.el.last}
					,&nbsp;
				{/if}
			{/foreach};
		</p>
		<p><b>Albümler:</b>
			{foreach item=dizi from=$albumler name=al}
				{$dizi['yil']}-{$dizi['ad']}
				{if not $smarty.foreach.al.last}
					,&nbsp;
				{/if}
			{/foreach};
		</p>

{include file="footer.tpl"}
