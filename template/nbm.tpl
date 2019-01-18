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
		<div class="content_block">
			{include file='infos_errors.tpl'} 
		</div>
	</div>
    {if $stripped_responsive.menuOnRight}
	  {if isset($MENUBAR)}{$MENUBAR}{/if}
    {/if}
    <div style="clear: both;"></div>
</div>