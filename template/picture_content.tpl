{assign var=derivative value=$pwg->derivative($stripped_responsive.imageSize, $current.src_image)}

{if ((!isset($stripped_responsive.HDlightbox)) or ($stripped_responsive.HDlightbox))}
	{assign var='HDlightbox' value=true}
{/if}

{if isset($HDlightbox)}
	{if ($stripped_responsive.hdSize == 'original')}
		{if isset($U_ORIGINAL)}
			{assign var='displayHD' value=true}
			{assign var='HD_url' value=$U_ORIGINAL}
		{else}
			{foreach from=$current.unique_derivatives item=deriv key=derivative_type}
				{if ($deriv->get_type() == 'Original')}
					{assign var='HD_url' value=$deriv->get_url()}
					{if ($deriv->get_size() != $derivative->get_size())}
						{assign var='displayHD' value=true}
					{/if}
				{/if}
			{/foreach}
		{/if}
	{else}
		{assign var='HDderivative' value=$pwg->derivative($stripped_responsive.hdSize, $current.src_image)}
		{assign var='HD_url' value=$HDderivative->get_url()}
		{if (($HDderivative->get_size() != $derivative->get_size()) or ($stripped_responsive.hdSize == $stripped_responsive.imageSize))}
			{assign var='displayHD' value=true}
		{/if}
	{/if}
	{if ($stripped_responsive.forceLightboxOn)}
		{assign var='displayHD' value=true}
		{if !isset($HD_url)}
			{assign var='HD_url' value=$derivative->get_url()}
		{/if}
	{/if}
	{if isset($displayHD)}
		{if ($HDShadowbox_loaded)}
			{assign var='pwghigh' value=true}
		{else}
			{assign var='winhigh' value=true}
		{/if}
	{/if}
{/if}

{if ($stripped_responsive.imageArrows) }
    {if isset($previous)}
        <a href="{$previous.U_IMG}" class="img_nav img_prev" alt="{$previous.TITLE}"><span class="img_nav_content">&nbsp;</span></a>
    {/if}
{/if}
<div id="theImg" {if ($stripped_responsive.imageFrame)}class="img_frame"{/if}>
	{if isset($displayHD)}
		{if isset($pwghigh)}<a href="{$HD_url}" rel="shadowbox" class="hd_link">&nbsp;</a>{/if}
		{if isset($winhigh)}<div onclick="openDisplayHigh('{$HD_url}');" class="hd_link">&nbsp;</div>{/if}
		{if ($stripped_responsive.imagePreloadHD)}<div class="preload" style="display:none;">{$HD_url}</div>{/if}
	{/if}
	<img src="{$derivative->get_url()}" {$derivative->get_size_htm()} alt="{$ALT_IMG}" id="theMainImage" class="hideTabs">
</div>
{if ($stripped_responsive.imageArrows) }
    {if isset($next)}
        <a href="{$next.U_IMG}" class="img_nav img_next" alt="{$next.TITLE}"><span class="img_nav_content">&nbsp;</span></a>
    {/if}
{/if}
