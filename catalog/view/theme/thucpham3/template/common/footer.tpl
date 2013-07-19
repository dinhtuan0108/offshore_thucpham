<div class="footer-wrapper">
	<div id="footer">
	  <?php if ($categories) { ?>
	  <div class="column">
	    <h3><?php echo $text_categories; ?></h3>
	    <ul>
	      <?php foreach ($categories as $category) { ?>
	      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
	      <?php } ?>
	    </ul>
	  </div>
	  <?php } ?>
	  <div class="column">
	    <h3><?php echo $text_service; ?></h3>
	    <ul>
	      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
	      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
	    </ul>
	  </div>
	  <div class="column">
	    <h3><?php echo $text_extra; ?></h3>
	    <ul>
	      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
	      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
	      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
	      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
	    </ul>
	  </div>
	  <div class="column">
	    <h3><?php echo $text_account; ?></h3>
	    <ul>
	      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
	      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
	      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
	      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
	    </ul>
	  </div>
	  <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fecomwebpro&amp;width=1000&amp;height=208&amp;show_faces=true&amp;colorscheme=light&amp;stream=false&amp;show_border=false&amp;header=false&amp;appId=401582569900520" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:1000px; height:160px;" allowTransparency="true"></iframe>
	</div>
	
</div>
<div id="powered" >
			<h5><?php echo $store; ?></h5>
			
			<b><?php echo $text_address ?></b><?php echo $address; ?>
			<br />
	        <?php if ($telephone) { ?>
	        <b><?php echo $text_telephone; ?></b><?php echo $telephone; ?>	
		    <?php } ?>
	        <?php if ($fax) { ?>
	        <b><?php echo $text_fax; ?></b>
	        <?php echo $fax; ?>
	        <?php } ?><br />
			<?php echo $powered; ?>. Powered by <a href="http://ecomwebpro.com" target="_blank" style="color: #FFF;">EWP</a>
	</div>
</div>

</div>
</body></html>