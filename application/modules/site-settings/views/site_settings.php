<section class="title">
  <div class="wrap">
    <h2><a href="<?=site_url(ADMIN_DASHBOARD_PATH)?>">ADMIN</a> &raquo; Sitesetting  Management </h2>
  </div>
</section>
<article id="bodysec" class="sep">
  <div class="wrap">
    <section class="smfull">
      <div class="confrmmsg">
        <?php 
            if($this->session->flashdata('message')){
            echo "<p>".$this->session->flashdata('message')."</p>";
            }
        ?>
      </div>
      <div class="box_block">
        <form name="sitesetting" method="post" action="" enctype="multipart/form-data" accept-charset="utf-8" id="siteSettingsForm">
          <fieldset>
            <div class="title_h3">System Settings</div>
            <ul class="frm">
              <li>
                <div>
                  <label>Website Name<span>*</span> :</label>
                  <input type="text" name="site_name" class="inputtext" size=45 value="<?php echo set_value('site_name',$site_set['site_name']);?>">
                  <?=form_error('site_name')?>
                </div>
              </li>              
              <li>
                <div>
                  <label>Website Status</label>
                  <input name="site_status" type="radio" value="1" <?php if(set_value('site_status',$site_set['site_status']) == '1'){ echo 'checked="checked"';}?> />Online
                  <input name="site_status" type="radio" value="2" <?php if(set_value('site_status',$site_set['site_status']) == '2'){ echo 'checked="checked"';}?> />Offline
                  <input name="site_status" type="radio" value="3" <?php if(set_value('site_status',$site_set['site_status']) == '3'){ echo 'checked="checked"';}?>/>Maintainance
                </div>
              </li>

              <li><div>
                  <label>Contact Name<span>*</span> :</label>
                  <input type="text" name="contact_name" id="contact_name" value="<?php echo set_value('contact_name',$site_set['contact_name']);?>"  />
                  <?=form_error('contact_name')?>
                </div></li>
              
              <li>
                <div>
                  <label>Contact Email<span>*</span> :</label>
                  <input name="contact_email" type=text class="inputtext" id="contact_email" value="<?php echo set_value('contact_email',$site_set['contact_email']);?>" size=45>
                  <?=form_error('contact_email')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Phone number<span>*</span></label>
                   <input type="text" name="phone_no" class="inputtext" value="<?php echo set_value('phone_no',$site_set['phone_no']);?>">
                  <?=form_error('phone_no')?>
                </div>
              </li>
               <li>
                <div>
                  <label>Skype :</label>
                  <input type="text" name="skype" class="inputtext" value="<?php echo set_value('skype',$site_set['skype']);?>">
                  <?=form_error('skype')?>
                </div>
              </li>
               <li>
                <div>
                  <label>Address<span>*</span> :</label>
                  <input type="text" name="address1" class="inputtext" value="<?php echo set_value('address1',$site_set['address1']);?>">
                  <?=form_error('address1')?>
                </div>
              </li>
              <li>
                <div>
                  <label>City<span>*</span> :</label>
                  <input type="text" name="city" class="inputtext" value="<?php echo set_value('city',$site_set['city']);?>">
                  <?=form_error('city')?>
                </div>
              </li>
              <li>
                <div>
                  <label>State :</label>
                  <input type="text" name="state" class="inputtext" value="<?php echo set_value('state',$site_set['state']);?>">
                  <?=form_error('state')?>
                </div>
              </li>
             
              <li>
                <div>
                  <label>Country<span>*</span> :</label>
                  <input type="text" name="country_name" class="inputtext" value="<?php echo set_value('country_name',$site_set['country_name']);?>">
                  <?=form_error('country_name')?>
                </div>
              </li>
              
              
              <li><div>
                  <label>System Email Name<span>*</span> :</label>
                  <input type="text" name="system_email_name" id="system_email_name" value="<?php echo set_value('system_email_name',$site_set['system_email_name']);?>"  />
                  <?=form_error('system_email_name')?>
                </div></li>
              
              <li>
                <div>
                  <label>System Email Address<span>*</span> :</label>
                  <input name="system_email_address" type=text class="inputtext" id="system_email_address" value="<?php echo set_value('system_email_address',$site_set['system_email']);?>" size=45>
                  <?=form_error('system_email_address')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Default Currency Sign<span>*</span> :</label>
                  <input type="text" name="currency_sign" class="inputtext" value="<?php echo set_value('currency_sign',$site_set['currency_sign']);?>">
                  <?=form_error('currency_sign')?>
                </div>
              </li>
              
              <li>
                <div>
                  <label>Default Currency Code</label>
                   <input type="text" name="currency_code" class="inputtext" value="<?php echo set_value('currency_code',$site_set['currency_code']);?>">
                  <?=form_error('currency_code')?>
                </div>
              </li>
              
              
               <!-- <li id="maintainanceKeyHolder">
                <div>
                  <label>Maintanance Key<span>*</span> :</label>
                  <input type="text" name="maintainance_key" class="inputtext" size=45 value="<?php echo set_value('maintainance_key',$site_set['maintainance_key']);?>">
                  <?=form_error('maintainance_key')?>
                </div>
              </li> -->
            </ul>
          </fieldset>
          <fieldset>
            <div class="title_h3">Timezone Settings</div>
            <ul class="frm">
              <li>
                    <div>
                      <label>System Timezone<span>*</span> :</label>
                        <?php
                            $default_timezone = set_value('timezone',$site_set['timezone']);                    
                            echo $this->general->timezone_list('timezone', $default_timezone);
                            echo form_error('timezone');
                        ?>
                  </div>
                </li>
            </ul>
          </fieldset>
          <fieldset>
            <div class="title_h3">Seller/Buyer Setting</div>
            <ul class="frm">
              <li>
                <div>
                  <label>Members Activation</label>
                  <input name="user_activation" type="radio" value="0" checked="checked" />No
                  <input name="user_activation" type="radio" value="1" <?php if($site_set['user_activation'] == '1'){ echo 'checked="checked"';}?> />Yes
                 </div>
              </li>  
              
              <li>
                <div>
                  <label> Supplier Expertise Category Limit</label>
                  <input name="supplier_category_limit" type="text" value="<?php echo set_value('supplier_category_limit', $site_set['supplier_category_limit']); ?>"  />
                 </div>
              </li>
               <li>
                <div>
                  <label>Enable Rating</label>
                  <input name="enable_rating" type="radio" value="No" checked="checked" />No
                  <input name="enable_rating" type="radio" value="Yes" <?php if($site_set['enable_rating'] == 'Yes'){ echo 'checked="checked"';}?> />Yes
                </div>
              </li>  
              
        </ul>
          </fieldset>
          <fieldset>
            <div class="title_h3">Auction Settings</div>
            <ul class="frm">
              <li>
                <div>
                  <label>No of Auction Post(Free)</label>
                  <input name="no_auction_post_free" type="text" value="<?php echo set_value('no_auction_post_free', $site_set['no_auction_post_free']); ?>">(0 for no free auction posts, 99999 for unlimited, or any number)
                  <?php echo form_error('no_auction_post_free'); ?>
                 </div>
              </li> 
              <li>
                <div>
                  <label>Charge Auction Post</label>
                   <input name="is_auction_post_cost" type="radio" value="1" <?php if($site_set['is_auction_post_cost'] == '1'){ echo 'checked="checked"';}?> />Yes
                  <input name="is_auction_post_cost" type="radio" value="0" <?php if($site_set['is_auction_post_cost'] == '0'){ echo 'checked="checked"';}?>/>No
                  <?php echo form_error('is_auction_post_cost'); ?>
                 </div>
              </li>                
              <li>
                <div>
                  <label>No. of Bid Place(Free)</label>
                  <input name="no_bid_place_free" type="text" value="<?php echo set_value('no_bid_place_free', $site_set['no_bid_place_free']); ?>">(0 for no free bid places, 999999999 for unlimited, or any number)
                  <?php echo form_error('no_bid_place_free'); ?>
                 </div>
              </li> 
              <li>
                <div>
                  <label>Is Bid Place Cost</label>
                  <input name="is_bid_place_cost" type="radio" value="1" <?php if($site_set['is_bid_place_cost'] == '1'){ echo 'checked="checked"';}?> />Yes
                  <input name="is_bid_place_cost" type="radio" value="0" <?php if($site_set['is_bid_place_cost'] == '0'){ echo 'checked="checked"';}?>/>No
                  <?php echo form_error('is_bid_place_cost'); ?>
                </div>
              </li>  
              <li>
                <div>
                  <label>Auction Post Activation</label>
                  <input name="auction_post_activation" type="radio" value="1" <?php if($site_set['auction_post_activation'] == '1'){ echo 'checked="checked"';}?> />Yes
                  <input name="auction_post_activation" type="radio" value="0" <?php if($site_set['auction_post_activation'] == '0'){ echo 'checked="checked"';}?>/>No
                  <?php echo form_error('auction_post_activation'); ?>
                </div>
              </li>               
          </ul>
          </fieldset>
          
          <fieldset>
            <div class="title_h3">Site Logs</div>
            <ul class="frm">
            	<li>
                <div>
                  <label>Log Admin's Activity</label>
                  <input name="log_admin_activity" type="radio" value="N" checked="checked" />No
                  <input name="log_admin_activity" type="radio" value="Y" <?php if($site_set['log_admin_activity'] == 'Y'){ echo 'checked="checked"';}?> />Yes
                 </div>
              </li>  
              
              <li>
                <div>
                  <label>Log Admin's Invalid Login</label>
                  <input name="log_admin_invalid_login" type="radio" value="N" checked="checked" />No
                  <input name="log_admin_invalid_login" type="radio" value="Y" <?php if($site_set['log_admin_invalid_login'] == 'Y'){ echo 'checked="checked"';}?> />Yes
                 </div>
              </li>
		    </ul>
        <!-- <fieldset>
            <div class="title_h3">SMS Setting</div>
            <ul class="frm">              
              <li>
                <div>
                  <label>Enable SMS Notification</label>
                  <input name="sms_notification" type="radio" value="0" checked="checked" />No
                  <input name="sms_notification" type="radio" value="1" <?php if($site_set['sms_notification'] == '1'){ echo 'checked="checked"';}?> />Yes
                </div>
              </li>
               
        </ul>
          </fieldset> -->
          </fieldset>          
          <fieldset>
            <div class="title_h3">Find us</div>
            <ul class="frm">
              
			  <li>
                <div>
                  <label>Facebook Link<span>*</span> :</label>
                  <input name="facebook" type="text" class="inputtext" id="facebook" value="<?php echo set_value('facebook',$site_set['facebook']);?>" size=45>
                  <?=form_error('facebook')?>
                </div>
              </li>
              
              <li>
                <div>
                  <label>Twitter Link<span>*</span> :</label>
                  <input type="text" name="twitter" class="inputtext" size="45" value="<?php echo set_value('twitter',$site_set['twitter']);?>" />
                </div>
              </li>
              
			  
			  <li>
                <div>
                  <label>Google Plus Link<span>*</span> :</label>
                  <input type="text" name="google_plus" class="inputtext" size="45" value="<?php echo set_value('google_plus',$site_set['google_plus']);?>" />
                </div>
              </li>
              
              <li>
                <div>
                  <label>LinkedIn Link<span>*</span> :</label>
                  <input type="text" name="linkedin" class="inputtext" size="45" value="<?php echo set_value('linkedin',$site_set['linkedin']);?>" />
                </div>
              </li>
              
              <!-- <li>
                <div>
                  <label>Pinterest Link<span>*</span> :</label>
                  <input type="text" name="pinterest" class="inputtext" size="45" value="<?php echo set_value('pinterest',$site_set['pinterest']);?>" />
                </div>
              </li>
               -->
              <!-- <li>
                <div>
                  <label>Rss Link <span>*</span>:</label>
                  <input type="text" name="rss_url" class="inputtext" size="45" value="<?php echo set_value('rss_link',$site_set['rss_url']);?>" />
                </div>
              </li> -->
           
			 <!--  <li>
                <div>
                  <label>Facebook App Id<span>*</span> :</label>
                  <input name="facebook_app_id" type="text" class="inputtext" id="facebook_app_id" value="<?php echo set_value('facebook_app_id',$site_set['facebook_app_id']);?>" size=45>
                  <?=form_error('facebook_app_id')?>
                </div>
              </li>
              
              
              <li>
                <div>
                  <label>Google Plus App Key<span>*</span> :</label>
                  <input name="googleplus_app_key" type="text" class="inputtext" id="googleplus_app_key" value="<?php echo set_value('googleplus_app_key',$site_set['googleplus_app_key']);?>" size=45>
                  <?=form_error('googleplus_app_key')?>
                </div>
              </li>
              
			  
              <li>
                <div>
                  <label>Google Plus App Client Id<span>*</span> :</label>
                  <input name="googleplus_app_client_id" type="text" class="inputtext" id="googleplus_app_client_id" value="<?php echo set_value('googleplus_app_client_id',$site_set['googleplus_app_client_id']);?>" size=45>
                  <?=form_error('googleplus_app_client_id')?>
                </div>
              </li> -->
			</ul>
          </fieldset>
            <fieldset>
            <div class="title_h3">Copyright info</div>
            <ul class="frm">
              
        <li>
                <div>
                  <label>Footer Message<span>*</span> :</label>
                  <input name="copyright_info" type="text" class="inputtext" id="copyright_info" value="<?php echo set_value('copyright_info',$site_set['copyright_info']);?>" size=45>
                  <?=form_error('copyright_info')?>
                </div>
              </li>
              
             <!--  <li>
               <div>
                 <label>Twitter Link<span>*</span> :</label>
                 <input type="text" name="twitter" class="inputtext" size="45" value="<?php echo set_value('twitter',$site_set['twitter']);?>" />
               </div>
             </li>
             
                     
                     <li>
               <div>
                 <label>Google Plus Link<span>*</span> :</label>
                 <input type="text" name="google_plus" class="inputtext" size="45" value="<?php echo set_value('google_plus',$site_set['google_plus']);?>" />
               </div>
             </li>
             
             <li>
               <div>
                 <label>LinkedIn Link<span>*</span> :</label>
                 <input type="text" name="linkedin" class="inputtext" size="45" value="<?php echo set_value('linkedin',$site_set['linkedin']);?>" />
               </div>
             </li> -->
              
             
      </ul>
          </fieldset>
          <fieldset>
            <div class="title_h3">Others</div>
            <ul class="frm">
              <li>
                <div>
                  <label>Google Analytics Code<span>*</span> :</label>
                  <textarea name="google_analytics_code" cols="34" rows="3" id="google_analytics_code"><?php echo set_value('google_analytics_code',$site_set['google_analytics_code']);?></textarea>
  					<?=form_error('google_analytics_code')?>
                </div>
              </li>
              <?php if(SMS_NOTIFICATION==1):?>
              <li>
                <div>
                  <label>SMS Gateway Url :</label>
                  <input type="text" name="sms_gateway_url" class="sms_gateway_url" size="45" value="<?php echo set_value('sms_gateway_url',$site_set['sms_gateway_url']);?>" /><?=form_error('sms_gateway_url')?>
                </div>
              </li>
              <li>
                <div>
                  <label>SMS API Username :</label>
                  <Input type="text" name="sms_api_username" id="sms_api_username" value="<?php echo set_value('sms_api_username',$site_set['sms_api_username']);?>">
                  <?=form_error('sms_api_username')?>
                </div>
              </li>
              <li>
                <div>
                  <label>SMS API Password :</label>
                  <input type="password" name="sms_api_password" id="sms_api_password" value="<?php echo set_value('sms_api_password',$site_set['sms_api_password']);?>">
                <?=form_error('sms_api_password')?>
                </div>
              </li>
            <?php endif;?> 
            </ul>
          </fieldset>
          
          <fieldset class="btn">
            <input class="butn" type="submit" name="Submit" value="Update" />
          </fieldset>
        </form>
      </div>
    </section>
    <div class="clearfix"></div>
  </div>
</article>
<div> </div>

<script>
$("input:radio[name=site_status]").click(function() {
    //var value = $(this).val();
    //console.log(value);
    if ($(this).val() == '3') {
        $('#maintainanceKeyHolder').show();
    } else {
        $('#maintainanceKeyHolder').hide();
    }
});

if ($('input[name=site_status]:checked', '#siteSettingsForm').val() == '3') {
    $('#maintainanceKeyHolder').show();
} else {
    $('#maintainanceKeyHolder').hide();
}
</script>
