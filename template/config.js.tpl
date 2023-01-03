{* template for config variables assignation *}
{literal}
<script type="text/javascript">
// configuration options
var options = { {/literal}
	imageAutosize:{if $stripped_responsive.imageAutosize}true{else}false{/if},
	imageAutosizeMargin:{$stripped_responsive.imageAutosizeMargin},
	imageAutosizeMinHeight:{$stripped_responsive.imageAutosizeMinHeight},
{if $BODY_ID=='thePicturePage'}
	themeStyle:"{$stripped_responsive.themeStyle}",
	animatedTabs:{if $stripped_responsive.animatedTabs}true{else}false{/if},
	defaultTab:"{$stripped_responsive.defaultTab}",
	marginContainer:{$stripped_responsive.marginContainer},
	paddingContainer:{$stripped_responsive.paddingContainer},
	defaultZoomSize:"{$stripped_responsive.defaultZoomSize}",
	highResClickMode:"{$stripped_responsive.highResClickMode}",
{/if} 
{literal}
}
</script>
{/literal}