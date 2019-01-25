<div class="mid-part">

    <div class="main-ttl">
        <div class="container">
            <h1>Login</h1>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class=" container">
        <div class="reg-inner">
            <h2>Login to The High Tree Group</h2>
            <div class="log-form">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <form method="post" action="" enctype="multipart/form-data">
                            <fieldset>                            
                                <?php
                                if ($this->session->flashdata('error_message')) {
                                    ?>
                                    <div class="alert alert-danger fade in">
  
    <strong>Error!</strong> <?php echo '<span class="message text-danger">' . $this->session->flashdata('error_message') . '</span>';
                                ?>
</div>
                                    <?php


                                    
                                } else if ($this->session->flashdata('success_message')) {
                                    ?>
                                    <div class="alert alert-success fade in">
    
    <strong>Success!</strong> <?php     echo "<span class='text-success'>" . $this->session->flashdata('success_message') . "</span>";
                               ?>
</div>
                                    <?php
                                 }
                                ?>
                                <h4><i class="fa fa-sign-in">&nbsp;</i> Login Details</h4>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" name="email" class="form-control"  value="<?php echo set_value('email'); ?>">
                                    <?php echo form_error('email'); ?>
                                </div>
                                <div class="form-group">
                                    <label> Password</label>
                                    <input type="password" name="password" class="form-control" value="<?php echo set_value('password'); ?>">
                                    <?php echo form_error('password'); ?>
                                </div>
                                <button type="submit" name="button" class="btn">Login</button>
                            </fieldset>
                        </form>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="gray_box">
                            <p>Forgotten your password? Click here to <a href="<?php echo site_url('user/login/forget'); ?>" class="pw_reset_link">Reset Password.</a> </p>
                            <p class="b_txt">Not yet registered?</p>
                            <p>Register today...</p>
                            <p>It only take's 'two ticks' to register now...</p>
                            <div class="btn_sec"><a href="<?php echo site_url('user/register/buyer'); ?>">Buyer Register</a> <a href="<?php echo site_url('user/register/supplier'); ?>">Supplier Register</a></div>
                        </div>
                    </div>
                </div>            	
            </div>

        </div>

        <div class="clearfix"></div>
    </div>

    <div class="clearfix"></div>
</div>
</div>
