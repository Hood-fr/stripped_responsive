<?php

function theme_activate($id, $version, &$errors)
{
  global $prefixeTable, $conf;

  if (!isset($conf['stripped_responsive']))
  {
    $config = array(
	'paramVersion' 					=> '2.3',
	
	'themeStyle'					=> 'original',
	'noLowercase'					=> false,
	'albumFrame'					=> false,
	'thumbFrame'					=> false,
	'showThumbLegend'				=> false,
    'menuOnRight'                   => true,

	'showTitleOnBrowsePath'			=> false,
	'imageFrame'					=> true,
	'imageCaption'					=> 'title',
	'imageArrows'					=> true,
	'HDlightbox'					=> true,
	'forceLightboxOn'				=> false,
	'defaultZoomSize'				=> 'fit',
	'animatedTabs'					=> true,
	'infoTabAdminOnly'				=> false,
	'defaultTab'					=> "none",

	'thumbSize'						=> "thumb",
	'imageSize'						=> "large",
	'hdSize'						=> "xxlarge",
	
	'imageAutosize'					=> true,
	'imageAutosizeMargin'			=> 40,
	'imageAutosizeMinHeight'		=> 200,

	'imagePreload'					=> false,
	'imagePreloadNb'				=> 5,
	'imagePreloadThumbs'			=> false,
	'imagePreloadHD'				=> false,

	'marginContainer'				=> 30,
	'paddingContainer'				=> 10,
	'highResClickMode'				=> 'zoom',
	'maxThumb'						=> 50,
      );
      
    $query = "
INSERT INTO " . CONFIG_TABLE . " (param,value,comment)
VALUES ('stripped_responsive' , '".pwg_db_real_escape_string(serialize($config))."' , 'Responsive stripped theme parameters');";

    pwg_query($query);
  }
}

function theme_deactivate()
{
  global $prefixeTable;

  $query = "DELETE FROM " . CONFIG_TABLE . " WHERE param='stripped_responsive';";
  pwg_query($query);
}

?>
