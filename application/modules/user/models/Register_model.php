<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Register_model extends CI_Model 
{
	public function __construct()
	{
		parent::__construct();
		$this->user_id='';
	}
	
	public $user_id; //initialization of user id variable
	
	public $validate_setting =  array(
		array('field' => 'username', 'label' => 'Username', 'rules' => 'trim|required|min_length[6]|max_length[20]|is_unique[members.username]|callback_check_validuser'),
		array('field' => 'password', 'label' => 'Password', 'rules' => 'trim|required|min_length[6]|max_length[20]'),
		array('field' => 'first_name', 'label' => 'First Name', 'rules' => 'required'),
		array('field' => 'last_name', 'label' => 'Last Name', 'rules' => 'required'),
		array('field' => 'email', 'label' => 'Email', 'rules' => 'trim|required|valid_email|is_unique[members.email]|is_unique[members.new_email]'),	
		array('field' => 'phone', 'label' => 'Phone', 'rules' => 'trim|required'),		
		array('field' => 'terms_conditions', 'label' => 'Terms and Conditions', 'rules' => 'trim|required'),
	);
			

	
	public function insert_member($member_type = 'buyer')
	{
		$current_time = $this->general->get_local_time('time');
		
		//get random 10 numeric degit	
		$activation_code = $this->general->random_number();
		
		//generate password
		$salt = $this->general->salt();		
		$password = $this->general->hash_password($this->input->post('password',TRUE),$salt);

		$status = "2";		
		if (NEED_USER_ACTIVATION =='0')
			$status = "1";
		
		// set user type {3 for buyer, 4 for supplier}
		$user_type = '3';
		if($member_type == 'supplier')
			$user_type = '4';
		
		 //Running Transactions
		$this->db->trans_start();
		
		//set member info
		$mem_data = array(
			'email' => $this->input->post('email', TRUE),
			'username' => $this->input->post('username', TRUE),
			'salt' => $salt,
			'password' => $password,
			'user_type' => $user_type,
			'balance' => 0,
			'activation_code'=>$activation_code,
			'membership_type'=>'',
			'reg_date' => $current_time,
			'reg_ip' => $this->general->get_real_ipaddr(),
			'status' => $status,
		);
		

		//insert records in the database
		$this->db->insert('members',$mem_data);
		$this->user_id = $this->db->insert_id();
		
		$mem_details = array(
			'user_id' => $this->user_id,
			'name' => $this->input->post('first_name', TRUE),
			'last_name' => $this->input->post('last_name', TRUE),
			'phone' => $this->input->post('phone', TRUE),
		);

		// insert detail data into database
		$this->db->insert('members_details',$mem_details);
				
		$this->db->trans_complete();
		
		//exit;
		if ($this->db->trans_status() === FALSE){
			return "system_error";
		}
		return $activation_code;
		// return TRUE;
	}
		
		
	//update balance in referral account and add referral tranaction
	public function update_referral_balance_and_bonus_records_transaction($referrer_id, $new_user_id)
	{
		$current_date = $this->general->get_local_time('time');
		
		//update referrers bonus
		$this->db->set('balance', 'balance+'.REFER_BONUS, FALSE);
		$this->db->where('id', $referrer_id);
		$this->db->update('members');
		
		//add transaction to transaction table
		$txn_data = array(
		   'user_id' => $referrer_id,		   		
		   'credit_get' => REFER_BONUS,
		   'credit_debit' => 'CREDIT',
		   'transaction_name' => lang('referral_bonus').' :'.$new_user_id,
		   'transaction_date' => $current_date,
		   'transaction_type' => 'referer_bonus',
		   'transaction_status' => 'Completed',
		   'payment_method' => 'direct',
		   'current_balance' => 'current_balance +'.$user_total_balance
			);
	
		$this->db->insert('transaction', $txn_data);
		return $this->db->insert_id(); 	
	}
	
		
	public function insert_signup_bonus_records_transaction()
	{
		$invoice = strtotime("now");
		$data = array(
		   'invoice_id' => $invoice,
		   'user_id' => $this->user_id,		   		
		   'credit_get' => SIGNUP_BONUS,
		   'credit_debit' => 'CREDIT',
		   'transaction_type' => 'signup_bonus',
		   'transaction_name' => lang('free_balance_for_signup'),
		   'transaction_date' => $this->general->get_local_time('time'),
		   'transaction_status' => 'Completed',
		   'payment_method' => 'direct',
		   //'current_balance' => SIGNUP_BONUS
		);
	
		$this->db->insert('transaction', $data);
		return $this->db->insert_id(); 
	}
	

	public function reg_confirmation_email($activation_code)
	{			
		$template_id = 3; // for register_notification
		
		//parse email		
		$user_id=$this->session->userdata(SESSION.'user_id');	
		$confirm="<a href='".site_url('/user/register/activation/'.$activation_code.'/'.$this->user_id)."'>".site_url('/user/register/activation/'.$activation_code.'/'.$this->user_id)."</a>";

		$parseElement = array(
			"USERNAME"=>$this->input->post('username'), 
			"CONFIRM"=>$confirm,
			"SITENAME"=>WEBSITE_NAME
		);	
		
		$from = CONTACT_EMAIL;
		$to = $this->input->post('email', TRUE);

		$this->notification->send_email_notification($template_id, $user_id, $from, $to, '', '', $parseElement, array());
						
	}
	public function reg_complete_email()
	{			
		$template_id = 1; // for register_notification
		
	
		$parseElement = array(
			"USERNAME"=>$this->input->post('username'), 
			"SITENAME"=>WEBSITE_NAME,
			"EMAIL"=>$this->input->post("email"),
			"PASSWORD"=>$this->input->post('password')
		);	
		
		$from = CONTACT_EMAIL;
		$to = $this->input->post('email', TRUE);

		$this->notification->send_email_notification($template_id, $user_id, $from, $to, '', '', $parseElement, array());
						
	}
	
	
	public function send_welcome_mail_to_new_user($activation_code)
	{
		
		$this->load->library('email');
		
		$config = Array(
			//'protocol' => 'sendmail',
			'protocol' => 'mail',
			'smtp_host' => 'smtp.googlemail.com',
			'smtp_port' => 465,
			'smtp_user' => 'ktmtest2@gmail.com',
			'smtp_pass' => 'admin#123',
			'mailtype'  => 'html', 
			'charset'   => 'utf-8',
			'wordwrap'  =>TRUE,
		);
		//initialize email configurations
		$this->email->initialize($config);
		$this->email->set_newline("\r\n");
		
			
		$this->load->model('email_model');
		//get subjet & body
		$template = $this->email_model->get_email_template("welcome_email");
		$subject=$template['subject'];
		$emailbody=$template['email_body'];
		
		//check blank value before send message
		if(isset($subject) && isset($emailbody))
		{
			//parse email
			$parseElement = array(
				"FIRSTNAME"=>$this->input->post('first_name'), 
				"SITENAME"=>WEBSITE_NAME,
				"EMAIL"=>$this->input->post("email")
				
			);

			$subject = $this->email_model->parse_email($parseElement,$subject);
			$emailbody = $this->email_model->parse_email($parseElement,$emailbody);
					
			$this->email->to($this->input->post('email', TRUE)); 
			$this->email->from(CONTACT_EMAIL, WEBSITE_NAME);
			$this->email->subject($subject);
			$this->email->message($emailbody); 
			$this->email->send();
			
			/*echo $subject;
			echo "<br>";
			echo $emailbody;
			echo "<br><br><br><br>";
			exit;*/
			//echo $this->email->print_debugger();exit;
		}
	
	}
	
	public function check_user_activation($activation_code,$user_id)
	{
		$query = $this->db->get_where('members',array('activation_code'=>$activation_code,'id'=>$user_id, 'status'=>2));
		
		if ($query->num_rows() > 0) {
            $user_data = $query->row_array();
            $user_id = $user_data['id'];
            //$refer_id=$user_data['referer_id'];

            $data = array('status' => 1);
            $this->db->where('id', $user_id);
            $this->db->update('members', $data);

            $template_id = 1; // for register_notification
		$query=$this->db->get_where('members',array('id'=>$user_id));
		$user=$query->row_array();
		$username=$user['username'];
		$email=$user['email'];

	
		$parseElement = array(
			"USERNAME"=>$username, 
			"SITENAME"=>WEBSITE_NAME,
			"EMAIL"=>$email
		);	
		
		$from = CONTACT_EMAIL;
		$to = $email;

		$this->notification->send_email_notification($template_id, $user_id, $from, $to, '', '', $parseElement, array());

            return TRUE;
        } else {
            return FALSE;
        }
    }	
        public function get_succes_register_message($client){
            $this->db->where('cms_slug',$client);
            $query=$this->db->get('cms');
            if($query->num_rows()==1){
                return $query->row();
            }
        }
	
	public function username_exists($username)
	{
		$data = array();
		$query = $this->db->get_where("members",array('username'=>$username));
		if ($query->num_rows() > 0) 
		{
			$data=$query->row();				
		}
		$query->free_result();	
		return $data;
	}
	
	public function email_exists($email)
	{
		$data = array();
		$query = $this->db->get_where("members",array('email'=>$email));
		if ($query->num_rows() > 0) 
		{
			$data=$query->row();				
		}
		$query->free_result();	
		return $data;
	}
	
	
	
	function get_captcha()
	{
		$configs = array(
			'word' => strtolower(random_string('alnum', 8)),
			'img_path'     => './captcha/',
			'img_url'	 => base_url().CAPTCHA_PATH,
			'img_width'     => '150',
			'img_height' => 32,
			'char_set' 		=> "ABCDEFGHJKLMNPQRSTUVWXYZ2345689",
			'char_color' 	=> "#000000"
			); 
		$captcha = $this->antispam->get_antispam_image($configs);
		
		$cap=strtolower($captcha['word']); 
				
		$this->session->set_userdata('word',$cap);
		
		return $captcha['image'];
	}	
	
	
	private function delete_old_captcha(){
        /** define the captcha directory **/
        $dir = './'.CAPTCHA_PATH;
        
        /*** cycle through all files in the directory ***/
        foreach (glob($dir."*.jpg") as $file) {
        //echo filemtime($file); echo '<br/>';
        /*** if file is 24 hours (86400 seconds) old then delete it ***/
        if (filemtime($file) < time() - 3600) {
             @unlink($file);
             //echo $file;
            }
        }
    }
	
	
	//function to send test email
	public function send_test_email($subject,$message)
	{
		$this->load->library('email');

		$this->email->from('demo@nepaimpressions.com', 'Pradip');
		//$this->email->to('ktm.test1@gmail.com');		
		$this->email->to('ktm.test1@gmail.com');
		
		$this->email->subject($subject);
		$this->email->message($message); 
		
		$this->email->send();
	}
}
