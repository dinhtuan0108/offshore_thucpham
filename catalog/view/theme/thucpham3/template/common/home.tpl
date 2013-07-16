<?php /* echo $header; ?>
<div id="content-wrapper">
	<?php echo $column_left; ?>
	<?php echo $column_right; ?>
	<div id="content">
	<?php echo $content_top; ?>
	<h1 style="display: none;"><?php echo $heading_title; ?></h1>
	<?php echo $content_bottom; ?>
	</div>
</div>
<?php echo $footer; */ ?>

<?php echo $header; ?>
	<div class="content-top">
		<div>
			<h1 style="display: none;"><?php echo $heading_title; ?></h1>
			
			<div style="width: 740px; float: left;">
				<?php echo $content_top; ?>
			</div>
			<div style="width: 250px; float: left; margin-left: 10px;">
				<?php echo $column_left; ?>
			</div>
		</div>

	</div>
	<div class="content-bottom">
		<?php echo $content_bottom; ?>
	</div>
</div>
<?php echo $footer; ?>