<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin_site_settings extends CI_Model 
{

	public function __construct() 
	{
		parent::__construct();
		
	}
	
	// field validation
	public $validate_site_settings =  array(
			array('field' => 'site_name', 'label' => 'Website Name', 'rules' => 'required'),
			//array('field' => 'site_url', 'label' => 'Website URL', 'rules' => 'required'),
			array('field' => 'site_status', 'label' => 'Site Status', 'rules' => 'required'),
			
			array('field' => 'contact_email', 'label' => 'Contact Email', 'rules' => 'required|valid_email'),
			array('field' => 'contact_name', 'label' => 'Contact Name', 'rules' => 'required'),
			
			array('field' => 'system_email_address', 'label' => 'System Email Address', 'rules' => 'required'),
			array('field' => 'system_email_name', 'label' => 'System Name', 'rules' => 'required'),
			
			array('field' => 'currency_sign', 'label' => 'Currency Sign', 'rules' => 'required'),
			array('field' => 'currency_code', 'label' => 'Currency Code', 'rules' => 'required'),
			
			array('field' => 'user_activation', 'label' => 'Membership Activation', 'rules' => 'required'),
			array('field' => 'supplier_category_limit', 'label' => 'Supplier Expertise Category Limit', 'rules' => 'required'),
			array('field' => 'enable_rating', 'label' => 'Enable Rating', 'rules' => 'required'),
			
			array('field' => 'auction_post_activation', 'label' => 'Auction Post Activation', 'rules' => 'required'),
			array('field'=>'phone_no','label'=>'Phone Number','rules'=>'required|max_length[30]'),
			array('field'=>'skype','label'=>'Skype','rules'=>'max_length[30]'),
			array('field'=>'address1','label'=>'Address','rules'=>'required|max_length[100]'),
			array('field'=>'city','label'=>'City','rules'=>'required|max_length[100]'),
			array('field'=>'state','label'=>'State','rules'=>'max_length[100]'),
			array('field'=>'country_name','label'=>'Country','rules'=>'required|max_length[100]'),
			array('field'=>'copyright_info','label'=>'Footer Message','rules'=>'required|max_length[200]'),
			
			// array('field' => 'signup_bonus', 'label' => 'Signup Bonus', 'rules' => 'required|numeric'),
			
			// array('field' => 'minimum_images', 'label' => 'Minimum numbers of images', 'rules' => 'required|numeric'),
			// array('field' => 'maximum_images', 'label' => 'Maximum numbers of images', 'rules' => 'required|numeric'),
			// array('field' => 'seller_max_image_post', 'label' => 'Max numbers of Images', 'rules' => 'required|numeric'),
			// array('field' => 'seller_per_image_post_cost', 'label' => 'Per Image Post Cost', 'rules' => 'required|numeric'),
			// array('field' => 'seller_item_post_cost', 'label' => 'Item Post Cost', 'rules' => 'required|numeric'),
			// array('field' => 'item_selling_commission', 'label' => 'Item Selling Commission', 'rules' => 'required|numeric'),
			// array('field' => 'bid_fee', 'label' => 'Bid Fee', 'rules' => 'required'),
			// array('field' => 'item_approve_price', 'label' => 'Item Approve price', 'rules' => 'required|numeric'),
			
			// array('field' => 'bid_time', 'label' => 'Item Bid Time', 'rules' => 'required|numeric'),
			// array('field' => 'bid_price_increment', 'label' => 'Bid Price Increment', 'rules' => 'required|numeric'),
			// array('field' => 'auction_reset_time', 'label' => 'Auction Reset Time', 'rules' => 'required|numeric'),
			
			//array('field' => 'facebook', 'label' => 'Facebook Link', 'rules' => 'required'),
			//array('field' => 'twitter', 'label' => 'Twitter Link', 'rules' => 'required'),
			//array('field' => 'rss_url', 'label' => 'RSS Link', 'rules' => 'required'),
			
			// array('field' => 'facebook_app_id', 'label' => 'Facebook App Id', 'rules' => 'required'),
			// array('field' => 'googleplus_app_key', 'label' => 'Google Plus App Key', 'rules' => 'required'),
			// array('field' => 'googleplus_app_client_id', 'label' => 'Google Plus App Client Id', 'rules' => 'required'),
			
			// array('field' => 'google_analytics_code', 'label' => 'google Analytics Code', 'rules' => 'required|trim')	
	
			array('field' => 'timezone', 'label' => 'System Timezone', 'rules' => 'required'),

		);
	public $validate_sms_settings = array(
		array('field'=>'sms_gateway_url', 'label'=>'SMS Gateway Url', 'rules'=>'required'),
		array('field'=>'sms_api_username', 'label'=>'SMS API Username', 'rules'=>'required'),
		array('field'=>'sms_api_password', 'label'=>'SMS API Password', 'rules'=>'required'),

	); 
		
		
	public function file_settings_do_upload()
	{
		$config['upload_path'] = './'.WEBSITE_LOGO_PATH;//define in constants
		$config['allowed_types'] = 'gif|jpg|jpeg|png';
		$config['remove_spaces'] = TRUE;		
		//$config['max_size'] = '2000';
		$config['max_width'] = '300';
		$config['max_height'] = '100';

		// load upload library and set config				
		if(isset($_FILES['site_logo']['tmp_name']))
		{
			$this->upload->initialize($config);
			$this->upload->do_upload('site_logo');
		}		
	}
			
	public function get_site_setting()
	{		
		$query = $this->db->get('site_settings');

		if ($query->num_rows() > 0)
		{
		   return $query->row_array();
		} 

		return false;
	}
	
	
	public function update_site_settings($img_path)
	{
		$no_auction_post_free = $this->input->post('no_auction_post_free', TRUE);
		$is_auction_post_cost = $this->input->post('is_auction_post_cost', TRUE);
		$no_bid_place_free 	  = $this->input->post('no_bid_place_free', TRUE);
		$is_bid_place_cost    = $this->input->post('is_bid_place_cost', TRUE);

		if($no_auction_post_free == 0)
			$is_auction_post_cost = '1';
		if($no_bid_place_free == 0)
			$is_bid_place_cost = '1';

		$data = array(
			'site_name'               => $this->input->post('site_name', TRUE),
			'site_status'             => $this->input->post('site_status', TRUE),
			
			'currency_sign'           => $this->input->post('currency_sign', TRUE),
			'currency_code'           => $this->input->post('currency_code', TRUE),
			
			'log_admin_activity'      => $this->input->post('log_admin_activity', TRUE),
			'log_admin_invalid_login' => $this->input->post('log_admin_invalid_login', TRUE),
			
			'contact_name'            => $this->input->post('contact_name', TRUE),
			'contact_email'           => $this->input->post('contact_email', TRUE),
			'system_email_name'       => $this->input->post('system_email_name'),
			'system_email'            => $this->input->post('system_email_address'),			
			
			'user_activation'         => $this->input->post('user_activation', TRUE),
			'supplier_category_limit' => $this->input->post('supplier_category_limit', TRUE),
			'enable_rating' 		  => $this->input->post('enable_rating', TRUE),

			'no_auction_post_free'    => $no_auction_post_free,
			'is_auction_post_cost'    => $is_auction_post_cost,
			'no_bid_place_free'       => $no_bid_place_free,
			'is_bid_place_cost' 	  => $is_bid_place_cost,
			'auction_post_activation' => $this->input->post('auction_post_activation', TRUE),
			'phone_no' => $this->input->post('phone_no', TRUE),			
			'address1' => $this->input->post('address1', TRUE),			
			'skype' => $this->input->post('skype', TRUE),
			'city' => $this->input->post('city', TRUE),
			'state' => $this->input->post('state', TRUE),
			'country_name' => $this->input->post('country_name', TRUE),
			// 'seller_max_image_post' => $this->input->post('seller_max_image_post', TRUE),
			// 'seller_per_image_post_cost' => $this->input->post('seller_per_image_post_cost', TRUE),
			// 'seller_item_post_cost' => $this->input->post('seller_item_post_cost', TRUE),
			// 'bid_fee' => $this->input->post('bid_fee', TRUE),
			// 'item_selling_commission' => $this->input->post('item_selling_commission', TRUE),
			// 'item_approve_price' => $this->input->post('item_approve_price', TRUE),
			//'seller_permission' => $this->input->post('seller_permission', TRUE),
			
			// 'bid_time' => $this->input->post('bid_time', TRUE),
			// 'bid_price_increment' => $this->input->post('bid_price_increment', TRUE),
			// 'auction_reset_time' => $this->input->post('auction_reset_time', TRUE),
			
			'facebook' => $this->input->post('facebook', TRUE),
			'twitter' => $this->input->post('twitter', TRUE),
			'google_plus' => $this->input->post('google_plus', TRUE),
			'linkedin' => $this->input->post('linkedin', TRUE),
			
			// 'pinterest' => $this->input->post('pinterest', TRUE),
			//'rss_url' => $this->input->post('rss_url', TRUE),
			
			// 'facebook_app_id' => $this->input->post('facebook_app_id', TRUE),
			// 'googleplus_app_key' => $this->input->post('googleplus_app_key', TRUE),
			// 'googleplus_app_client_id' => $this->input->post('googleplus_app_client_id', TRUE),
			
			'google_analytics_code' => $this->input->post('google_analytics_code'),
			'timezone' => $this->input->post('timezone', TRUE),
			'copyright_info'=>$this->input->post('copyright_info',true)
			// 'sms_notification' => $this->input->post('sms_notification', TRUE),
		);
			
		if(SMS_NOTIFICATION==1){
			$name = array(
				'sms_gateway_url' => $this->input->post('sms_gateway_url', TRUE),
				'sms_api_username' =>$this->input->post('sms_api_username', TRUE),	
				'sms_api_password' =>$this->input->post('sms_api_password', TRUE),				);
			$data = array_merge($data, $name);
		}

		/*if(isset($img_path) && $img_path !="")
		{
			@unlink('./'.$this->input->post('img_old'));
			$data['site_logo'] = $img_path;
		}*/

		$this->db->update('site_settings', $data); 
		//echo $this->db->last_query(); exit;
		
		return true;
	}
}
