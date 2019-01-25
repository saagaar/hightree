<script>
var urlCheckDuplicateEmail = '<?php echo site_url("user/register/check_email_availability"); ?>';
var urlCheckDuplicateUsername = '<?php echo site_url("user/register/check_username_availability"); ?>';
</script>
<div class="mid-part">

<div class="main-ttl">
<div class="container">
	<h1>Buyer Register</h1>
</div>
<div class="clearfix"></div>
</div>

<div class=" container">
	<div class="reg-inner">
    	<h2>Register as a Buyer on The High Tree Group</h2>
        <p>Join today for free  and you're on your way to saving up to 36% on your purchasing!</p> 
		<p>We can quickly place you in control and en route to delivering future procurement savings.</p>

		<b>(<em>*</em> ) is mandatory field.</b>
        
        <div class="log-form">
            	<form id="buyer_registration_form" method="post" action="">
					<fieldset>
						<?php if($this->session->flashdata('success_message')) {
							echo  "<span class='text-success'>".$this->session->flashdata('success_message')."</span>";
						} else if($this->session->flashdata('error_message')) {
							echo  "<span class='text-danger'>".$this->session->flashdata('error_message')."</span>";

						}
						?>
						<h4><i class="fa fa-user">&nbsp;</i> Personal Details</h4>
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label><em>*</em> First Name</label>
								<input type="text" name="first_name" class="form-control" value="<?php echo set_value('first_name'); ?>">
                                <?php echo form_error('first_name'); ?>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label><em>*</em> Last Name</label>
								<input type="text" name="last_name" class="form-control" value="<?php echo set_value('last_name'); ?>">
                                <?php echo form_error('last_name'); ?>

								</div>
							</div>
                            <div class="row">
								<div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label><em>*</em> Email</label>
								<input type="email" name="email" class="form-control" value="<?php echo set_value('email'); ?>">
                                <?php echo form_error('email'); ?>
                                
								</div>
								<div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label><em>*</em> Contact Number</label>
								<input type="text" name="phone" class="form-control" value="<?php echo set_value('phone'); ?>">
                                <?php echo form_error('phone'); ?>

								</div>
							</div>
                            
                            <h4><i class="fa fa-sign-in">&nbsp;</i> Login Details</h4>
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label><em>*</em> User Name</label>
								<input type="text" name="username"  class="form-control" value="<?php echo set_value('username'); ?>">
                                <?php echo form_error('username'); ?>

								</div>
								<div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <label><em>*</em> Password</label>
								<input type="password" name="password" class="form-control" value="<?php echo set_value('password'); ?>">
                                <?php echo form_error('password'); ?>

								</div>
							</div>
                            
                            <div class="form-group terms">
                            	<input type="checkbox" name="terms_conditions"><span>By proceeding, you agree to the High Tree Group <a href="<?php if($terms_condition) {echo site_url('/page/').'/'.$terms_condition->cms_slug;} else {echo '#';} ?>">Terms & Conditions</a>.</span><br />
                            	<?php echo form_error('terms_conditions'); ?>
                            	 <div id="terms_error"></div>
                            </div>
							
                          <button id="btnBuyerRegistration" type="submit" name="button" class="btn">Register</button>
                            
					</fieldset>
				</form>
            </div>
        
    </div>
	
<div class="clearfix"></div>
</div>

<div class="clearfix"></div>
</div>