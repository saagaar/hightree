<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title><?php echo $template['title']; ?></title>

<meta name="keywords" content="<?php echo $meta_keys;?>" />

<meta name="description" content="<?php echo $meta_desc;?>" />

<link rel="shortcut icon" href="<?php echo base_url().USER_IMG_DIR; ?>logo.png">

<link type="text/css" rel="stylesheet" href="<?php echo base_url(USER_CSS_DIR.'font-awesome.min.css'); ?>" >

<link type="text/css" rel="stylesheet" href="<?php echo base_url(USER_CSS_DIR.'bootstrap.min.css'); ?>" >

<!--<link type="text/css" rel="stylesheet" href="css/footable.bootstrap.min.css">-->

<link type="text/css" rel="stylesheet" href="<?php echo base_url(USER_CSS_DIR.'style.css'); ?>">

<link type="text/css" rel="stylesheet" href="<?php echo base_url(USER_CSS_DIR.'responsive.css'); ?>">



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->

<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>

      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>

      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->

    

<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'jquery.min.js'); ?>"></script> 

<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'bootstrap.min.js'); ?>"></script> 

<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'footable.js'); ?>"></script> 

<?php if((isset($account_menu_active) && $account_menu_active=='create_auction') || $this->router->fetch_method() == 'auction_detail'  || $this->router->fetch_method() == 'edit_auction' || $this->router->fetch_method() == 'send_message') { ?>

<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'bootstrap-filestyle.min.js'); ?>"></script> 

<?php } 
if((isset($account_menu_active) && $account_menu_active=='won_bids') || $this->router->fetch_method() == 'bid_details' ) { ?>
<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'userrating.js'); ?>"></script> 

<?php 
}
?>


</head>



<body>

 <!-- <div class="loading-modal">

  <img class="loading-img" src="<?php echo site_url('/'.USER_IMG_DIR.'loading-bid.gif');?>">

</div>  -->



<div class="wrapper">

<section>

<!--start of header -->

<header>

  <div class="container">

<nav class="navbar">

    <!-- Brand and toggle get grouped for better mobile display -->

    <div class="row">

      <div class=" col-lg-10 col-md-9 col-sm-9">

        

        <div class="navbar-header">

        <a class="navbar-brand" href="<?php echo site_url(); ?>"><img src="<?php echo base_url().USER_IMG_DIR; ?>logo.png" alt="Hightree Group" /></a>

      <button type="button" class="navbar-toggle collapsed" title="menu" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">

        <span class="sr-only">Toggle navigation</span>

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>

      </button>

      

    </div>



    <!-- Collect the nav links, forms, and other content for toggling -->

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">



      <ul class="nav navbar-nav navbar-right">

        <li  <?php if($this->uri->segment(1)=='home' || $this->uri->segment(1)==''){echo 'class="active"';} ?>><a href="<?php echo site_url(); ?>">Home</a></li>

        <?php 

            if($this->session->userdata(SESSION.'user_id'))

              $cms = $this->general->get_cms_selected_fields_data(array('2'),array('cms_slug','heading'));

            else

              $cms = $this->general->get_cms_selected_fields_data(array('2','8','9'),array('cms_slug','heading'));



                if($cms)

                {

                  foreach($cms as $data)

                  {

                  ?>

                    <li <?php if($this->uri->segment(1)=='page' && $this->uri->segment(2)==$data->cms_slug){echo 'class="active"';} ?>>

                        <a href="<?php echo site_url('/page/'.$data->cms_slug); ?>"><?php echo $data->heading ?></a>

                    </li>            

                  <?php

                  }

                } 

      ?>

         <li><?php if(isset($account_menu_active) && $account_menu_active=='contact'){echo 'class="active"';} ?><a href="<?php echo site_url('page/contact'); ?>" class="notify">Contact</a></li>

         <?php if($this->session->userdata(SESSION.'user_id')) { ?>
          <li class="dropdown notification"><a href="javascript:void(0)" class="notify" data-toggle="dropdown"><i class="fa fa-bell"><span><?php 
         $notify=$this->general->getunseenmessagenotification($this->session->userdata(SESSION.'user_id'));
         // print_r($notify);
          echo count($notify);
         ?></span></i></a>
         <?php if(count($notify>0)){?>
             <ul class="dropdown-menu">
                <li>
                <?php foreach ($notify as $key => $value) {
                  ?>
                   <a href="<?php echo site_url('/'.MY_ACCOUNT.'send_message/'.$value->product_id.'/'.$value->bid_id);?>">
                     <b><?php echo $value->productname;?></b> <span><?php echo (substr($value->message, 0,45). '....') ;?></span> 
                    </a>
                  <?php
                  }?>
                </li>
            </ul>
          <?php } ?>
         </li>

       

         <?php } ?>

      </ul>

      

    </div><!-- /.navbar-collapse -->

        

        </div>

        <div class="col-lg-2 col-md-3 col-sm-3">

          <ul class="reg-link pull-right">

          <?php if($this->session->userdata(SESSION.'user_id')) { ?>

              <li class="user-drilldown dropdown pull-right">

                <a href="#" class="user-name" data-toggle="dropdown"><i class="fa fa-user pull-left"></i><?php echo $this->session->userdata(SESSION.'username'); ?></a>

                <?php if($this->session->userdata(SESSION.'usertype')=='4') { ?>

                <ul class="dropdown-menu">

                    <li <?php if(isset($account_menu_active) && $account_menu_active=='dashboard'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'supplier'); ?>">Dashboard</a></li>

                    <li <?php if(isset($account_menu_active) && $account_menu_active=='company_details'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'company_details'); ?>">Personal/Company Details</a></li>

                    <?php if($this->general->get_bid_member_validity($this->session->userdata(SESSION. 'user_id')) != 'unlimited') { ?>

                    <li <?php if(isset($account_menu_active) && $account_menu_active=='supplier_packages'){echo 'class="active"';} ?>><a href="<?php echo site_url('/'. MY_ACCOUNT. 'supplier_packages'); ?>">Membership Packages</a></li>

                    <?php }?>

                    <li <?php if(isset($account_menu_active) && $account_menu_active=='proposal_bids'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'proposal_bids'); ?>">My Proposal Bid</a></li>

                    <li <?php if(isset($account_menu_active) && $account_menu_active=='won_bids'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'won_bids'); ?>">My Won Bid</a></li>
                    <li <?php if(isset($account_menu_active) && $account_menu_active=='transaction_history'){echo 'class="active"';} ?>><a href="<?php echo site_url('/'. MY_ACCOUNT. 'transaction_history'); ?>">Transaction History</a></li>
         
                    <!-- <li <?php if(isset($account_menu_active) && $account_menu_active=='supplier_message'){echo 'class="active"';} ?>><a href="<?php echo site_url('/my-messages/supplier_inbox'); ?>">My Message</a></li> -->

                    <!-- <li <?php if(isset($account_menu_active) && $account_menu_active=='supplier_notification'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'supplier_notification'); ?>">Notification Settings</a></li> -->

                    <li <?php if(isset($account_menu_active) && $account_menu_active=='supplier_change_password'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'supplier_change_password'); ?>">Change Password</a></li>

                    <li><a href="<?php echo site_url('/user/logout'); ?>">Logout</a></li>

                </ul>  

                <?php } elseif($this->session->userdata(SESSION.'usertype')=='3') {?>   

                  <ul class="dropdown-menu">

                      <li <?php if(isset($account_menu_active) && $account_menu_active=='dashboard'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'buyer'); ?>">Dashboard</a></li>

                      <li <?php if(isset($account_menu_active) && $account_menu_active=='buyers_profile'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'buyer_profile'); ?>">My Profile</a></li>

                      <?php if($this->general->get_auction_post_member_validity($this->session->userdata(SESSION. 'user_id')) != 'unlimited') { ?>

                        <li <?php if(isset($account_menu_active) && $account_menu_active=='buyer_packages'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'buyer_packages'); ?>">Membership Package</a></li>

                      <?php }?>

                      <li <?php if(isset($account_menu_active) && $account_menu_active=='create_auction'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'create_auction'); ?>">Create Auction</a></li>

                      <li <?php if(isset($account_menu_active) && $account_menu_active=='view_auction'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'view_auction'); ?>">View Auction</a></li>
                      <li <?php if(isset($account_menu_active) && $account_menu_active=='transaction_history'){echo 'class="active"';} ?>><a href="<?php echo site_url('/'. MY_ACCOUNT. 'transaction_history'); ?>">Transaction History</a></li>
         
                      <!-- <li <?php if(isset($account_menu_active) && $account_menu_active=='buyer_message'){echo 'class="active"';} ?>><a href="<?php echo site_url('/my-messages/buyer_inbox'); ?>">Message</a></li> -->

                      <!-- <li <?php if(isset($account_menu_active) && $account_menu_active=='buyer_notification'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'buyer_notification'); ?>">Notification Settings</a></li> -->

                      <li <?php if(isset($account_menu_active) && $account_menu_active=='buyer_change_password'){echo 'class="active"';} ?>><a href="<?php echo site_url(MY_ACCOUNT.'buyer_change_password'); ?>">Change Password</a></li>

                      <li><a href="<?php echo site_url('/user/logout'); ?>">Logout</a></li>

                  </ul>

                <?php  } ?>           

              </li>

          <?php } else { ?>

                <li><div class="btn-head"><a href="<?php echo site_url('/user/login/') ?>"  class="login">login</a> / <a href="<?php echo site_url('user/register/supplier'); ?>" class="register">Register</a></div></li>

          <?php } ?>

          </ul>

        </div>

    </div>



</nav>

</div>

<div class="clearfix"></div>

</header>

<div class="clearfix"></div>

<!--end of header -->

</section>