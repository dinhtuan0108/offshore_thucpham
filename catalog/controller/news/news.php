<?php 
class ControllerNewsNews extends Controller {  
	public function index() { 
		$this->language->load('module/news');
		
		$this->load->model('catalog/news');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = 10;
		}
					
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);
   		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get($this->language->get('heading_title')),
			'href'      => $this->url->link('news/news'),
       		'separator' => $this->language->get('text_separator')
   		);
		
		if (isset($this->request->get['category_id'])) {
			$category_id = $this->request->get['category_id'];
		} else {
			$category_id = 1;
		}
		
		$data = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit,
			'category_id'		 => $category_id 
		);	
		$news_total = $this->model_catalog_news->getTotalNewes($data);

		
		if ($news_total) {

	  		$this->document->setTitle($this->language->get('heading_title'));
//			$this->document->setDescription($news_info['meta_description']);
//			$this->document->setKeywords($news_info['meta_keyword']);
			
			$this->data['heading_title'] = $this->language->get('heading_title');
			
			if (isset($this->request->get['category_id']) && ($this->request->get['category_id'] == 2)) {
				$this->data['heading_title'] = 'Tin khuyến mãi';
				$this->document->setTitle('Tin khuyến mãi');
			}
			
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			
			foreach ($news_total as $news) {
				preg_match_all('/(alt|src)=("[^"]*")/i', html_entity_decode($news['description'], ENT_QUOTES, 'UTF-8'), $newsImage);
				$descString = substr(strip_tags(html_entity_decode($news['description'], ENT_QUOTES, 'UTF-8')), 0, 400);
				$explodedDesc = explode(' ', $descString);
				array_pop($explodedDesc);
				$desc = implode(' ', $explodedDesc);
				
				$this->data['news_list'][] = array(
					'news_id'		=> $news['news_id'],
					'name'	 		=> $news['name'],
					'image'			=> $newsImage,
					'date_added'	=> $news['date_added'],
					'description' 	=> $desc . '...',
					'href'        	=> $this->url->link('product/news', 'news_id=' . $news['news_id'])
				);				
			}					
			
			$pagination = new Pagination();
			$pagination->total = $this->model_catalog_news->getNewsCount();
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('news/news', 'page={page}');
			if (isset($this->request->get['category_id'])) {
				$category_id = $this->request->get['category_id'];
				$pagination->url = $this->url->link('news/news', 'page={page}&category_id=' . $category_id);	
			}
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/news.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/news.tpl';
			} else {
				$this->template = 'default/template/news/news.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
	
			$this->response->setOutput($this->render());										
    	} else {
			$url = '';
			
			if (isset($this->request->get['news_id'])) {
				$url .= '&path=' . $this->request->get['news_id'];
			}
									
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/news', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
					
			$this->response->setOutput($this->render());
		}
  	}
}
?>