<?php  
class ControllerModulenews extends Controller {
	protected function index() {
		$this->language->load('module/news');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['news_id'] = $parts[0];
		} else {
			$this->data['news_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
							
		$this->load->model('catalog/news');
		$this->load->model('catalog/product');
		
		$this->data['news'] = array();
					
		$news = $this->model_catalog_news->getNewes(0);
		
		
		
		foreach ($news as $news) {
			$children_data = array();
			
			$children = $this->model_catalog_news->getnews($news['news_id']);
			
			$data = array(
				'filter_news_id'  => $news['news_id'],
				'filter_sub_news' => true	
			);		
				
			$product_total = $this->model_catalog_product->getTotalProducts($data);
						
			$this->data['news'][] = array(
				'news_id' => $news['news_id'],
				'name'        => $news['name'],
				'children'    => $children_data,
				'href'        => $this->url->link('product/news', 'news_id=' . $news['news_id'])
			);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news.tpl';
		} else {
			$this->template = 'default/template/module/news.tpl';
		}
		//$this->response->setOutput($this->render());
		$this->render();		
  	}
}
?>