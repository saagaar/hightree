<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Example
 *
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array.
 *
 * @package		CodeIgniter
 * @subpackage	Rest Server
 * @category	Controller
 * @author		Phil Sturgeon
 * @link		http://philsturgeon.co.uk/code/
*/

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH.'/libraries/REST_Controller.php';

class Mobile extends REST_Controller
{
	function __construct()
    {
        // Construct our parent class
        parent::__construct();
        // Configure limits on our controller methods. Ensure
        // you have created the 'limits' table and enabled 'limits'
        // within application/config/rest.php
        $this->methods['user_get']['limit'] = 500; //500 requests per hour per user/key
        $this->methods['user_post']['limit'] = 100; //100 requests per hour per user/key
        $this->methods['user_delete']['limit'] = 50; //50 requests per hour per user/key
		$this->load->model('mobile_model');
        $this->load->helper('inflector');

    }
	    
     function all_list_api_get()
    {
        if(!$this->get('last_update'))
        {
        	//$this->response(NULL, 400);
			$last_update = false;
        }
		else
		{
			$last_update = $this->get('last_update');
		}
   			
		$region_list = $this->mobile_model->get_region_list($last_update);
		$section_list = $this->mobile_model->get_section_list($last_update);
		$distribution_list = $this->mobile_model->get_region_list($last_update);
			//	print_r($data); exit;

		if($region_list || $section_list || $distribution_list)
        {
			$result = array('status'=>'success','data'=>array('region_list'=>$region_list,'section_list'=>$section_list,'distribution_list'=>$distribution_list));
			
            $this->response($result, 200); // 200 being the HTTP response code
        }

        else
        {
			$result = array('status'=>'error','data'=>array('message'=>'No new data found'));
            $this->response($result, 200);
        }
    }
    
	 function region_get()
    {
        if(!$this->get('last_update'))
        {
        	//$this->response(NULL, 400);
			$last_update = false;
        }
		else
		{
			$last_update = $this->get('last_update');
		}
   			
		$region_list = $this->mobile_model->get_region_list($last_update);
		
		if($region_list)
        {
			$result = array('status'=>'success','data'=>$region_list);
			
            $this->response($result, 200); // 200 being the HTTP response code
        }
        else
        {
			$result = array('status'=>'error','data'=>array('message'=>'No new data found'));
            $this->response($result, 200);
        }
    }
	
	 function section_get()
    {
        if(!$this->get('last_update'))
        {
        	//$this->response(NULL, 400);
			$last_update = false;
        }
		else
		{
			$last_update = $this->get('last_update');
		}

		if($this->get('q'))
		{
			$region_id =$this->get('q');
			$section_list = $this->mobile_model->get_section_list_by_region_id($last_update,$region_id);
		}
		else
		{
		  $section_list = $this->mobile_model->get_section_list($last_update);
		}
		
		if($section_list)
        {
			$result = array('status'=>'success','data'=>$section_list);
			
            $this->response($result, 200); // 200 being the HTTP response code
        }
        else
        {
			$result = array('status'=>'error','data'=>array('message'=>'No new data found'));
            $this->response($result, 200);
        }
    }
	
	function distribution_get()
    {
        if(!$this->get('last_update'))
        {
        	//$this->response(NULL, 400);
			$last_update = false;
        }
		else
		{
			$last_update = $this->get('last_update');
		}

		if($this->get('q'))
		{
			$section_id =$this->get('q');
			if($this->get('region_id'))
			{
				$region_id =$this->get('region_id');
				$distribution_list = $this->mobile_model->get_distribution_list_by_reg_and_section_id($last_update,$region_id,$section_id);
			}
			else
			{
			$distribution_list = $this->mobile_model->get_distribution_list_by_section_id($last_update,$section_id);
			}
		}
		else
		{
		     $distribution_list = $this->mobile_model->get_distribution_list($last_update);
		}
		
		if($distribution_list)
        {
			$result = array('status'=>'success','data'=>$distribution_list);
			
            $this->response($result, 200); // 200 being the HTTP response code
        }
        else
        {
			$result = array('status'=>'error','data'=>array('message'=>'No new data found'));
            $this->response($result, 200);
        }
    }
	
	function appliance_get()
    {
        if(!$this->get('last_update'))
        {
        	//$this->response(NULL, 400);
			$last_update = false;
        }
		else
		{
			$last_update = $this->get('last_update');
		}

		if($this->get('q'))
		{
			$section_id =$this->get('q');
			$appliance_list = $this->mobile_model->get_appliance_by_id($last_update,$section_id);
		}
		else
		{
		     $appliance_list = $this->mobile_model->get_appliance_list($last_update);
		}
		
		if($appliance_list)
        {
			$result = array('status'=>'success','data'=>$appliance_list);
			
            $this->response($result, 200); // 200 being the HTTP response code
        }
        else
        {
			$result = array('status'=>'error','data'=>array('message'=>'No new data found'));
            $this->response($result, 200);
        }
    }
	
	// Update by manish
	function user_history_get()
	{
		
			$service_no_ip = $this->input->get('consumer',TRUE);
			if (strlen($service_no_ip) < 7 || !($service_no_ip >= 0 || $service_no_ip < 0)) 
			{ 
				// check 7 coz that is the minimum length needed
				$error_result['status'] = "error";
				$error_result['data'] = "Input Service no. is not valid!";
				print_r(json_encode($error_result)); exit;	
    		} 
			
			if(!$this->input->get('last_update'))
			{
				//$this->response(NULL, 400);
				$last_update = false;
			}
			else
			{
				$last_update = $this->input->get('last_update');
			}
			
			//Check if data already exist in database
			$connection_detail =  $this->mobile_model->is_connection_id_exist($service_no_ip);
		
			if($connection_detail)
			{
				//echo "update";
				print_r(json_encode($this->mobile_model->do_update_userdata($service_no_ip,$connection_detail,$last_update)));
			}
			else
			{
				//echo "edit";
				print_r(json_encode($this->mobile_model->do_insertion_userdata($service_no_ip)));
			}
			
			// $connection_detail = false;
			// print_r(json_encode($this->mobile_model->do_update_userdata($service_no_ip,$connection_detail,$last_update)));

			exit;
	}
	function user_history_tamilnadu_get()
	{
		echo 'we are here';exit;
	}

	function user_history_tamilnadu_post()
	{
			echo 'we are here';exit;
			$service_no_ip=$this->input->post('consumerno',true);
			// $service_no_ip='09241031561';
			if (strlen($service_no_ip) < 7 || !($service_no_ip >= 0 || $service_no_ip < 0)) 
			{ 
				// check 7 coz that is the minimum length needed
				$error_result['status'] = "error";
				$error_result['data'] = "Input Service no. is not valid!";
				print_r(json_encode($error_result)); exit;	
    		} 

			if(!$this->input->post('last_update'))
			{
				//$this->response(NULL, 400);
				$last_update = false;
			}
			else
			{
				$last_update = $this->input->post('last_update');
			}
			
			
			//Check if data already exist in database
			$connection_detail =  $this->mobile_model->is_connection_id_exist($service_no_ip);
			
			if($connection_detail)
			{
				
				print_r(json_encode($this->mobile_model->do_update_userdata_tamilnadu($connection_detail)));
			}
			else
			{
				
				print_r(json_encode($this->mobile_model->do_insertion_userdata_tamilnadu()));
			}
			
			// $connection_detail = false;
			// print_r(json_encode($this->mobile_model->do_update_userdata($service_no_ip,$connection_detail,$last_update)));

			exit;
	}
	// By Manish for getting data from bescom
	public function user_historyk_get()
	{
		$username = $this->input->get('username');
		$password = $this->input->get('password');
		if (empty($username) OR empty($password))
		{
			$error_result['status'] = "error";
			$error_result['message'] = "Please Type Username AND Password";
			$error_result['data'] = array();
			
			print_r(json_encode($error_result)); 
			exit;	
		}

		if(!$this->input->get('last_update'))
		{
			//$this->response(NULL, 400);
			$last_update = FALSE;
		}
		else
		{
			$last_update = $this->input->get('last_update');
		}
			

		print_r(json_encode($this->mobile_model->save_karnataka_data($username, $password, $last_update)));
		exit;
		
	}
	public function power_cut_get()
	{
		
		$data = $this->mobile_model->get_power_cut();
		if($data)
		{
			$status ='success';
			$status_msg = "ok";
		}
		else
		{
			$status ='error';
			$status_msg = "no power cut for today";
		}
		print_r(json_encode(array('status'=>$status,'status_message' =>$status_msg,'data'=>$data)));
		exit;

	}
	
	public function send_post()
	{
		var_dump($this->request->body);
	}


	public function send_put()
	{
		var_dump($this->put('foo'));
	}

	// public function insert_date_get()
	// {
	// 	$new_date = date('Y-M-d');
	// 	$this->db->insert('test_table', array('update_date'=>$new_date));
	// }

	public function pilotg_post()
	{

		$data = $this->mobile_model->get_pilot();

		print_r(json_encode($data));

		// $request = $this->input->post('request');
		
		// //$request = '{"Data":[{"Minute":"3","Hour":"2","Time":"AM","Date":"31-08-2015","Area":"09-210"},{"Minute":"3","Hour":"3","Time":"AM","Date":"31-08-2015","Area":"09-270"},{"Minute":"6","Hour":"6","Time":"AM","Date":"31-08-2015","Area":"09-288"}]}';
		// if(!$request  OR ($request == '' OR $request == NULL))
		// {
		// 	$status['status'] = 'success';
		// 	$status['message'] = 'invalid request';
		// 	$status['data'] = 'no request parameter';
		// 	print_r(json_encode($status));
		// 	exit;
		// }

		// $request = json_decode($request);
		
		// //print_r($request);

		// //echo count($request->Data);
		// if ($request)
		// {
		// 	$data_temp = array();

		// 	foreach ($request->Data as $data_key =>$data) {

		// 		$area_date = array();

		// 		// echo "<pre>".$data->Hour."</pre>";
		// 		// echo "<pre>".$data->Minute."</pre>";
		// 		// echo "<pre>".$data->Time."</pre>";
		// 		// echo "<pre>".$data->Date."</pre>";

		// 		//echo "<pre>".$data->Area."</pre>";

		// 		//echo "<pre>".$data->Date." ".$data->Hour.":".$data->Minute.":00 ".$data->Time."</pre>";
				

		// 		$area = $data->Area;

		// 		//$post_date = $data->Date." ".$data->Hour.":".$data->Minute.":00 ".$data->Time;

		// 		$area_date['date'] = $data->Date;
		// 		$area_date['hour'] = $data->Hour;
		// 		$area_date['minute'] = $data->Minute;
		// 		$area_date['time'] = $data->Time;
		// 		$area_date['area'] = $data->Area;

		// 		//$area_date['date'] = $post_date;

		// 		// str_replace(PHP_EOL, '', $data->Date);

		// 		array_push($data_temp, $area_date);

		// 		//print_r(json_encode($area_date));


		// 	}

		// 	print_r(json_encode($data_temp));

		// 	$this->mobile_model->add_user_request($data_temp);
		// }
		// else
		// 	echo "Invalid Post Data";

		// exit;

		
		
		// $data = $this->mobile_model->get_pilot($request);

		// if ($data)
		// {
		// 	$status = 'success';
		// 	$message = 'data retrieved';
		// }
		// else
		// {
		// 	$status = 'error';
		// 	$message = 'invalid request';
		// }		

		// print_r(json_encode(array('status'=>$status, 'message'=>$message, 'data'=>$data)));
		
		// exit;

	}

	public function pilot_post()
	{
		// $request = $this->input->post('request');

		// //$test_data = json_decode('{"Data":[{"Minute":"3","Hour":"2","Time":"AM","Date":"31-08-2015","Area":"09-210"},{"Minute":"3","Hour":"3","Time":"AM","Date":"31-08-2015","Area":"09-270"},{"Minute":"6","Hour":"6","Time":"AM","Date":"31-08-2015","Area":"09-288"}]}');
		
		// // echo count($test_data->Data);

		// // foreach ($test_data->Data as $data) {
		// // 	echo $data->Area;
		// // }
		// //exit;
		// if(!$request  OR ($request == '' OR $request == NULL))
		// {
		// 	$status['status'] = 'success';
		// 	$status['message'] = 'invalid request';
		// 	$status['data'] = 'no request parameter';
		// 	print_r(json_encode($status));
		// 	exit;
		// }
		
		$data = $this->mobile_model->get_pilot();
		
		// if ($data)
		// {
		// 	$status = 'success';
		// 	$message = 'data retrieved';
		// }
		// else
		// {
		// 	$status = 'error';
		// 	$message = 'invalid request';
		// }		

		// print_r(json_encode(array('status'=>$status, 'message'=>$message, 'data'=>$data)));
		
		// exit;
		
	}


	// GCM Cloud Messaging

	// Registering users 

	public function register_post()
	{

		$gcm_regid = $this->input->post('gcm_regid');
		
		$connection_id = $this->input->post('connection_id');

		$data = $this->mobile_model->store_user($gcm_regid, $connection_id);

		if ($data)

			echo json_encode(array('message'=>'registered','gcm_regid'=>$data));

		else

			echo json_encode(array('message'=>'not registered'));

	}


	public function send_notification_get()
	{
		
		
		$registration_ids = $this->mobile_model->get_all_registered_users();
		//print_r($registration_ids);
		

		if ($registration_ids)
		{

		 	$reg_ids = array();
		 	
		 	foreach($registration_ids as $ids) 
		 	{
	 			array_push($reg_ids, $ids['gcm_regid']);
			}
			//$message = array('message'=>'Power resume at 12:30 AM', 'start_time'=>'', 'end_time'=>'');
			$message = array('message'=> 'Power cut from 10 AM to 3 PM' ,'start_time'=> '10 AM', 'end_time' => '3 PM');
			print_r(json_encode($this->mobile_model->send_message($reg_ids, $message)));

	 	}

		
		// }
		
		
		//$temp = array_chunk($registration_ids, 3);
		//foreach ($temp as $temp_data) {
		
		//}
		//echo $this->mobile_model->send_message($registration_ids, $message);

	}

	// Test if admin is avaiable or not

	// public function connection_get()
	// {

	// 	$data = $this->mobile_model->get_all_connection_chennai();

	// 	if ($data)
	// 		print_r(json_encode($data));
		
		
		
	// }


	// For power cut gcm

	public function power_cut_gcm_get()
	{
		$this->mobile_model->send_power_cut_gcm();
	}


	public function gcm_test_get()
	{
		$data = array();

		$data['users'] = $this->mobile_model->get_all_registered_users();

		$this->load->view('gcm_post', $data);
	}



	public function send_message_post()
	{
		if (isset($_POST["regId"]) && isset($_POST["message"]) && isset($_POST['id'])) 
		{
		    $regId = $_POST["regId"];
		    $message = $_POST["message"];

		    $id = $_POST["id"];

		    // echo $id;
		    // echo "hello";
		    // exit;
		 
		    // include_once './gcm_sendmsg.php';
		 
		    // $gcm = new GCM_SendMsg();
		 
		    $registatoin_ids = array($regId);
		    
		    $message = array("message" => $message);
		 
		    $status = $this->mobile_model->send_message($registatoin_ids, $message);		 

		   // print_r(json_encode($status));

		    //exit;

		    if(!empty($status) && is_array($status))
			{
				
	            if(array_key_exists('canonical_ids',$status) && $status['canonical_ids'] > 0)
	            {
	                $canonical_ids = $status['canonical_ids'];

	                if(array_key_exists('results',$status) && !empty($status['results']) && is_array($status['results']))
	                {

	                	$unsuccessful_ids = array();

	                    foreach($status['results'] as $k=>$v)
	                    {
	                    	
	                        if(array_key_exists('registration_id',$v))
	                        {
	                            
	                        	$userid = $id;
	                            $newgcmid  = $v['registration_id'];

	                            $test  = $this->mobile_model->search_reg_id($newgcmid);

	                            if ($test)
	                            {
	                            	$this->mobile_model->delete_gcm_id($userid);
	                            } 
	                            else
	                            {
	                            	$this->mobile_model->update_gcm_id($userid,$newgcmid);
	                            }

	                        }

	                        

	                    }

	                }
	            }

	            if(array_key_exists('results',$status) && !empty($status['results']) && is_array($status['results']))
                {
                	
                	$unsuccessful_ids = array();

                    foreach($status['results'] as $k=>$v)
                    {
                        if(array_key_exists('error',$v) && ($v['error'] == 'InvalidRegistration' || $v['error'] == 'NotRegistered'))
                        {
                        	
                        	$userid = $id;
                        	$this->mobile_model->delete_gcm_id($userid);
                        }
                        elseif (array_key_exists('error', $v) && ($v['error']== 'Unavailable'))
                        {
                        	//$unsuccessful_ids = array();
                        	//$unsuccessful_id = array_search($chunks[$key][$k], $valid_reg_id);
                        	//array_push($unsuccessful_ids, $valid_reg_id[$unsuccessful_id]);

                        }

                    }

                    //$new_valid_regs = array_chunk($unsuccessful_ids, 1000);
                    
                    if (!empty($unsuccessful_ids) && is_array($unsuccessful_ids))
                    	
                    	$status = $this->send_message($unsuccessful_ids, $message);
                }
	        
		    }
		    print_r(json_encode($status));

		}
	}

	public function webhook_post()
	{

		$data = file_get_contents("php://input");		
		
		$this->mobile_model->save_sebhook_response($data);	

		@mail('cmanish049@gmail.com', 'test', 'webhook test');
		
		exit;
	}

	public function referal_webhook_post()
	{
		$data = json_decode(file_get_contents("php://input"), TRUE);				
		
		$response = $this->mobile_model->save_referal_webhook_response($data);	

		
		if($response === TRUE)
		{
			$result = array('status'=>'success','data'=>array('message'=>'Reward Data Stored Successfully'));            
		}
		else
		{
			$result = array('status'=>'error','data'=>array('message'=>'Reward Data Store Failed'));            
		}

		print_r(json_encode($result));

		exit;
	}


	public function conversion_post()
	{
		$data = file_get_contents("php://input");		
		
		$this->mobile_model->save_sebhook_response($data);	

		@mail('cmanish049@gmail.com', 'test', 'webhook conversion test');
		
		exit;
	}

	public function conversion_webhook_post()
	{
		$data = json_decode(file_get_contents("php://input"), TRUE);		
		
		$response = $this->mobile_model->save_conversion_response($data);	

		$result = array();
		if($response === TRUE)
		{
			$result = array('status'=>'success','data'=>array('message'=>'Conversion Reward Data Stored Successfully'));            
		}
		else
		{
			$result = array('status'=>'error','data'=>array('message'=>'Conversion Reward Data Store Failed'));            
		}

		print_r(json_encode($result));

		exit;
	}

	// sms verification part
	public function sms_post()
	{
		$mobile_number = $this->input->post('mobile');

		if(empty($mobile_number))
		{
			$error_result['status'] = "error";
			$error_result['message'] = "Mobile Number is Empty";			
			print_r(json_encode($error_result)); 
			exit;	
		}
 
		$sender_id = SENDER_ID; 	

		$verification_code = rand(100000, 999999);

		$message = 'Your verification code is :'. $verification_code;

    	$res = $this->mobile_model->create_user($mobile_number, $sender_id, $verification_code, $message);

    	if($res == 1)
    	{
    		$error_result["status"] = "success";
       		$error_result["message"] = "SMS request is already initiated! You will be receiving it shortly.";
       		print_r(json_encode($error_result)); 
			exit;
    	}
    	elseif($res == 2)
    	{
    		$this->mobile_model->send_sms($mobile_number, $sender_id, $verification_code, $message);
    		// exit;
    		$error_result["status"] = "success";
       		$error_result["message"] = "SMS request is initiated! You will be receiving it shortly.";
       		print_r(json_encode($error_result)); 
			exit;
    	}
    	elseif($res == 3)
    	{
    		$error_result["status"] = "error";
        	$error_result["message"] = "Sorry! Error occurred in registration.";
        	print_r(json_encode($error_result)); 
			exit;
    	}
	}


	public function verify_sms_post()
	{
		$mobile_number = $this->input->post('mobile');
		$verification_code = $this->input->post('verification_code');
		if(empty($mobile_number))
		{
			$error_result['status'] = "error";
			$error_result['message'] = "Mobile Number is Empty";			
			print_r(json_encode($error_result)); 
			exit;	
		}

		if(empty($verification_code))
		{
			$error_result['status'] = "error";
			$error_result['message'] = "Verification Code is empty";			
			print_r(json_encode($error_result)); 
			exit;
		}

		$status = $this->mobile_model->activate_user($mobile_number, $verification_code);
		if($status == 1)
		{
			$error_result['status'] = "success";
			$error_result['message'] = "You are verified to use the app";			
			print_r(json_encode($error_result)); 
			exit;
		}
		elseif($status == 2)
		{
			$error_result['status'] = "error";
			$error_result['message'] = "Invalid Verification Code";			
			print_r(json_encode($error_result)); 
			exit;
		}
	}

	public function testlogin_get(){
			$data=$this->mobile_model->testlogin();
			echo (json_encode(array($data))); 
			exit;


	}

}