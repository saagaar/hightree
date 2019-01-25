<script type="text/javascript">
  var ChangeProfileUrl = "<?php echo site_url('/'.MY_ACCOUNT.'changeprofilepicture');?>";
  var UrlRemoveDropzoneTempImage = "<?php echo site_url('/'.MY_ACCOUNT.'ajax_delete_product_temp_images'); ?>";
</script>
<div class="col-md-8 col-sm-7">
          <div class="dashboard_filter">
          <div class="about_user">

            <div class="row">
              <div class="col-md-6">
               



              <figure>
              <img id="pp" class="uploadFileImg" src="<?php if($details->cover_image != '') { echo base_url().USER_IMAGE_PATH.$details->cover_image;} else {echo base_url().USER_IMAGE_PATH.'profile.png';} ?>" alt="Image" />
                <i class="fa fa-camera uploadFileImg">&nbsp;</i>
                <img src="<?php  echo base_url().USER_IMG_DIR.'loading-bid.gif'?>" class="profileloader" style="display:none"> 
              </figure>
             <form name="changeprofileform" id="changeprofileform" enctype="multipart/form-data">
               <input type="file" name="profile_picture" style="position:absolute; opacity:0;" id="profile_picture"/>
            </form>

              <div class="msg">
                  
              </div>
           
                <ul class="user_info">
                 <li><?php
                      
                               $name=isset($details->name) ? $details->name : ''; 
                               $lastname=isset($details->last_name) ? $details->last_name : ''; 
                         echo ucfirst($name.' '. $lastname); ?>
                         </li>
                         <li>
                            <?php $percentage=isset($my_rating->averagerating)?($my_rating->averagerating/5)*100:0;

                            ?>
                             <div class="star-ratings-sprite">
                               <span style="width:<?php echo $percentage;?>%" class="star-ratings-sprite-rating"></span>
                             </div>
                         </li>
                          <li><?php echo count($productwise_rating);?> Review</li>
                </ul>
              </div>
              <div class="col-md-6">

                <ul class="pull-right">
                <?php 
                  $rem_days='';
                    if(($memberinfo->membership_type)!=''){
                        $membertype=explode('_',$memberinfo->membership_type);
                        $membership=implode(' ', array_map('ucfirst', $membertype));

                        $expiry=$this->general->get_remaining_time($memberinfo->member_validity);
                        if($memberinfo->membership_type=='unlimited' && $expiry<0)  
                             { 
                                $rem_days='Expired' ;
                            }
                            else if($expiry>0)
                                {   
                                   $rem_days=$this->general->timeRemaining($expiry);
                                }
                            else{
                                     $rem_days='Expired';

                                }

                    }else{
                        $membership='None';
                        $rem_days='N/a';
                    }
                ?>
                  <p>Membership: <span><?php echo $membership;?></span></p>

                    <p>Membership Expire: <span><?php echo $rem_days;?></span></p>

                </ul>    

                </div>

              </div>
              </div>
            
            <div class="row">
            <form id="filter-form" method="post" action="">
              <input id="cat" type="hidden" name="cat" value="<?php echo set_value('cat'); ?>">
              <input id="subcat" type="hidden" name="subcat" value="<?php echo set_value('subcat'); ?>">
              <input id="filter" type="hidden" name="filter" vlaue="">
              <div class="col-md-6 col-sm-6 col-xs-5">
                  <div class="dropdown">
                    <a href="#" class="filter_name" data-toggle="dropdown">Filter <i class="fa fa-angle-down"></i></a>
                   
                 
   

                    <ul id="filter-list" class="dropdown-menu">
                        <li class="sort_item" value="1"><a href="javascript:void(0);" >Low to High Price</a></li>
                        <li class="sort_item" value="2"><a href="javascript:void(0);" >High to Low Price</a></li>
                        <li class="sort_item" value="3"><a href="javascript:void(0);" >Ending Soon</a></li>
                        <li class="sort_item" value="4"><a href="javascript:void(0);" >Latest Auction</a></li>
                    </ul>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-7">
                  <!-- <div class="dropdown pull-right">
                    <a href="#" class="filter_name" data-toggle="dropdown">Browse By Category <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Category 1</a></li>
                        <li><a href="#">Category 2</a></li>
                        <li><a href="#">Category 3</a></li>
                        <li><a href="#">Category 4</a></li>
                        <li><a href="#">Category 5</a></li>
                    </ul>
                  </div> -->
                  <div class="btn_item dropdown drilldown  pull-right">
          <a class="btn btn_item_select dropdown-toggle" data-toggle="dropdown" type="button" id="chooseCategory"> <?php if(isset($_POST['categoryName']) && $_POST['categoryName']!=''){echo $_POST['categoryName'];}else{echo 'Choose Category';}; ?> <span class="fa fa-angle-down"></span> </a>
         <ul class="dropdown-menu category" role="menu">
            <?php
        if($category_tree){
          foreach($category_tree as $category)
          {
            ?>
                        <li <?php if($category['subcat']==''){ ?> onclick="addCategory('<?php echo $category['name']; ?>','<?php echo $category['id']; ?>','0')" <?php } else { ?>class="dropdown-submenu"<?php }?>>
                          <a href="javascript:void(0)" tabindex="-1"><?php echo $category['name']; ?></a>
                          <?php if($category['subcat']!=''){ ?>
                <ul class="dropdown-menu" >
                  <?php foreach($category['subcat'] as $subcat){?>
                                      <li onclick="addCategory('<?php echo $subcat['name']; ?>','<?php echo $category['id']; ?>','<?php echo $subcat['id']; ?>')"> 
                                          <a href="javascript:void(0)" data-clickable="data-clickable" tabindex="-1">
                        <?php echo $subcat['name']; ?>
                                          </a>
                                      </li>
                                    <?php } ?>
                </ul>
              <?php } ?>
                       </li> 
                        <?php
          }
        }
      ?>
             </ul> 
         </div>
        <input type="hidden" name="category" id="hiddenCatField" value="<?php if(isset($_POST['category']) && $_POST['category']!=''){echo $_POST['category'];}; ?>" />
        <?=form_error('category')?>
        <input type="hidden" name="categoryName" id="hiddenCatName" value="<?php if(isset($_POST['categoryName']) && $_POST['categoryName']!=''){echo $_POST['categoryName'];}; ?>" />
      
                </div>
                </form>
            </div>
            
            <div class="clearfix"></div>
            </div>
            <div class="f_content" id="f_content">
                  <?php if($live_products) { ?>
                  <ul class="dash_inner">
                  <?php foreach($live_products as $product) { ?>
                      <li>
                        <a href="<?php echo site_url('/'.MY_ACCOUNT. 'auction_detail/'. $product->id); ?>"><?php echo $product->name; ?></a>
                          <p><?php echo $product->description; ?></p>
                          <span>End Date: <?php echo substr($this->general->format_date_time_auction($product->auc_end_time), 0, -9); ?> </span> <span><i class="fa fa-clock-o"></i> <?php echo substr($this->general->format_date_time_auction($product->auc_end_time), -9); ?></span>
                      </li>                
                    <?php } ?>
                  </ul>
                  <section> 
                    <!-- pagination-Sec -->  
                    <nav class="pagination_sec">
                      <ul class="pagination">
                        <?php if($links) { echo $links; }; ?>
                      </ul>
                      <div class="clearfix"></div>
                    </nav>
                    <!--/.end-->
                  </section>

                  <?php } else { ?>
                    No live products
                  <?php } ?>
            </div>
        </div>

<script type="text/javascript">
  var BASE_URL="<?php echo base_url();?>"

  $(function(){
    $(".uploadFileImg").on('click',function(){
   //on click of image trigger click of input type=file
   $("#profile_picture").trigger('click'); 
});
  })
  
</script>
<script type="text/javascript" src="<?php echo site_url(USER_JS_DIR.'item_filter.js'); ?>"></script>
