<div class="titrePage">
	<div class="browsePath">
		<h2>
			<a href="{$U_HOME}">{'Home'|@translate}</a>
			{$LEVEL_SEPARATOR}{'About'|@translate}
		</h2>
	</div>
</div>
<div id="content">
    {if !$stripped_responsive.menuOnRight}
	  {if isset($MENUBAR)}{$MENUBAR}{/if}
    {/if}
	<div id="content_cell">
		{include file='infos_errors.tpl'} 
		<div id="piwigoAbout" class="content_block">
			{$ABOUT_MESSAGE}
			{if isset($THEME_ABOUT) }
				<ul>
					<li>{$THEME_ABOUT}</li>
				</ul>
			{/if}
			{if not empty($about_msgs)}
				{foreach from=$about_msgs item=elt}
					{$elt}
				{/foreach}
			{/if}
		</div>
	</div>
    {if $stripped_responsive.menuOnRight}
	  {if isset($MENUBAR)}{$MENUBAR}{/if}
    {/if}
	<div style="clear: both;"></div>
</div>
