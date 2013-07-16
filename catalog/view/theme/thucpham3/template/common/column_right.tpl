<?php if ($modules) { ?>
<div id="column-right">
	<div class="box">
		<div class="box-heading">Menu</div>
		<div class="box-content">
			<ul class="box-category" >
				<li><a href="<?php echo $home; ?>" id="wishlist-total"><?php echo $text_home; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
				<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
				
			</ul>				
		</div>
	</div>
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</div>
<?php } ?>
