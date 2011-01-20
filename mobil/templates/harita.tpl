{include file="header.tpl" title="Harita"}

		<div data-role="fieldcontain">
			<select name="country">
				{html_options options=$countries selected=$country}
			</select>
			{html_radios name="yearly_revenue" options=$revenues selected=$revenue separator="<br />"}
			{html_checkboxes name="os" options=$oses selected=$os separator="<br />"}
			{html_select_date display_years=true}&nbsp;
			{html_select_time display_seconds=false minute_interval=15}
			<label for="slider">Value this site:</label>
			<select name="slider" id="slider" data-role="slider">
				<option value="off">Like</option>
				<option value="on">Dislike</option>
			</select>
			<select name="select-choice-1" id="select-choice-1">
				<option value="standard">Tired</option>
				<option value="standard">Happy</option>
				<option value="standard">Sick</option>
				<option value="standard">Sunny</option>
			</select>
		</div>
{include file="footer.tpl"}

