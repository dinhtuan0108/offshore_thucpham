<?php echo $header; ?>
<div id="content-wrapper">
	<?php echo $column_left; ?><?php echo $column_right; ?>
	<div id="content"><?php echo $content_top; ?>
	  <div class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	    <?php } ?>
	  </div>
	  <h1><?php echo $heading_title; ?></h1>
	  <hr style="margin: 0;" />
	  <div class="news-wrapper">
	  	<?php foreach($news_list as $news) : ?>
	  	<div class="news">
	  		<div class="news-image">
		  		<?php if(isset($news['image'][0]) && $news['image'][0]): ?>
		  		<a href="<?php echo $news['href'] ?>" title="<?php echo $news['name'] ?>">
					<img <?php echo implode(' ', $news['image'][0]) ?> />
				</a>
		  		<?php endif ?>			  
		  	</div>
		  	<div class="news-content">
				<h5><a href="<?php echo $news['href'] ?>" title="<?php echo $news['name'] ?>"><?php echo $news['name'] ?></a></h5>
				<span class="news-date">
					<?php echo $news['date_added'] ?>
				</span> 
				<div class="news-desc">
					<?php echo $news['description'] ?>
				</div>	  
		  	</div>

	  	</div>
	  	<?php endforeach; ?>

	  	<div class="news">
			<?php echo $pagination ?>  
		</div>
	  </div>
	  <?php echo $content_bottom; ?></div>
</div>
<?php echo $footer; ?>