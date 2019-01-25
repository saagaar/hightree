<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin_dashboard extends CI_Model 
{

	public function __construct() 
	{
		parent::__construct();
		
	}
	
	public function get_total_products()
	{
		$this->db->limit(7);
		$this->db->order_by('id','desc');
		$result=$this->db->get('car_management');
		if($result):
			return $result->result();
		else:
			return false;
		endif;	
		
	}
	
	function total_site_commissions()
	{
		// $this->db->select('SUM( quantity * sale_commission ) as totalcommission');
		// $this->db->from('product_order');
		// $this->db->where('status !=',1);
		// $query = $this->db->get();
		// if($query->num_rows() > 0)
		// {
		// 	$data = $query->row();
		// 	return $data->totalcommission;
		// }
		// return false;
	}
	
	function get_total_revenue($transaction_type="")
	{
		$this->db->select('SUM( amount ) as total_amount');
		$this->db->from('transaction');
		$this->db->where('transaction_status','Completed');
		$this->db->where('transaction_type', $transaction_type);
		
		$query = $this->db->get();
		if($query->num_rows() > 0)
		{
			$data = $query->row();
			return $data->total_amount;
		}
		return 0;
	}
	
	function count_total_sold_products()
	{
		//count the sales order from sales order table
		$this->db->where('payment_status', 'Completed');
		$query = $this->db->get('product_winner');
		
		//echo $this->db->last_query(); exit;
		if($query->num_rows()>0)
		{
			$data = $query->row();
		}
		return 0;
	}
	
	
	public function get_admin_recent_inbox()
	{
     	$admin_id=$this->session->userdata(ADMIN_LOGIN_ID);
	    $this->db->where('msg_to_user_id',$admin_id); 
        $this->db->where('status !=',3); 
        $this->db->order_by("msg_date", "desc");
        $this->db->limit(6);
       
	   	$query = $this->db->get('member_msg');
           //echo $this->db->last_query();
        if ($query->num_rows() > 0){
               return $query->result();
        }
        else{
        	return false;
       	}
    }
	
	public function get_recent_members()
	{
		$this->db->select('id, username, email, reg_date,');
		$this->db->where('status',1);
		$this->db->where_in('user_type',array('3', '4'));
		$this->db->order_by("reg_date", "DESC");
        $this->db->limit(6);
		$query = $this->db->get('members');
		
		//echo $this->db->last_query();
		
		if($query->num_rows() >0)
		{
			return $query->result();
		}
		return false;
	}
	
	
	public function get_recent_products()
	{
		$this->db->select('P.name, P.seller_id, P.post_date, PC.name as cat_name');
		$this->db->from('products P');
		$this->db->join('product_categories PC', 'P.cat_id = PC.id', 'left');
		// $this->db->where('P.listing_payment_status','1');
		$this->db->order_by("P.post_date", "DESC");
		$this->db->limit(6);
		$query = $this->db->get();

		if ($query->num_rows() > 0)
		{
		  return $query->result();
		}
		return FALSE;
	}
	
}
