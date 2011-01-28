{include file="header.tpl" title=""}

	{html_radios name="yearly_revenue" options=$revenues selected=$revenue separator="<br />"}
	{html_checkboxes name="os" options=$oses selected=$os separator="<br />"}
	{html_select_date display_years=true}&nbsp;
	{html_select_time display_seconds=false minute_interval=15}
	<label for="slider">Value this site:</label>
	<select name="select-choice-1" id="select-choice-1">
		<option value="standard">Tired</option>
		<option value="standard">Happy</option>
		<option value="standard">Sick</option>
		<option value="standard">Sunny</option>
	</select>

{include file="footer.tpl"}

