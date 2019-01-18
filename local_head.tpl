{if $load_css} 
	{combine_css path="themes/default/print.css" order=-10}

	{if !$stripped_responsive.noLowercase}
		{combine_css path="themes/stripped_responsive/lowercase.css" order=-10}
	{/if}

	{if ($stripped_responsive.themeStyle == 'black') }
		{combine_css path="themes/stripped_responsive/theme-black.css" order=-10}
	{else}
		{if ($stripped_responsive.themeStyle == 'white') }
			{combine_css path="themes/stripped_responsive/theme-white.css" order=-10}
		{else}
			{combine_css path="themes/stripped_responsive/theme-original.css" order=-10}
		{/if}
	{/if}

	<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="{$ROOT_URL}themes/stripped_responsive/fix-ie5-ie6.css">
		{if ($stripped_responsive.themeStyle != 'original') }
			<link rel="stylesheet" type="text/css" href="{$ROOT_URL}themes/stripped_responsive/fix-ie6-plus.css">
		{/if}
	<![endif]-->
	<!--[if lt IE 8]>
		<link rel="stylesheet" type="text/css" href="{$ROOT_URL}themes/stripped_responsive/fix-ie7.css">
	<![endif]-->

{/if}

{include file='config.js.tpl'}

{if $BODY_ID=='thePicturePage'}
	{combine_script id='scripts-tpp' load='header' require='jquery' path='themes/stripped_responsive/js/scripts-tpp.js'}
{else}
	{combine_script id='scripts-tcp' load='header' require='jquery.ui.effect-blind' path='themes/stripped_responsive/js/scripts-tcp.js'}
{/if}

{if isset($stripped_responsive.imagePreload)}
	{combine_script id='preload' load='header' require='jquery' path='themes/stripped_responsive/js/preload.js'}
{/if}

<script type="text/javascript">
	document.documentElement.className = 'js';
</script>