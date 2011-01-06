{include file="header.tpl" title="Harita"}

		<select name="country">
			{html_options options=$countries selected=$country}
		</select>
		{html_radios name="yearly_revenue" options=$revenues selected=$revenue separator="<br />"}
		{html_checkboxes name="os" options=$oses selected=$os separator="<br />"}
		{html_select_date display_years=true}&nbsp;
		{html_select_time display_seconds=false minute_interval=15}

{include file="footer.tpl" script="main"}

