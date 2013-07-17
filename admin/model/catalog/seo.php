<?php
class ModelCatalogSeo extends Model {
	public function saveSeoUrl($id, $title, $field) {
		$title = $this->convert($title);
		
		$title = preg_replace('/["]/', '-', $title);
		$title = preg_replace('/\W+/', '-', $title);
		$title .= '-' . $id . '.html';		
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = '$field=" . (int)$id . "', keyword = '" . $this->db->escape($title) . "'");
	}
	public function categorySeoUrl($id, $title, $field) {
		$title = $this->convert($title);
		$title = preg_replace('/["]/', '-', $title);
		$title = preg_replace('/\W+/', '-', $title);
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = '$field=" . (int)$id . "', keyword = '" . $this->db->escape($title) . "'");
	}	
	function convert($str) {
		
		$str = html_entity_decode($str);
	 	$str = mb_convert_case($str,MB_CASE_TITLE,'utf-8');
	 	$str = trim(strtolower($str));
		$str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
		$str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
		$str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
		$str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
		$str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
		$str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
		$str = preg_replace("/(đ|Đ)/", 'd', $str);
		//$str = str_replace(' ', '-', $str);
		return $str;
     }
}