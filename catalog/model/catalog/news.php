<?php
class ModelCatalognews extends Model {
	public function getnews($news_id) {
	
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "news c LEFT JOIN " . DB_PREFIX . "news_description cd ON (c.news_id = cd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store c2s ON (c.news_id = c2s.news_id) WHERE c.news_id = '" . (int)$news_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row;
	}
	
	public function getNewes($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news c LEFT JOIN " . DB_PREFIX . "news_description cd ON (c.news_id = cd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store c2s ON (c.news_id = c2s.news_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
		
		return $query->rows;
	}

	public function getNewesByParentId($news_id) {
		$news_data = array();
		
		$news_data[] = $news_id;
		
		$news_query = $this->db->query("SELECT news_id FROM " . DB_PREFIX . "news WHERE parent_id = '" . (int)$news_id . "'");
		
		foreach ($news_query->rows as $news) {
			$children = $this->getNewesByParentId($news['news_id']);
			
			if ($children) {
				$news_data = array_merge($children, $news_data);
			}			
		}
		
		return $news_data;
	}
		
	public function getnewsLayoutId($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_layout WHERE news_id = '" . (int)$news_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_news');
		}
	}
					
	public function getTotalNewesBynewsId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news c LEFT JOIN " . DB_PREFIX . "news_to_store c2s ON (c.news_id = c2s.news_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row['total'];
	}
}
?>