<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Register extends CI_Controller {

    function __construct() {
        parent::__construct();

        //load custom language library

        if (SITE_STATUS == '2') {
            redirect(site_url('/offline'));
            exit;
        } else if (SITE_STATUS == '3') {
            //check whetheh logged in or not. if logged in as maintaince user, let them visit site. else redirect to maintainance page
            if (!$this->session->userdata('MAINTAINANCE_KEY') == 'YES' OR $this->session->userdata('MAINTAINANCE_KEY') != 'YES') {
                redirect(site_url('/maintainance'));
                exit;
            }
        }if ($this->session->userdata(SESSION . 'user_id')) {
            redirect(site_url(''));
            exit;
        }

        //check banned IP address
        $this->general->check_banned_ip();

        $this->load->helper('captcha');
        $this->load->helper('cookie');
        $this->load->library('form_validation');
        $this->load->library('antispam');
        $this->load->model('register_model');

        //$this->load->model('login_module');
        $this->form_validation->set_error_delimiters('<span generated="true" class="text-danger">', '</span>');

        //load mailchimp library
        // $this->load->library('mailchimp_library');
    }

    public function index() {
        
    }

    // member activation function
    public function activation($activation_code, $user_id) {
        if (!isset($user_id) OR $user_id == '') {
            redirect(site_url('/'));
        }
        if (!isset($activation_code) OR $activation_code == '') {
            redirect(site_url('/'));
        }

        $user_type_data = $this->general->fetch_members_selected_fields(array('user_type'), array('id' => $user_id));

        // set member validation settings for user
        if ($user_type_data->user_type == '3') {
            $this->general->set_member_validity_settings_buyer($user_id);
        } else if ($user_type_data->user_type == '4') {
            $this->general->set_member_validity_settings_supplier($user_id);
        }

        $activation_status = $this->register_model->check_user_activation($activation_code, $user_id);
        //echo var_dump($activation_status); exit;

        if ($activation_status == TRUE) {
            $cms_id = 11;
        } else {
            $cms_id = 12;
        }

        $this->data['cms'] = $this->general->get_cms_details($cms_id);
        // $this->register_model->reg_complete_email();
        //getting seo data for register
        $seo_data = $this->general->get_seo(1);
        if ($seo_data) {
            //set SEO data
            $this->page_title = $seo_data->page_title;
            $this->data['meta_keys'] = $seo_data->meta_key;
            $this->data['meta_desc'] = $seo_data->meta_description;
        } else {
            //set SEO data
            $this->page_title = WEBSITE_NAME;
            $this->data['meta_keys'] = WEBSITE_NAME;
            $this->data['meta_desc'] = WEBSITE_NAME;
        }


        $this->template
                ->set_layout('general')
                ->enable_parser(FALSE)
                ->title($this->page_title)
                ->build('v_cms_data', $this->data);
    }

    public function check_validuser($str) {

        if (preg_match('/^[a-zA-Z0-9_]+$/', $str) === 0) {
            $this->form_validation->set_message('check_validuser', 'The username field is not valid!');
            return false;
        } else {
            return true;
        }
    }

    public function email_taken() {
        $email = trim($this->input->post('email'));
        // if the username exists return a 1 indicating true
        $result = $this->register_model->email_exists($email);
        if ($result) {
            echo "This Email already exists.";
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function check_email_availability() {
        //exit if the request is not ajax
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }
        $email = trim($this->input->post('email'));
        // if the username exists return a 1 indicating true
        $result = $this->register_model->email_exists($email);
        if ($result) {
            echo 'taken';
        } else {
            echo 'available';
        }
    }

    public function check_username_availability() {
        //exit if the request is not ajax
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        }
        $username = trim($this->input->post('username'));
        // if the username exists return a 1 indicating true
        $result = $this->register_model->username_exists($username);
        if ($result) {
            echo 'taken';
        } else {
            echo 'available';
        }
    }

    // buyer registration
    public function buyer() {
        //set validation rules
        $this->form_validation->set_rules($this->register_model->validate_setting);

        if ($this->form_validation->run() === TRUE) {
            $activation_code = $this->register_model->insert_member('buyer');
            // print_r($activation_code);exit;
            if ($activation_code != 'system_error') {

                // if email activation is enabled from backend
                if (NEED_USER_ACTIVATION == '1') {
                    // send activation mail
                    $this->register_model->reg_confirmation_email($activation_code);

                    //$this->session->set_flashdata('success_message', 'Registration successful. Please check your email for your account verification.');
                    //redirect(site_url('/user/register/buyer'), 'refersh');
                    //suplier success message set in cms is 15
                    redirect(site_url('/user/register/success_page/15'), 'refersh');
                } else {
                    // set member_validity settings for user					
                    $user_id = $this->register_model->user_id;
                    $this->general->set_member_validity_settings_buyer($user_id);

                    // send welcome message
                    // $this->register_model->send_welcome_mail_to_new_user($activation_code);
                    $this->register_model->reg_complete_email();

                    $login_status = $this->general->check_login_process($this->input->post("email"), $this->input->post('password'));

                    $this->session->set_flashdata('success_message', 'Registration sucessful.');
                    // redirect to buyer dashboard
                    redirect(site_url(MY_ACCOUNT . 'buyer'), 'refersh');
                }
            } else {
                $this->session->set_flashdata('error_message', 'Unable to complete request due to system error. Please try Again.');
                redirect(site_url('/user/register/buyer'), 'refersh');
            }
        }
        $this->data['terms_condition'] = $this->general->get_cms_details(6);

        $this->data['meta_keys'] = WEBSITE_NAME;
        $this->data['meta_desc'] = WEBSITE_NAME;
        $this->page_title = WEBSITE_NAME . ' - Buyer Registration';
        $this->template
                ->set_layout('general')
                ->enable_parser(FALSE)
                ->title($this->page_title)
                ->build('v_buyer_registration', $this->data);
    }

//registration success page
    public function success_page($client_id) {
        if($client_id==14){
            $client="suplier";
        }
        if($client_id==15){
            $client="buyer";
        }
        $this->data['cms_data']=$this->general->get_cms_details($client_id);
        $slug=$this->data['cms_data']->cms_slug;
        $this->data['success_msg'] = $this->register_model->get_succes_register_message($slug);
        $this->data['meta_keys'] = WEBSITE_NAME;
        $this->data['meta_desc'] = WEBSITE_NAME;
        $this->data['client']=$client;
        $this->page_title = WEBSITE_NAME . ' - Success Registration';
        $this->template
                ->set_layout('general')
                ->enable_parser(FALSE)
                ->title($this->page_title)
                ->build('v_success_registration', $this->data);
    }

    // supplier registration
    public function supplier() {
        //set validation rules
        $this->form_validation->set_rules($this->register_model->validate_setting);

        if ($this->form_validation->run() === TRUE) {
            $activation_code = $this->register_model->insert_member('supplier');

            if ($activation_code != 'system_error') {
                // if email activation is enabled from backend				
                if (NEED_USER_ACTIVATION == '1') {
                    // send activation email
                    $this->register_model->reg_confirmation_email($activation_code);
                    //$this->session->set_flashdata('success_message', 'Registration sucessful. Please check your email for your account verification.');
                    redirect(site_url('/user/register/success_page/14'), 'refersh');
                } else {
                    //set member_validity settings for user
                    $user_id = $this->register_model->user_id;
                    $this->general->set_member_validity_settings_supplier($user_id);

                    // send welcome message
                    // $this->register_model->send_welcome_mail_to_new_user($activation_code);

                    $login_status = $this->general->check_login_process($this->input->post("email"), $this->input->post('password'));

                    $this->session->set_flashdata('success_message', 'Registration sucessful.');

                    // redirect to supplier dashboard
                    redirect(site_url(MY_ACCOUNT . 'supplier'), 'refersh');
                }
            } else {
                $this->session->set_flashdata('error_message', 'Unable to complete request due to system error. Please try Again.');
                redirect(site_url('/user/register/supplier'), 'refersh');
            }
        }

        $this->data['terms_condition'] = $this->general->get_cms_details(6);

        $this->data['meta_keys'] = WEBSITE_NAME;
        $this->data['meta_desc'] = WEBSITE_NAME;
        $this->page_title = WEBSITE_NAME . ' - Supplier Registration';
        $this->template
                ->set_layout('general')
                ->enable_parser(FALSE)
                ->title($this->page_title)
                ->build('v_supplier_registration', $this->data);
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */