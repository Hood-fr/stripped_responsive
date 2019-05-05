<?php

global $conf;

load_language('theme.lang', PHPWG_THEMES_PATH.'stripped_responsive/');

$config= array ();

if(isset($_POST['submit_stripped']))
{
	$config['paramVersion']='2.3';

	$config['themeStyle']=$_POST['f_themeStyle'];
	$config['noLowercase']=!isset($_POST['f_forceLowercase']);
	$config['albumFrame']=isset($_POST['f_albumFrame']);
	$config['thumbFrame']=isset($_POST['f_thumbFrame']);
	$config['showThumbLegend']=isset($_POST['f_showThumbLegend']);
	$config['menuOnRight']=isset($_POST['f_menuOnRight']);

	$config['showTitleOnBrowsePath']=isset($_POST['f_showTitleOnBrowsePath']);
	$config['imageFrame']=isset($_POST['f_imageFrame']);
	$config['imageCaption']=$_POST['f_imageCaption'];
	$config['imageArrows']=isset($_POST['f_imageArrows']);
	$config['HDlightbox']=($_POST['f_lightboxOptions'] != 'never');
	$config['forceLightboxOn']=($_POST['f_lightboxOptions'] == 'always');
	$config['defaultZoomSize']=$_POST['f_defaultZoomSize'];
	$config['animatedTabs']=isset($_POST['f_animatedTabs']);
	$config['infoTabAdminOnly']=isset($_POST['f_infoTabAdminOnly']);
	$config['defaultTab']=$_POST['f_defaultTab'];

	$config['thumbSize']=$_POST['f_thumbSize'];
	$config['imageSize']=$_POST['f_imageSize'];
	$config['hdSize']=$_POST['f_hdSize'];

	$config['imageAutosize']=isset($_POST['f_imageAutosize']);
	if (isset($_POST['f_imageAutosizeMargin'])) { $config['imageAutosizeMargin']=intval($_REQUEST['f_imageAutosizeMargin']); }
	if (isset($_POST['f_imageAutosizeMinHeight'])) { $config['imageAutosizeMinHeight']=intval($_REQUEST['f_imageAutosizeMinHeight']); }

	$config['imagePreload']=isset($_POST['f_imagePreload']);
	$config['imagePreloadNb']=$_POST['f_imagePreloadNb'];
	$config['imagePreloadThumbs']=isset($_POST['f_imagePreloadThumbs']);
	$config['imagePreloadHD']=false;

	$config['marginContainer']=30;
	$config['paddingContainer']=10;
	$config['highResClickMode']='zoom';
	$config['maxThumb']=50;

	conf_update_param('stripped_responsive', pwg_db_real_escape_string(serialize($config)));

	array_push($page['infos'], l10n('Responsive stripped Configuration updated'));

  load_conf_from_db();
}

$template->set_filenames(array(
    'theme_admin_content' => dirname(__FILE__) . '/admin.tpl'));

$template->assign('options', unserialize($conf['stripped_responsive']));

$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');
  
?>
