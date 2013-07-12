<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/thucpham/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php // echo $language; ?>
  <?php // echo $currency; ?>
  <?php // echo $cart; ?>
  <div class="top">
  	<?php if(isset($informations[4])) : ?>
	<a href="<?php echo $informations[4]['href']; ?>"><?php echo $informations[4]['title']; ?></a>
	|
	<?php endif; ?>
	<a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
	|
	<a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
  </div>
  <div id="search">
  	<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
    <div class="button-search"></div>
  </div>
  <?php /*
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
  */ ?>
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
  	<li>
		<a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
	</li>
	<?php if(isset($informations[4])) : ?>
	<li>
		<a href="<?php echo $informations[4]['href']; ?>"><?php echo $informations[4]['title']; ?></a>
	</li>
	<?php endif; ?>
    <?php foreach ($categories as $category) { ?>
    <li>
		<a href="<?php echo $category['href']; ?>">
			<?php echo $category['name']; ?>
		</a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
			<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
			<?php for (; $i < $j; $i++) { ?>
			<?php if (isset($category['children'][$i])) { ?>
			<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
    <li class="last">
		<a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
	</li>
  </ul>
</div>
<?php } ?>
<div id="notification"></div>
<div id="profile">
	<div class="profile-inner">
		<ul class="hotline">
			<li class="a">Hỗ trợ trực tuyến</li>
			<li class="b">
				Hotline 1: 
				<span>0988xxxxxx</span>
			</li>
			<li class="b">
				Hotline 2: 
				<span>0988xxxxxx</span>
			</li>
		</ul>
		<ul class="support">
			<li class="s1">
				Giới thiệu về chúng tôi
			</li>
			<li class="s2">
				Nhập hàng chính hãng giá gốc, bảo hành chính hãng - Mặt bằng thuận tiện cho việc mua hàng
			</li>
		</ul>
		<ul class="add">
			<li class="a1">
				Địa chỉ
			</li>
			<li class="a2">
				Giờ làm việc : Sáng 8h00 - 12h00
			</li>
			<li class="a3">
				Chiều 13h30 - 21h00
			</li>
		</ul>
	</div>
</div>
