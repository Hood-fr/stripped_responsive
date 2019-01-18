{html_style}
#footer {
  display: none;
}
{/html_style}

<script>
var image_w = {$item_height};
var image_h = {$item_height};
</script>

<div id="slideshow" class="fotorama-slideshow">
  <div id="content">
	<div id="theImage">
      {include file=$FOTORAMA_CONTENT_PATH}
	</div>
  </div>
</div>
