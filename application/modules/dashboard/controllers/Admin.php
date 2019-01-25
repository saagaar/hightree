<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller {

	function __construct() {
		parent::__construct();
		
		if ( ! $this->general->admin_logged_in())			
		{
			redirect(ADMIN_LOGIN_PATH, 'refresh');exit;
		}
		$this->load->model('admin_dashboard');
		
	}
	
	public function index()
	{
		$this->data[''] ='';
		
		//$this->data['total_products_in_stocks'] = '';
		/*$this->data['total_sold_Products'] = $this->admin_dashboard->count_total_sold_products();
		$this->data['total_revenue_from_credits'] = $this->admin_dashboard->get_total_revenue('purchase_credit');	
		$this->data['total_commission_from_products'] = $this->admin_dashboard->total_site_commissions();
			
		//get admins recent inbox
		$this->data['admin_recent_inbox'] = $this->admin_dashboard->get_admin_recent_inbox();
		
		*/
		
		//echo "<pre>"; print_r($this->data['admin_recent_products']); echo "</pre>"; exit;
		$this->data['total_active_members'] = $this->general->get_total_members(1);
		$this->data['total_sold_products'] = $this->admin_dashboard->count_total_sold_products();
		$this->data['total_revenue_from_credits'] = $this->admin_dashboard->get_total_revenue('purchase_credit');	

		// //ge recent members
		$this->data['recent_members'] = $this->admin_dashboard->get_recent_members();

		// get recent products
		$this->data['recent_products'] = $this->admin_dashboard->get_recent_products();

		$this->template
			->set_layout('dashboard')
			->enable_parser(FALSE)
			->title(WEBSITE_NAME.'- Dashboard')
			->build('a_dashboard', $this->data);	
		
	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */