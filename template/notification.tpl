{html_head} 
<link rel="alternate" type="application/rss+xml" title="{'Photos only RSS feed'|@translate}" href="{$U_FEED_IMAGE_ONLY}"> 
<link rel="alternate" type="application/rss+xml" title="{'Complete RSS feed (photos, comments)'|@translate}" href="{$U_FEED}"> 
{/html_head}
<div class="titrePage">
	<div class="browsePath">
		<h2>
			<a href="{$U_HOME}">{'Home'|@translate}</a>
			{$LEVEL_SEPARATOR}{'Notification'|@translate}
		</h2>
	</div>
</div>
<div id="content">
    {if !$stripped_responsive.menuOnRight}
	  {if isset($MENUBAR)}{$MENUBAR}{/if}
    {/if}
	<div id="content_cell">
		<div class="content_block notification">
			<p>{'The RSS notification feed provides notification on news from this website : new photos, updated albums, new comments. Use a RSS feed reader.'|@translate}</p>
			<ul>
				<li><a href="{$U_FEED_IMAGE_ONLY}">{'Photos only RSS feed'|@translate}</a></li>
				<li><a href="{$U_FEED}">{'Complete RSS feed (photos, comments)'|@translate}</a></li>
			</ul>
		</div>
	</div>
    {if $stripped_responsive.menuOnRight}
	  {if isset($MENUBAR)}{$MENUBAR}{/if}
    {/if}
    <div style="clear: both;"></div>
</div>