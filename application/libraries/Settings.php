<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Settings {
	/**
	 * CodeIgniter global
	 *
	 * @var string
	 **/
        /**
	 * CodeIgniter global
	 *
	 * @var string
	 **/
	protected $ci;


	public function __construct() {
   		//define site settings info
		$this->ci =& get_instance();
		
		if( !defined('SITE_NAME') )
		{
			$site_info = $this->get_site_settings_info();
			// Timezones Settings if function avilable.
			if ( function_exists( 'date_default_timezone_set' ) ) {
			   date_default_timezone_set($site_info['timezone']);
			}
			
			define('WEBSITE_NAME',$site_info['site_name']);
			define('SITE_STATUS',$site_info['site_status']);
			
			define('DEFAULT_CURRENCY_SIGN', $site_info['currency_sign']);
			define('DEFAULT_CURRENCY_CODE', $site_info['currency_code']);
			
			define('LOG_ADMIN_ACTIVITY',$site_info['log_admin_activity']);
			define('LOG_ADMIN_INVALID_LOGIN',$site_info['log_admin_invalid_login']);
			
			define('CONTACT_EMAIL',$site_info['contact_email']);
			define('CONTACT_NAME',$site_info['contact_name']);

			define('PHONE',$site_info['phone_no']);
			define('ADDRESS',$site_info['address1']);
			define('SKYPE',$site_info['skype']);
			define('CITY',$site_info['city']);
			define('STATE',$site_info['state']);
			define('COUNTRY',$site_info['country_name']);
			
			define('SYSTEM_EMAIL',$site_info['system_email']);
			define('SYSTEM_EMAIL_NAME',$site_info['system_email_name']);
			
			define('NEED_USER_ACTIVATION',$site_info['user_activation']); 
			
			define('SELLER_MANAGE_AUCTIONS_RESTRICTION_TIME', 1); // Seller cannot manage auctions within this time (in hour) of starting auction
						
			define('FACEBOOK_URL',$site_info['facebook']);
			define('TWITTER_URL',$site_info['twitter']);
			define('GOOGLE_PLUS_URL', $site_info['google_plus']);
			define('LINKEDIN_URL', $site_info['linkedin']);
			
			define('FACEBOOK_APP_ID',$site_info['facebook_app_id']);			
			
			define('GOOGLE_ANALYTICS_CODE',$site_info['google_analytics_code']);

			define('SUPPLIER_CATEGORY_LIMIT', $site_info['supplier_category_limit']);

			define('NO_FREE_AUCTION_POST', $site_info['no_auction_post_free']);
			define('IS_AUCTION_POST_COST', $site_info['is_auction_post_cost']);
			
			define('NO_FREE_BID_PLACES', $site_info['no_bid_place_free']);
			define('IS_BID_PLACE_COST', $site_info['is_bid_place_cost']);
			define('ENABLE_RATING', $site_info['enable_rating']);
			define('AUCTION_POST_ACTIVATION', $site_info['auction_post_activation']);
			define('FOOTER_MESSAGE',$site_info['copyright_info']);

			define('SMS_NOTIFICATION', $site_info['sms_notification']);
			if(SMS_NOTIFICATION==1)
			{
				define('SMS_GATEWAY_URL', $site_info['sms_gateway_url']);
				define('SMS_API_USERNAME', $site_info['sms_api_username']);
				define('SMS_API_PASSWORD', $site_info['sms_api_password']);
			}			
		}
	}
     
	   
	public function get_site_settings_info()
	{
		$query = $this->ci->db->get("site_settings");
		if($query->num_rows() > 0) 
		{
			$data=$query->row_array();
			$query->free_result();
			return $data;
		}else{
			return NULL;
		}
	}
}