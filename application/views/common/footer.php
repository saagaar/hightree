
<section>
<!--start of footer sec -->
<footer class="footer-fix">
  <div class="container">
      <div class="row">
          <div class="col-md-4 col-sm-12"><p><?php echo FOOTER_MESSAGE;?></p></div>
            <div class="col-md-4 col-sm-6 col-xs-6">
              <ul class="footer-link text-center">
              <?php 
                $cms = $this->general->get_cms_selected_fields_data(array('5','6'),array('cms_slug','heading'));
                if($cms)
                {
                  foreach($cms as $data)
                  {
                  ?>
                    <li>
                        <a href="<?php echo site_url('/page/'.$data->cms_slug); ?>"><?php echo $data->heading ?></a>
                    </li>            
                  <?php
                  }
                } 
              ?>
                    <li><a href="<?php echo site_url('/help'); ?>">Help</a></li>
                </ul>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-6">
              <div class="social-sec">
                  <h5>Be Social <i class="fa fa-angle-double-right"></i></h5>
                  <ul>
                    

<?php if (TWITTER_URL) {
    ?>
                                <li><a href="<?php echo TWITTER_URL; ?>"><i class='fa fa-twitter'></i></a></li>

    <?php
}
?>

                            <?php if (FACEBOOK_URL) {
                                ?>
                                <li><a href="<?php echo FACEBOOK_URL; ?>"><i class='fa fa-facebook'></i></a></li>

    <?php
}
?>
                            <!--                    for linkin link-->
                            <?php if (LINKEDIN_URL) {
                                ?>
                                <li><a href="<?php echo LINKEDIN_URL; ?>"><i class="fa fa-linkedin"></i></a></li>

    <?php
}
?>
                            <?php if (GOOGLE_PLUS_URL) {
                                ?>
                                <li><a href="<?php echo GOOGLE_PLUS_URL; ?>"><i class='fa fa-google-plus'></i></a></li>

    <?php
}
?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<div class="clearfix"></div>
<!--end of footer sec -->
</section>

</div>


<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'jquery.validate.min.js'); ?>"></script>
<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'additional.methods.js'); ?>"></script>
<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'validation.error.messages.js'); ?>"></script>


<script type="text/javascript" src="<?php echo site_url(USER_JS_DIR.'auction.bidding.js'); ?>"></script>


<?php //display these only if the page is auction details page ?>
<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'jquery.timer.js'); ?>"></script>

<?php if($this->session->userdata(SESSION.'user_id')){ ?>

<script type="text/javascript" src="<?php echo site_url(USER_JS_DIR.'seller.add-edit.inventory.js'); ?>"></script>

  <?php //inport jquery ui pluginn ?>
<script type="text/javascript" src="<?php echo base_url(JQUERYUI_PATH.'jquery-ui.min.js'); ?>"></script>
<link type="text/css" rel="stylesheet" href="<?php echo base_url(JQUERYUI_PATH.'jquery-ui.min.css'); ?>">
<link type="text/css" rel="stylesheet" href="<?php echo base_url(JQUERYUI_PATH.'datepicker.css'); ?>">
<script type="text/javascript" src="<?php echo base_url(JQUERYUI_PATH.'jquery-ui-timepicker-addon.js'); ?>"></script>
<link type="text/css" rel="stylesheet" href="<?php echo base_url(JQUERYUI_PATH.'jquery-ui-timepicker-addon.css'); ?>">
<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'users.form.validation.js'); ?>"></script>
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>



<script type="text/javascript" src="<?php echo site_url(USER_JS_DIR.'members.communication.js'); ?>"></script>
<script type="text/javascript" src="<?php echo site_url(USER_JS_DIR.'supplier.companydetail.edit.js'); ?>"></script>
<script type="text/javascript" src="<?php echo site_url(USER_JS_DIR.'buyer.general.profile.js'); ?>"></script>

<!-- //filter js -->

<script>
  //initialize date time picker in datepicker and datetimepicker classes
  $('body').on('focus',".datetimepicker", function(){
    $(this).datetimepicker({
      dateFormat: "yy-mm-dd",
      altFieldTimeOnly: false,
      altTimeFormat: "h:m t",
      altSeparator: " @ ",
      //buttonImage: 'http://localhost/bidwarz/themes/jqueryui/images/calendar.gif', 
          //buttonImageOnly: true
    });
  });
  
  $('body').on('focus',".datepicker", function(){
    $(this).datepicker({
      dateFormat: "yy-mm-dd"
    });
  });
</script>
<?php } else { ?>
<script type="text/javascript" src="<?php echo base_url(USER_JS_DIR.'users.form.validation.js'); ?>"></script>
<?php } ?>
<!-- Initialize FooTable -->
<script type="text/javascript">
  $(function() {
    $('.footable').footable();
  });
</script>
</body>
</html>