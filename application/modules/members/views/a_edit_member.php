<script type="text/javascript">
$(document).ready(function() {

$("#chang_pass").click(function() {
	$("#change_password").html('<input name="password" type="text" class="inputtext" id="password" size="30" /> <input class="bttn" type="button" name="Submit" value="Change" id="changed"  onclick="changedpassword(this.value)" />');
});
});

function changedpassword(value) {
	$.post('<?=site_url(ADMIN_DASHBOARD_PATH).'/members/change_user_password'?>', 
	$("#uprofile").serialize(), 
	function(data)
	{
		$("#change_password").html('<span class="error">'+data+'</span>');
	});
}
</script>

<section class="title">
  <div class="wrap">
    <h2><a href="<?=site_url(ADMIN_DASHBOARD_PATH)?>">ADMIN</a> &raquo; Members  Management </h2>
  </div>
</section>
<article id="bodysec" class="sep">
  <div class="wrap">
  	<aside class="lftsec">
      <?php $this->load->view('menu'); ?>
    </aside>
    <section class="smfull">
      <div class="confrmmsg">
        <?php 
            if($this->session->flashdata('message')){
            echo "<p>".$this->session->flashdata('message')."</p>";
            }
        ?>
      </div>
      
      <div class="box_block">
        <form name="sitesetting" method="post" action="" enctype="multipart/form-data" accept-charset="utf-8" id="uprofile">
         <input name="user_id" type="hidden" id="user_id" value="<?php echo $profile->id;?>" size="15" />
          <fieldset>
            <div class="title_h3">Personnel Detail</div>
            <ul class="frm">
               <li>
                <div>
                  <label>First Name <span>*</span> :</label>
                  <input type="text" name="name" class="inputtext" size=45 value="<?php echo set_value('name', $profile->name);?>">
                  <?=form_error('name')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Last Name <span>*</span> :</label>
                  <input type="text" name="last_name" class="inputtext" size=45 value="<?php echo set_value('last_name', $profile->last_name);?>">
                  <?=form_error('last_name')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Email <span>*</span></label>
                  <input type="text" name="email" class="inputtext" size=45 value="<?php echo set_value('email', $profile->email);?>">
                  <?=form_error('email')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Login Username <span>*</span></label>
                  <input type="text" name="username" class="inputtext" size=45 value="<?php echo set_value('username', $profile->username);?>">
                  <?=form_error('username')?>
                </div>
              </li>
              
              <?php //if($profile->reg_type=='website' OR $profile->reg_type=='admin'){ ?>
              <li>
                <div>
                  <label>Login Password :</label>
                 <span id="change_password">********** <a href="javascript:void();" id="chang_pass">Click to Change Password</a></span>
                </div>
              </li>
              <?php //} ?>
              
              <li>
                <div>
                  <label>Phone Number <span>*</span> :</label>
                  <input type="text" name="phone" class="inputtext" size=45 value="<?php echo set_value('phone', $profile->phone);?>">
                  <?=form_error('phone')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Mobile <span>*</span> :</label>
                  <input type="text" name="mobile" class="inputtext" size=45 value="<?php echo set_value('mobile', $profile->mobile);?>">
                  <?=form_error('mobile')?>
                </div>
              </li>
              <li>
                <div>
                  <label>User type:</label>  
                                 
                    <input name="user_type" type="radio" value="3" checked="checked" />Buyer
                    <input name="user_type" type="radio" value="4" <?php if($profile->user_type == '4' || ($this->input->post('user_type') && $this->input->post('user_type') == '4')){ echo 'checked="checked"';}?> />Supplier
                </div>
              </li>
               <li>
                <div>
                  <label>Status:</label>
                 	<input name="status" type="radio" value="1" checked="checked" />Active
                  	<input name="status" type="radio" value="2" <?php if($profile->status == '2'){ echo 'checked="checked"';}?> />Inactive
                  	<input name="status" type="radio" value="3" <?php if($profile->status == '3'){ echo 'checked="checked"';}?>/>Suspended
                    <input name="status" type="radio" value="4" <?php if($profile->status == '4'){ echo 'checked="checked"';}?>/>Closed
                </div>
              </li>
              <li>
                <div>
                  <label>About user <span>*</span> :</label>
                  <textarea name="about_user" class="inputtext"><?php echo set_value('about_user', $profile->about_user);?></textarea>
                  <?=form_error('about_user')?>
                </div>
              </li>
            </ul>
            </ul>
          </fieldset>
          
          
          <fieldset>
            <div class="title_h3">Address Details</div>
            <ul class="frm">
              <li>
                <div>
                  <label>Address1<span>*</span> :</label>
                  <input name="address" type="text" class="inputtext" id="address" value="<?php echo set_value('address', $profile->address);?>" size=45>
                  <?=form_error('address')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Address2<span>*</span> :</label>
                  <input name="address2" type="text" class="inputtext" id="address2" value="<?php echo set_value('address2', $profile->address2);?>" size=45>
                  <?=form_error('address2')?>
                </div>
              </li>
              <li>
                <div>
                  <label>City<span>*</span> :</label>
                  <input name="city" type="text" class="inputtext" id="city" value="<?php echo set_value('city',$profile->city);?>" size=45>
                  <?=form_error('city')?>
                </div>
              </li>           
              <li>
                <div>
                  <label>State<span>*</span> :</label>
                  <input name="state" type="text" class="inputtext" id="state" value="<?php echo set_value('state', $profile->state);?>" size=45>
                  <?=form_error('state')?>
                </div>
              </li>  
              <li>
                <div>
                  <label>Country <span>*</span> :</label>
                  <?php 
          				 	$selected_country = $profile->country;
          				 	if($this->input->post('country',TRUE)){
          						$selected_country = $this->input->post('country',TRUE);
          					}
          					
          					$country_arr = array();
          					$country_arr[''] = "Select Country";
          					foreach($countries as $country)	
          					{
          						$country_arr[$country->id] = $country->country;
          					}
          					echo form_dropdown('country', $country_arr , $selected_country);
        				  ?>
			          <?=form_error('country')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Post Code<span>*</span> :</label>
                  <input name="post_code" type="text" class="inputtext" id="post_code" value="<?php echo set_value('post_code', $profile->post_code);?>" size=45>
                  <?=form_error('post_code')?>
                </div>
              </li>
              
              
              
            </ul>
          </fieldset>
          <fieldset>
            <div class="title_h3">Company Details</div>
            <ul class="frm">
              <li>
                <div>
                  <label>Company Name<span>*</span> :</label>
                  <input name="company_name" type="text" class="inputtext" id="company_name" value="<?php echo set_value('company_name', $profile->company_name);?>" size=45>
                  <?=form_error('company_name')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company Info<span>*</span> :</label>
                  <textarea name="company_info" type="text" class="inputtext" id="company_info" ><?php echo set_value('company_info', $profile->company_info);?></textarea>
                  <?=form_error('company_info')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company Description<span>*</span> :</label>
                  <textarea name="description" type="text" class="inputtext" id="description" ><?php echo set_value('description', $profile->description);?></textarea>
                  <?=form_error('description')?>
                </div>
              </li>
            </ul>
          </fieldset>
          <fieldset>
            <div class="title_h3">Company Address Details</div>
            <ul class="frm">
              <li>
                <div>
                  <label>Company Address1<span>*</span> :</label>
                  <input name="company_address1" type="text" class="inputtext" id="company_address1" value="<?php echo set_value('company_address1', $profile->company_address1);?>" size=45>
                  <?=form_error('company_address1')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company Address2<span>*</span> :</label>
                  <input name="company_address2" type="text" class="inputtext" id="company_address2" value="<?php echo set_value('company_address2', $profile->company_address2);?>" size=45>                
                  <?=form_error('company_address2')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company City<span>*</span> :</label>
                  <input name="company_city" type="text" class="inputtext" id="company_city" value="<?php echo set_value('company_city', $profile->company_city);?>" size=45>                
                  <?=form_error('company_city')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company State<span>*</span> :</label>
                  <input name="company_state" type="text" class="inputtext" id="company_state" value="<?php echo set_value('company_state', $profile->company_state);?>" size=45>                
                  <?=form_error('company_state')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company Zip Code<span>*</span> :</label>
                  <input name="company_zipcode" type="text" class="inputtext" id="company_zipcode" value="<?php echo set_value('company_zipcode', $profile->company_zipcode);?>" size=45>                
                  <?=form_error('company_zipcode')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company Country <span>*</span> :</label>
                  <?php 
                    $selected_company_country = $profile->company_country;
                    if($this->input->post('company_country',TRUE)){
                      $selected_company_country = $this->input->post('company_country',TRUE);
                    }
                    
                    $company_country_arr = array();
                    $company_country_arr[''] = "Select Country";
                    foreach($countries as $country) 
                    {
                      $company_country_arr[$country->id] = $country->country;
                    }
                    echo form_dropdown('company_country', $company_country_arr , $selected_company_country);
                  ?>
                  <?=form_error('company_country')?>
                </div>
              </li>

              <li>
                <div>
                  <label>Company Phone<span>*</span> :</label>
                  <input name="company_phone" type="text" class="inputtext" id="company_phone" value="<?php echo set_value('company_phone', $profile->company_phone);?>" size=45>                
                  <?=form_error('company_phone')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company Fax<span>*</span> :</label>
                  <input name="company_fax" type="text" class="inputtext" id="company_fax" value="<?php echo set_value('company_fax', $profile->company_fax);?>" size=45>                
                  <?=form_error('company_fax')?>
                </div>
              </li>
              <li>
                <div>
                  <label>Company Website<span>*</span> :</label>
                  <input name="company_website" type="text" class="inputtext" id="company_website" value="<?php echo set_value('company_website', $profile->company_website);?>" size=45>                
                  <?=form_error('company_website')?>
                </div>
              </li>
            </ul>
          </fieldset>
          
          <fieldset>
            <div class="title_h3">Registration Details (Details that cannot be edited)</div>
            <ul class="frm">
            <li>
                <div>
                  <label>Registered Date</label>
                  <input type="text" readonly="readonly" disabled="disabled" class="inputtext" size=45 value="<?php echo $profile->reg_date;?>">
                </div>
              </li>
              
              <li>
                <div>
                  <label>Registered IP</label>
                  <input type="text" readonly="readonly" disabled="disabled" class="inputtext" size=45 value="<?php echo $profile->reg_ip;?>">
                </div>
              </li>
              
              <li>
                <div>
                  <label>Last Login Date</label>
                  <input type="text" readonly="readonly" disabled="disabled" class="inputtext" size=45 value="<?php echo $profile->last_login_date;?>">
                </div>
              </li>
              
              <li>
                <div>
                  <label>Last Login IP</label>
                  <input type="text" readonly="readonly" disabled="disabled" class="inputtext" size=45 value="<?php echo $profile->last_login_ip;?>">
                </div>
              </li>
            </ul>
          </fieldset>
          
          <fieldset class="btn">
            <input class="butn" type="submit" name="Submit" value="EDIT" />
          </fieldset>
        </form>
      </div>
    </section>
    <div class="clearfix"></div>
  </div>
</article>
<div> </div>
