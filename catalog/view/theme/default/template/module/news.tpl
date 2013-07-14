<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-news">
      <ul>
        <?php
		
		 foreach ($news as $news) { ?>
        <li>

          <?php if ($news['news_id'] == $news_id) { ?>
          <a href="<?php echo $news['href']; ?>" class="active"><?php echo $news['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a>
          <?php } ?>

        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
