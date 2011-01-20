{include file="header.tpl" title=$film["film_ad"]}

		{foreach item=row from=$rows name="movie"}
			{strip}
				<a href='film.php?id={$row["id"]}'>{$row["film_ad"]}({$row["uzunluk"]})</a>
				{if not $smarty.foreach.movie.last}
					,&nbsp;
				{/if}
			{/strip}
		{/foreach}
		<h2>{$film["film_ad"]}</h2>

		<video controls="controls">
			<source src='{$film['mp4']}' type='video/mp4'></source>
			<source src='{$film['webm']}' type='video/webm'></source>
			<source src='{$film['ogg']}' type='video/ogg'></source>
			<object>
				<param name="movie" value="http://www.youtube.com/v/{$film['tube']}?version=3">
				<param name="allowFullScreen" value="true">
				<param name="allowScriptAccess" value="always">
				<embed src="http://www.youtube.com/v/{$film['tube']}?version=3" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always">
			</object>
		</video>
		<p><b>İndir:</b>
			Kapalı Format:	<a target='_blank' href='{$film['mp4']}'>'MP4'</a> 
			Açık Format:	<a target='_blank' href='{$film['ogg']}'>'OGG'</a>
			Google Format:	<a target='_blank' href='{$film['webm']}'>'WEBM'</a>
		</p><br />
		<p><b>Rating:</b>{$movies_result[0]->rating}/10,
		<b>Dil:</b>{if $movies_result[0]->language=="en"} İngilizce {else} {$movies_result[0]->language}{/if}</p>
		<p>{$movies_result[0]->overview}</p>

{include file="footer.tpl"}
