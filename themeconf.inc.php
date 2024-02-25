<?php
/*
Theme Name: stripped_responsive
Version: 14.b
Description: Responsive stripped Theme
Theme URI: http://piwigo.org/ext/extension_view.php?eid=773
Author: JanisV
*/

global $conf, $user, $stripped_responsive;

$stripped_responsive = array_merge( unserialize( $conf['stripped_responsive'] ), (array)$stripped_responsive );


add_event_handler('init', 'set_config_values');
function set_config_values()
{
  global $template, $pwg_loaded_plugins, $stripped_responsive;
  $stripped_responsive['albumSize'] = ImageStdParams::get_custom(286, 286, 1, 286, 286);
  $template->assign(array(
                          'automatic_size_enabled'=> isset($pwg_loaded_plugins['automatic_size']),
                          'HDShadowbox_loaded'=> isset($pwg_loaded_plugins['HDShadowbox']),
                          'GMaps_loaded'=> isset($pwg_loaded_plugins['GMaps']),
                          'ThumbScroller_loaded'=> isset($pwg_loaded_plugins[ 'rv_tscroller' ]),
                          'usertags'=> isset($pwg_loaded_plugins['user_tags']),
                          'stripped_responsive'=> $stripped_responsive
                         ));
}
	
$themeconf = array(
  'parent' => 'default', 
  'load_parent_css' => false,
  'load_parent_local_head' => false,
  'name' => 'stripped_responsive',
  'theme_dir' => 'stripped_responsive',
  'icon_dir' => 'themes/stripped_responsive/icon',
  'img_dir'      => 'themes/stripped_responsive/images',
  'admin_icon_dir' => 'themes/default/icon/admin',
  'mime_icon_dir' => 'themes/default/icon/mimetypes/',
  'local_head' => 'local_head.tpl',
);

load_language('theme.lang', PHPWG_THEMES_PATH.'stripped_responsive/');

pwg_set_session_var('show_metadata', true);

// max number of thumbnails by page 

add_event_handler('loc_begin_index', 'modify_nb_thumbnail_page');
function modify_nb_thumbnail_page()
{
	global $user, $page, $stripped_responsive;

	if (!isset($stripped_responsive['maxThumb'])) { $stripped_responsive['maxThumb']=15;}
	$user['nb_image_page']=$stripped_responsive['maxThumb'];
	$page['nb_image_page']=$stripped_responsive['maxThumb'];
}

// Preload function

if (isset($stripped_responsive['imagePreload']) && ($user['theme'] == 'stripped_responsive')) {
	add_event_handler('loc_end_picture', 'assign_next_images_url');
}

function assign_next_images_url()
{
	global $page, $template, $conf, $stripped_responsive;

	$nb_image =$stripped_responsive['imagePreloadNb'];
	$nb_max = $page['last_rank'] - $page['current_rank'];
	$nb_image = min ($nb_image, $nb_max);

	if ($nb_image < 1) return;

	for ($n = 1; $n <= $nb_image; $n++) {
		$pagenext[$n] = $page['items'][ $page['current_rank'] + $n ];
	}

	$picturenext = array();
	$idnext = array();

	for ($n = 1; $n <= $nb_image; $n++) {
		array_push($idnext, $pagenext[$n]);
	}

	$query = '
	SELECT *
	  FROM '.IMAGES_TABLE.'
	  WHERE id IN ('.implode(',', $idnext).')
	;';

	$result = pwg_query($query);

	while ($rownext = pwg_db_fetch_assoc($result))
	{
		for ($n = 1; $n <= $nb_image; $n++) {
			if (isset($pagenext[$n]) and $rownext['id'] == $pagenext[$n]) {$in = $n;}
		}

		$picturenext[$in] = $rownext;

		$derivative = new DerivativeImage($stripped_responsive['imageSize'], new SrcImage($rownext));
		$picturenext[$in]['image_url'] = $derivative->get_url();
	}

	for ($n = 1; $n <= $nb_image; $n++) {
		if (isset($picturenext[$n]['image_url'])) { $image_next[$n] = $picturenext[$n]['image_url']; }
	}
  
  $template->assign('U_IMGNEXT', $image_next );

}

?>
