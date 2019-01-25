<?php //$this->load->library('general'); ?>
<?php
	// //check cookie
	// if(!$this->session->userdata(SESSION.'user_id')){
	// 	if(isset ($_COOKIE['email']) && $_COOKIE['email']!='' && isset($_COOKIE['password']) && $_COOKIE['password']!=''){
	// 		//login by cookie value
	// 		$this->general->check_login_process($_COOKIE['email'],$_COOKIE['password']);
	// 		//echo "<pre>"; print_r($_COOKIE); echo "</pre>"; exit;
	// 	}
	// } 
?>
<?php
	//load header
	$this->load->view('common/header');
	
	//load static banner if it is to be place in page
	if(isset($static_banner) && $static_banner=='yes'){
		$this->load->view('common/static_banner');
	}
  
?>
<?php if(isset($home) && $home == 'yes') : ?>
<div class="mid-part">
<?php endif; ?>

<?php
  // Load how it works static content if it is to be loaded
  if(isset($how_it_works) && $how_it_works=='yes'){
    $this->load->view('common/how_it_works');
  }
?>

<?php //if($this->session->userdata(SESSION.'user_id') && ($this->router->fetch_class()=='user' OR $this->router->fetch_class()=='mail')){ ?>
<?php if($this->session->userdata(SESSION.'user_id') && ($this->router->fetch_class()=='user')  OR $this->router->fetch_class()=='mail') {?>
	<div class="mid-part">

  <div class="main-ttl">
  <div class="container">
    <h1><?php if(isset($account_title)) echo $account_title;?> </h1>
  </div>
  <div class="clearfix"></div>
  </div>

  <div class=" container">
    <div class="row">
        	<?php if($this->router->fetch_method() !='auction_detail') $this->load->view('common/account_left_sidebar'); ?>
            <?php echo $template['body']; ?>
    </div>

    	<div class="clearfix"></div>
</div>

<div class="clearfix"></div>
</div>
<?php } else { ?>
<?php echo $template['body']; ?>
<?php }  ?>
<?php //echo $template['body']; ?>
<?php 
  // load why reverse auction section if it is to be place in page
  if(isset($why_reverse_auction) && $why_reverse_auction=='yes')
  {
    $this->load->view('common/why_reverse_auction');
  }
  // load about us section if it is to be place in page
  if(isset($about) && $about=='yes')
  {
    $this->load->view('common/about_hightree');
  }
?>
<!--load footer-->
<?php echo $this->load->view('common/footer');?>