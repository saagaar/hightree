<?php  if ( !defined('BASEPATH')) exit('No direct script access allowed');

class Category_model extends CI_Model {
	public function __construct() 
	{
		parent::__construct();
	}
	
	public $validate_category =  array(
		array('field' => 'name', 'label' => 'Name', 'rules' => 'required'),
		//array('field' => 'short_desc', 'label' => 'Short Description', 'rules' => 'required'),
	);
		
	public $validate_subcategory =  array(
		array('field' => 'parent_id', 'label' => 'Category', 'rules' => 'required'),
		array('field' => 'name', 'label' => 'Name', 'rules' => 'required'),
		//array('field' => 'short_desc', 'label' => 'Short Description', 'rules' => 'required'),
	);
		
	
			
	public function get_all_categories()
	{	
		$this->db->where('parent_id','0');
		$this->db->order_by('id','desc');		
		$query = $this->db->get('product_categories');

		if ($query->num_rows() > 0)
		{
		   return $query->result();
		} 
		return false;
	}
	
	
	
	public function get_all_category_details()
	{	
		$this->db->where('parent_id','0');
		$this->db->order_by("last_update", "desc"); 		
		$query = $this->db->get('product_categories');

		if ($query->num_rows() > 0)
		{
		   return $query->result();
		} 
		return false;
	}
	
	
	
	public function get_visible_categories()
	{	
		$this->db->where('parent_id','0');
		$this->db->where('is_display','1');
		$this->db->order_by('id','desc');		
		$query = $this->db->get('product_categories');

		if ($query->num_rows() > 0)
		{
		   return $query->result();
		} 
		return false;
	}
	
	
	public function get_subcategories_by_parent_id($parent_id)
	{	
		$this->db->where('parent_id',$parent_id);
		$this->db->order_by("last_update", "desc"); 		
		$query = $this->db->get('product_categories');

		if ($query->num_rows() > 0)
		{
		   return $query->result();
		} 
		return false;
	}
	
	
	public function get_category_by_id($id)
	{		
		$query = $this->db->get_where('product_categories',array("id"=>$id));

		if ($query->num_rows() > 0)
		{
		   return $query->row();
		} 

		return false;
	}
	
	
	public function get_category_name_by_id($id)
	{		
		$this->db->select('name');
		$this->db->where('id',$id);
		$query = $this->db->get_where('product_categories');

		if ($query->num_rows() > 0)
		{
			$row = $query->row();
		   	return $row->name;
		} 

		return false;
	}
	
	
	
	public function insert_category()
	{
		$data = array(
			'name' => $this->input->post('name', TRUE), 
		   	'short_desc' => $this->input->post('short_desc', TRUE),
		   	'added_date' => $this->general->get_local_time('time'),
		   	'is_display' => $this->input->post('is_display', TRUE), 
			// 'display_menu' => $this->input->post('display_menu', TRUE), 
		);
		
		$this->db->insert('product_categories',$data);
		return $this->db->insert_id();
	}
	

	public function update_category($id)
	{
		$data = array(
			'name' => $this->input->post('name', TRUE), 
			'short_desc' => $this->input->post('short_desc', TRUE),
			'added_date' => $this->general->get_local_time('time'),
			'is_display' => $this->input->post('is_display', TRUE),
			// 'display_menu' => $this->input->post('display_menu', TRUE)
		);
		
		$this->db->where('id', $id);
		$this->db->update('product_categories', $data);
		
		return true;
	}
	
	
	public function insert_sub_category()
	{
		$data = array(
			'parent_id' => $this->input->post('parent_id', TRUE), 
		   	'name' => $this->input->post('name', TRUE), 
		   	'short_desc' => $this->input->post('short_desc', TRUE),
		   	'added_date' => $this->general->get_local_time('time'),
		   	'is_display' => $this->input->post('is_display', TRUE),
			// 'display_menu' => $this->input->post('display_menu', TRUE), 
		);
		
		$this->db->insert('product_categories',$data);
		return $this->db->insert_id();
	}
	
	
	public function update_sub_category()
	{
		$data = array(
			'parent_id' => $this->input->post('parent_id', TRUE),
			'name' => $this->input->post('name', TRUE), 
			'short_desc' => $this->input->post('short_desc', TRUE),
			'added_date' => $this->general->get_local_time('time'),
			'is_display' => $this->input->post('is_display', TRUE),
			// 'display_menu' => $this->input->post('display_menu', TRUE),          
		);
			
		//only if new img is uploaded
		if(isset($this->image_name_path) && $this->image_name_path !="")
		{
			//@unlink('./'.$this->input->post('old_img'));
			$data['image'] = $this->image_name_path;
		}
			
		$id = $this->uri->segment(4);
		$this->db->where('id', $id);
		$this->db->update('product_categories', $data);
		return $id;
	}
	
}
