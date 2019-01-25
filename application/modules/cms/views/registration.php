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

class Registration extends REST_Controller
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
		$this->load->model('api/registration_model');
    }
	    
    function member_get()
    {
        if(!$this->get('id'))
        {
        	$this->response(NULL, 400);
        }
   			
		$user = $this->registration_model->member_get($this->get('id'));
			//	print_r($data); exit;

		if($user)
        {
			$result = array('status'=>'success','data'=>array('user_data'=>$user));
            $this->response($result, 200); // 200 being the HTTP response code
        }

        else
        {
			$result = array('status'=>'error','data'=>array('message'=>'User Not Found'));
            $this->response($result, 200);
        }
    }
    
	
	function member_check_get()
    {
        if(!$this->get('username') || !$this->get('password'))
        {
        	$this->response(NULL, 400);
        }
   			
		$user = $this->registration_model->member_check($this->get('username'),$this->get('password'));
			//	print_r($data); exit;

		if($user)
        {
			$result = array('status'=>'success','data'=>array('user_data'=>$user));
            $this->response($result, 200); // 200 being the HTTP response code
        }

        else
        {
			$result = array('status'=>'error','data'=>array('message'=>'User Not Found'));
            $this->response($result, 200);
        }
    }
	
    function insert_member_post()
    {
		//INPUT:  username,email,password,day,month,year,gender,first_name,middle_name,last_name,country,street,city,profession_id
		//OUTPUT:  member_id
		$inserted_info = $this->registration_model->insert_member();
        if($inserted_info['status'] == 'error')
		{
            $this->response($inserted_info, 200);
		}
		else if($inserted_info['status'] == 'success')
		{
			 $this->response($inserted_info, 200); // 200 being the HTTP response code
		}
		else
		{
			$this->response(NULL, 400);
		}
       
    }
	
    function update_member_post()
    {
		//INPUT:  day,month,year,gender,first_name,middle_name,last_name,country,street,city,profession_id
		//OUTPUT:  member_id
		$member_id=$this->input->post('id');
		$updated_info = $this->registration_model->update_member($member_id);
        if($updated_info['status'] == 'error')
		{
            $this->response($updated_info, 200);
		}
		else if($updated_info['status'] == 'success')
		{
			 $this->response($updated_info, 200); // 200 being the HTTP response code
		}
		else
		{
			$this->response(NULL, 400);
		}
    } 
	 function update_member_location_post()
    {
		//INPUT:  day,month,year,gender,first_name,middle_name,last_name,country,street,city,profession_id
		//OUTPUT:  member_id
		$member_id=$this->input->post('id');
		$updated_info = $this->registration_model->update_member_location($member_id);
        if($updated_info['status'] == 'error')
		{
            $this->response($updated_info, 200);
		}
		else if($updated_info['status'] == 'success')
		{
			
			 $this->response($updated_info, 200); // 200 being the HTTP response code
		}
		else
		{
			$this->response(NULL, 400);
		}
    } 
	
    function user_delete()
    {
    	//$this->some_model->deletesomething( $this->get('id') );
        $message = array('id' => $this->get('id'), 'message' => 'DELETED!');
        
        $this->response($message, 200); // 200 being the HTTP response code
    }
    
    function users_get()
    {
        //$users = $this->some_model->getSomething( $this->get('limit') );
        $users = array(
			array('id' => 1, 'name' => 'Some Guy', 'email' => 'example1@example.com'),
			array('id' => 2, 'name' => 'Person Face', 'email' => 'example2@example.com'),
			3 => array('id' => 3, 'name' => 'Scotty', 'email' => 'example3@example.com', 'fact' => array('hobbies' => array('fartings', 'bikes'))),
		);
        
        if($users)
        {
            $this->response($users, 200); // 200 being the HTTP response code
        }

        else
        {
            $this->response(array('error' => 'Couldn\'t find any users!'), 404);
        }
    }


	public function send_post()
	{
		var_dump($this->request->body);
	}


	public function send_put()
	{
		var_dump($this->put('foo'));
	}
}