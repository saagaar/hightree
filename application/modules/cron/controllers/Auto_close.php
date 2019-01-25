<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Auto_close extends CI_Controller {

	function __construct() {
		parent::__construct();
		
		if(SITE_STATUS == 'offline'){
			exit;
		}
		
		$this->load->model('auto_close_model');
	}
	
	//closing auction on daily basis if the auction date is expired 
	public function index()
	{
		//$this->test_send_email('Job Scheduler STARTED','This is test email for job scheduler!!!');	
		$this->current_date_time = $this->general->get_local_time('time');
		$closed_auctions = $this->auto_close_model->get_all_closing_auctions();
		
		if($closed_auctions)
		{
			foreach($closed_auctions as $closed_auction)
			{
				$this->product_id = $closed_auction->id;
				$bidder=$this->auto_close_model->get_bidder_useremail($this->product_id);
				$buyer=$this->auto_close_model->get_buyer_useremail($this->product_id);	
				$id=$this->auto_close_model->update_auction_to_closed();	
				if($id)
				{
					
					$this->auto_close_model->send_email_buyer($buyer,count($bidder));
					$emid=$this->auto_close_model->send_email_bidder($bidder);
					echo 'success';
				}
						
			}// End Foreach
		}
		
		
	}
	 function check_membership_expire()
	 {
	 	
		$membership_expiring = $this->auto_close_model->get_membership_expiring();
		
		if(count($membership_expiring)>0)
		{
			foreach ($membership_expiring as $key => $value) {
				$usertype= $value->user_type;
				if($usertype=='4')
					 $url=site_url('/'.MY_ACCOUNT.'/supplier_packages');
				if($usertype=='3')
					 $url=site_url('/'.MY_ACCOUNT.'/buyer_packages');
					
				$template_id=60;
				$to=$value->email;
				$from=CONTACT_EMAIL;
				$parseElement=array(
										'USER'			=> 		$value->username,
										'URL'			=>		$url,
										'SITENAME'		=>		WEBSITE_NAME
									);
				$email=$this->notification->send_email_notification($template_id, '', $from, $to, '', '', $parseElement, array());	
		
			}		
		}

		
	 }
	
	function test_send_email($subject,$message)
	{
		$this->load->library('email');

		$this->email->from('demo@topencheres.fr');
		$this->email->to('ktm.test@yahoo.com');
		
		$this->email->subject($subject);
		$this->email->message($message); 
		
		$this->email->send();
	}
}	
?>