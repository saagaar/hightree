<?php if($user_id){ ?>
<section class="virtual_banner">
  <figure><img src="<?php echo base_url(USER_IMG_DIR.'virtual.png'); ?>"></figure>
  <div class="clearfix"></div>
</section>
<?php } ?>

<section class="mid_part">
  <div class="<?php echo ($user_id)?'col-md-9':'container';  ?>">
    <div class="white_box">
      <h2 id="productName"><?php echo $product->product_name; ?></h2>
      <div class="row">
        <aside class="col-md-7 col-sm-6">
          <div class="row" id="imgArea">
            <div class="col-md-10 dtl_img">
              <figure><img src="<?php echo site_url(PRODUCT_IMAGE_PATH.$product_images[0]); ?>" id="bigImg"></figure>
            </div>
            <div class="col-md-2 smallThumbs">
              <?php
            	$i=1;
				foreach($product_images as $image){
				?>
              		<a href="javascript:void(0)" class="thumbs<?php if($i==1){echo ' active';} ?>" data-link="<?php echo site_url(PRODUCT_IMAGE_PATH.$image); ?>">
              			<figure><img src="<?php echo SITE_URL(PRODUCT_IMAGE_PATH.'thumb_'.$image); ?>" ></figure>
              		</a>
              	<?php
               	$i++;
			   }
			  ?>
            </div>
          </div>
        </aside>
        
        <aside class="col-md-5 col-sm-6"  >
          <section class="seller_info" id="sellerInfo">
          	<strong><i class="fa fa-user"></i> &nbsp; Seller Info</strong>
            <div class="row">
              <div class="col-sm-6"> <a href="<?php echo site_url('user/'.$product->seller_id.'/'.$this->general->clean_url($product->seller_name)); ?>"><?php echo $product->seller_name; ?></a></div>
              <div class="col-sm-6"> <i class="fa fa-star"></i> 137 positive reviews </div>
            </div>
            <div class="col-md-12 btn_section text-center">
              <?php if($page_for=='bid'){ ?>
              <div class="col-sm-6 bdr_right">
                <h1><?php echo DEFAULT_CURRENCY_SIGN; ?><span id="bidAmt_<?php echo $product->product_id; ?>"><?php echo $product->auc_current_price; ?></span></h1>
                
                <div class="btn-green">
                	<?php
						//check whether this user is a logged in user or not
                    	if($user_id){
							//check whether this users paypal is verified or not
							if($paypal_verified){ ?>
                                	<button class="btn_cat" id="placeBidBtn">BID NOW</button>
                                <?php }else{ ?>
                            	<!--Action to be performed if paypal is not verified-->
                                <a href="javascript:void(0)" class="btn_cat" onclick="return PaypalVerificationError();">BID NOW</a>
                            <?php }	}else{ ?>
                    	<a href="javascript:void(0)" class="btn_cat" data-toggle='modal' data-target='#loginSignupModal'>BID NOW</a>
                    <?php } ?>
                </div>
              </div>
              
              <input type="hidden" id="remainingTime" value="<?php echo (strtotime($product->auc_end_time) - strtotime($current_date)); ?>" />
              <input type="hidden" id="endDateTime" value="<?php echo strtotime($product->auc_end_time); ?>" />
             
              <script>
			 	window.onload = function() {
					//console.log(myVars);
					myVars.aid = '<?php echo $product->host_id; ?>';
					myVars.pid = '<?php echo $product->product_id; ?>';
					myVars.uid = '<?php echo $user_id; ?>';
					myVars.bid_time = '<?php echo BID_TIME; ?>';
					myVars.auction_end_time = '<?php echo strtotime($product->auc_end_time) ; ?>';
					myVars.server_current_time = '<?php echo strtotime($current_date) ?>';
					myVars.reset_time = '<?php echo AUCTION_RESET_TIME; ?>'; //reset time (in seconds). we reset time to this time when timer is less than this time.
					myVars.bid_increment = '<?php echo BID_PRICE_INCREMENT; ?>';
					
					var RunTimer = new auctionUpdater();
					$(document).everyTime('1s',function(i){
						RunTimer.updateTimer();
					},0);
				};
           	</script>
                    
                    
			<div class="col-sm-6">
              	<b>Bidlord</b>
                <time id="timer_<?php echo $product->product_id; ?>">Checking...</time>
              </div>
              <?php }else if($page_for=='buy'){ ?>
              <?php if($product->buy_now=='1' && $product->buy_now_quantity>$product->order_quantity){ ?>
              <div class="col-sm-6 bdr_right">
                <h1><?php echo DEFAULT_CURRENCY_SIGN.''.$product->buy_now_price; ?></h1>
                <div class="btn-yellow"> <a href="<?php echo site_url(MY_ACCOUNT.'purchase_checkout/'.$product->product_id.'/'.$this->general->clean_url($product->product_name)); ?>" class="btn_cat">BUY NOW</a> </div>
              </div>
              <?php } ?>
              <div class="<?php echo($product->buy_now=='0' OR $product->buy_now_quantity<=$product->order_quantity)?'col-sm-12':'col-sm-6';?>"> 
                <!--<p>Starts Monday at 12am</p>-->
                <p>Starts <?php echo $this->general->short_date_time_format($product->start_date_time); ?></p>
                
                <div id="reminderArea">
                <?php
                	if($user_id){ 
						if(isset($reminder) && $reminder!=false){ ?>
							<div class="btn-gray"><a href="javascript:void(0)" class="btn_cat" id="removeReminder" data-host='<?php echo $host_detail->id; ?>' data-uid='<?php echo $user_id; ?>' data-type='item' data-item="<?php echo $product_id; ?>">We'll Remind You</a></div>
						<?php }else{ ?>
                        	<div class="btn-green"><a href="javascript:void(0)" class="btn_cat" id="setReminder" data-host='<?php echo $host_detail->id; ?>' data-uid='<?php echo $user_id; ?>' data-type='item' data-item="<?php echo $product_id; ?>">Set a Reminder</a></div>
						<?php 
						}
					}else{ ?>
                	<div class="btn-green"><a href="javascript:void(0)" class="btn_cat" data-toggle='modal' data-target='#loginSignupModal'>Set a Reminder</a></div>
              	<?php } ?>	
                </div>
              </div>
              <?php } ?>
            </div>
            <div class="clearfix"></div>
            <ul>
              <li><span><i class="fa fa-gavel">&nbsp;</i> Starting Bid</span><span><?php echo DEFAULT_CURRENCY_SIGN.$product->start_bid; ?></span></li>
			  	<?php if($page_for=='bid' && $product->retail_price!=0){ ?>
              		<li><span><i class="fa fa-tag">&nbsp;</i> Discount</span><span id="priceDiscount"><?php echo ($product->retail_price >= $product->auc_current_price) ? (number_format($this->general->calculate_percentage($product->retail_price, $product->auc_current_price))):0; ?>%</span></li>
				<?php }else if($page_for=='buy' && $product->retail_price!=0){?>
              		<li><span><i class="fa fa-tag">&nbsp;</i> Discount</span><span><?php echo number_format($this->general->calculate_percentage($product->retail_price, $product->buy_now_price)); ?>%</span></li>
              	<?php } ?>
              
              <li><span><i class="fa fa-star">&nbsp;</i> Following</span><span>10</span></li>
              
              <li><span><i class="fa fa-truck">&nbsp;</i> Shipping</span><span><?php echo ($product->free_shipping==1 || $product->shipping_charge==0)?'free':DEFAULT_CURRENCY_SIGN.$product->shipping_charge; ?></span></li>
            </ul>
            <div class="clearfix"></div>
          </section>
        </aside>
        <div class="clearfix"></div>
        
        
        <div class="col-md-7 col-sm-6 upcomimg_item">
          <h3>Upcomimg Items</h3>
          <div class="row">
            <?php if($upcoming_auctions){foreach($upcoming_auctions as $auction){ ?>
            <aside class="col-md-4 col-sm-6 cat-responsive">
              <div class="categories text-center upcoming">
                <div class="bid_info text-right"><i class="fa fa-star"></i> 12</div>
                <figure> <a href="<?php echo site_url('/host-auction-detail/'.$auction->host_id.'/'.$this->general->clean_url($auction->host_name)); ?>"><img src="<?php echo site_url(PRODUCT_IMAGE_PATH.'live_'.$auction->image); ?>" alt=""></a> </figure>
                <div class="row bid_info clearfix">
                  <?php if($auction->buy_now==1){?>
                  <i class="fa fa-shopping-cart"></i> <?php echo DEFAULT_CURRENCY_SIGN.$auction->buy_now_price; ?>
                  <?php }else{ ?>
                  <i class="fa fa-clock-o"></i>
                  <?php
						if(date('Y-m-d',strtotime($current_date)) == date('Y-m-d',strtotime($auction->start_date_time))){
							echo $this->general->time_format($auction->start_date_time);
						}else{
							echo $this->general->short_date_time_format($auction->start_date_time);
						}
					?>
                  <?php } ?>
                </div>
              </div>
            </aside>
            <?php } }else { ?>
            <div class="col-md-12">No Upcoming Auction found</div>
            <?php } ?>
          </div>
        </div>
        
        <div class="col-md-5 col-sm-6">
          <div class="tabbable" id="descriptionTabs">
            <ul class="nav nav-tabs" id="myTab">
              <li class="active"><a href="#descriptionTab" data-toggle="tab">Description</a> </li>
              <!--<li><a href="#tab-2" data-toggle="tab">Seller Policies</a></li>-->
              <?php if($custom_fields){ ?>
              <li><a href="#additionalInfoTab" data-toggle="tab">Additional Info</a> </li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade in active in" id="descriptionTab">
                <article><?php echo $product->description; ?></article>
              </div>
              <!--<div class="tab-pane fade" id="tab-2">
                <article>iPhone 6 isn't simply bigger — it's better in every way. Larger, yet dramatically thinner. More powerful, but remarkably power efficient. With a smooth metal surface that seamlessly meets the new Retina HD display. It's one continuous form where hardware and software function in perfect unison, iPhone 6 isn't simply bigger — it's better in every way. Larger, yet dramatically thinner. More powerful, but remarkably power efficient. iPhone 6 isn't simply bigger — it's better in every way. Larger, yet dramatically thinner. More powerful, but remarkably power efficient. With a smooth metal surface that seamlessly meets the new Retina HD display. It's one continuous form where hardware and software function in perfect unison, iPhone 6 isn't simply bigger — it's better in every way. Larger, yet dramatically thinner. More powerful, but remarkably power efficient.</article>
              </div>-->
              <?php if($custom_fields){ ?>
              <div class="tab-pane fade" id="additionalInfoTab">
                <article class="seller_info custom-field">
                  <?php foreach($custom_fields as $field){ ?>
                  <ul>
                    <li> <span><?php echo $field->name; ?> : </span><span>
                      <?php if($field->type=='FILE'){echo anchor(site_url(CUSTOM_FIELDS_FILES_PATH.$field->value), $field->value, 'target="_blank" download');}else{echo $field->value;} ?>
                      </span> </li>
                  </ul>
                  <?php } ?>
                </article>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
        
      </div>
    </div>
  
    <div class="clearfix"></div>
  </div>
  <?php if($user_id){ ?>
  <div class="col-md-3 virtual_right">
    <div class="gray_box">
    <ul id="allChatMessages">
    <?php
    	if($chat_history){ 
			foreach($chat_history as $chat){
				?>
                    <li>
                    <figure>
                        <?php if($chat->image /*&& file_exists(base_url(USER_IMAGE_PATH.$chat->image))*/){ ?>
                            <img src="<?php echo base_url(USER_IMAGE_PATH.$chat->image); ?>">
                        <?php } else{?>
                            <img src=" <?php echo base_url(USER_IMG_DIR.'avatar.jpg'); ?>">
                        <?php } ?>
                        </figure>
                        <span class="white_box"><p><?php echo $chat->name; ?></p><?php echo $chat->message; ?></span>
                    </li>  
       			<?php 
			} 
		}
	?>
     </ul>
     <div class="msg_write">
        <figure>
		<?php if($this->session->userdata(SESSION.'image') /*&& file_exists(base_url(USER_IMAGE_PATH.$this->session->userdata(SESSION.'image')))*/){ ?>
        	<img src="<?php echo base_url(USER_IMAGE_PATH. $this->session->userdata(SESSION.'image')); ?>">
        <?php } else{?>
        	<img src=" <?php echo base_url(USER_IMG_DIR.'avatar.jpg'); ?>">
       	<?php } ?>
       </figure>
        <input type="test" class="form-control" placeholder="Type here" id="outgoingChatMessage">
      </div>
    </div>
  </div>
  <div class="clearfix"></div>
  <?php } ?>
</section>
<div class="clearfix"></div>


<script src="http://<?php echo NODE_SERVER.':'.NODE_PORT; ?>/socket.io/socket.io.js"></script>

<script>
	var users_full_name = '<?php echo $this->session->userdata(SESSION.'name'); ?>';
	
	<?php if($this->session->userdata(SESSION.'image')){ ?>
		var users_image ='<?php echo base_url(USER_IMAGE_PATH. $this->session->userdata(SESSION.'image')); ?>';
	<?php } else{?>
		var users_image ='<?php echo base_url(USER_IMG_DIR.'avatar.jpg'); ?>';
	<?php } ?>

	var urlAddReminder = '<?php echo site_url('/home/add_item_auction_to_reminder'); ?>';
	var urlRemoveReminder = '<?php echo site_url('/home/remove_item_auction_from_reminder'); ?>';
	var productImageDir = '<?php echo site_url(PRODUCT_IMAGE_PATH); ?>';
	var customFieldsFileDir = '<?php echo site_url(CUSTOM_FIELDS_FILES_PATH); ?>';
</script>


<?php //script for nodejs and socket.io ?>
<script>
	var socket = io.connect('http://<?php echo NODE_SERVER.':'.NODE_PORT; ?>/bidding_process');
	
	socket.on('connect',function(){
		//send auction room connected message to server
		//socket.emit('auction_room',{'aid':myVars.aid});
		socket.emit('auction_room',{'aid':'<?php echo $product->host_id; ?>'});
		
		//send user connected infor only if useris logged in
		if(myVars.uid && myVars.uid!='' && myVars.uid!='undefined'){
			//send user added notification
			socket.emit('user_connected',{'auction_room':myVars.aid, 'uid':myVars.uid,});
		}
		
		socket.on("server_date_time",function(data){
			myVars.server_current_time = data.current_date_time;
			console.log("Server Current Date Time :" + data.current_date_time);
		});
		
		//listener for chat 
		socket.on('broadcast_chat_message',function(data){
			console.log(data);
			$('#allChatMessages').append('<li><figure><img src="' + data.sender_image + '"></figure><span class="white_box"><p>' + data.sender_name + '</p>' + data.message + '</span></li>');
			$('#allChatMessages').animate({	scrollTop: $('#allChatMessages').get(0).scrollHeight}, 2000);
		});
		
		
		socket.on('bidding_error',function(data){
			alert(data.message);
		});
		
		
		socket.on("room_test",function(data){
			console.log(data);	
		});
		
		//on successful placing of bids
		socket.on('bidding_success',function(data){
			//console.log("Bidding Success Data:");
			console.log(data);
			//console.log("Bidding Success Product ID: "+data.pid);
			if(data.auc_current_price!='' && data.auc_current_price!='undefined' ){
				$('#bidAmt_' + data.pid).html(data.auc_current_price);
				$('#priceDiscount').html((data.price_discount_percent_new >0 )? data.price_discount_percent_new + '%':0 + '%');
				
				//Now animate buttons and texts
				//$('#bidAmt_' + data.pid).velocity({'font-size':'1.1em',}, {loop: 1, delay: 100});
				//$('#placeBidBtn').velocity({scaleX: "1.1", scaleY: "1.1",}, {loop: 1, delay: 100});
			}
			//console.log('Response : '+data.message);
		});
		
		
		//event fired BY SERVER when any bid is placed at the moment when timer is less than reset time
		socket.on('update_auc_end_time', function(data){
			myVars.auction_end_time = data.new_end_time;
			console.log("New End Date: "+data.new_end_time);
		});
		
		
		socket.on('auction_item_finished',function(data){
			console.log('Auction Item Finished');
			$('#placeBidBtn').html('Sold');
			//display information to show that this auction is now completely finished.
			
			setTimeout(function(){
			   window.location.reload(1);
			}, 5000);
			
		});
		
		//Now Get Auction Closed Events fromserver in various steps
		socket.on('auction_closed',function(data){
			$('#placeBidBtn').html('Sold');
			$('#placeBidBtn').attr("disabled", true);
		});
		
		socket.on('new_item_coming_soon',function(data){
			$('#placeBidBtn').html('Upcoming');
			//$('#placeBidBtn').attr("disabled",true);
		});

		socket.on('display_new_auction_product',function(data){
			console.log("pid initially: "+myVars.pid);
			console.log(data.product_data);
			console.log(data.product_img_data);
			console.log(data.custom_fields);
			
			//Now create template from the available data
			//Template for images
			var thumb_class = '';
			var sellerInfoTemplate = '';
			var descriptionTabsTemplate = '';
			
			var imagesTemplate = '<div class="col-md-10 dtl_img"><figure><img src='+productImageDir+'/'+data.product_img_data[0]+' id="bigImg"></figure></div>';
			imagesTemplate += '<div class="col-md-2 smallThumbs">';
			$.each(data.product_img_data, function(key,value){
				//console.log(key + ' : ' + value);
				thumb_class = (key==0)?'thumbs active':'thumbs';
				imagesTemplate += '<a href="javascript:void(0)" class="'+ thumb_class +'" data-link="' + productImageDir + '/' +value +'"><figure><img src="'+ productImageDir +'/thumb_' + value + '" ></figure></a>';
            });
			imagesTemplate += '</div>';
			
			var discount_section = (data.price_discount_percent > 0)?'<li><span><i class="fa fa-tag">&nbsp;</i> Discount</span><span>' + data.price_discount_percent + '%</span></li>':'';
			
			var shipping_charge = (data.product_data.free_shipping == 1 || data.product_data.shipping_charge == 0)?'Free':data.product_data.shipping_charge;
			
			//Template for product information and timers section
			sellerInfoTemplate = '<strong><i class="fa fa-user"></i> &nbsp; Seller Info</strong><div class="row"><div class="col-sm-6"><a href="http://localhost/bidwarz/user/'+ data.product_data.seller_id +'/' + data.product_data.seller_name.toLowerCase().replace(/[^a-z0-9]+/g,'-') +'">'+ data.product_data.seller_name +'</a></div><div class="col-sm-6"> <i class="fa fa-star"></i> 137 positive reviews </div></div><div class="col-md-12 btn_section text-center"><div class="col-sm-6 bdr_right"><h1>' + currencySign + '<span id="bidAmt_'+ data.product_data.product_id +'">' + data.product_data.start_bid + '</span></h1><div class="btn-green"><button class="btn_cat" id="placeBidBtn">BID NOW</button></div></div><input type="hidden" id="remainingTime" value="' + data.timer_time + '" /><input type="hidden" id="endDateTime" value="'+ data.auction_end_time+'" /><div class="col-sm-6"> <b>Bidlord</b><time id="timer_'+ data.product_data.product_id+'">Checking...</time></div></div><div class="clearfix"></div><ul><li><span><i class="fa fa-gavel">&nbsp;</i> Starting Bid</span><span>' + currencySign + data.product_data.start_bid +'</span></li>' + discount_section + '<li><span><i class="fa fa-star">&nbsp;</i> Following</span><span>10</span></li><li><span><i class="fa fa-truck">&nbsp;</i> Shipping</span><span>' + shipping_charge + '</span></li></ul><div class="clearfix"></div>';

			//now create template for description area
			descriptionTabsTemplate += '<ul class="nav nav-tabs" id="myTab">';
			descriptionTabsTemplate += '<li class="active"><a href="#descriptionTab" data-toggle="tab">Description</a> </li>';
			//display additional infor only if custom fields data is found
			if(data.custom_fields!=''){
				console.log("custom fields found");
				descriptionTabsTemplate += '<li><a href="#additionalInfoTab" data-toggle="tab">Additional Info</a> </li>';
			}
			descriptionTabsTemplate += '</ul>';
       		descriptionTabsTemplate += '<div class="tab-content">';
			descriptionTabsTemplate += '<div class="tab-pane fade in active in" id="descriptionTab"><article>' + data.product_data.description + '</article></div>';
           
		   	if(data.custom_fields!=''){
		    	descriptionTabsTemplate += '<div class="tab-pane fade" id="additionalInfoTab">';
				descriptionTabsTemplate += '<article class="seller_info custom-field">';
            
				//Now run for each loop to view all the fields 
			 	$.each(data.custom_fields, function(key,val){
					//console.log(key + ':' + val.name);
					if(val.type=='FILE'){
						descriptionTabsTemplate += '<ul><li><span>' + val.name + ' : </span><span> <a href="' + customFieldsFileDir +'/'+ val.value +'" target="_blank" download>' + val.value + '</a></span></li></ul>';
					}else{
           				descriptionTabsTemplate += '<ul><li> <span>' + val.name + ' : </span><span> ' + val.value + ' </span></li></ul>';
					}
				});			
				descriptionTabsTemplate += '</article>';
				descriptionTabsTemplate += '</div>';
		   	}
			descriptionTabsTemplate += '</div>';
          	
			//Now insert templatre into html tags
			$('#productName').html(data.product_data.product_name);
			$('#imgArea').html(imagesTemplate);
			$('#sellerInfo').html(sellerInfoTemplate);
			$('#descriptionTabs').html(descriptionTabsTemplate);
			
			console.log("Previous Value :"+myVars.aid+' # '+myVars.pid+ ' # ' +myVars.uid);
			//now update auction end date time sring and product id in myVars object
			myVars.auction_end_time = data.auction_end_time;
			myVars.pid = data.product_data.product_id;
			
			//alert(sellerInfoTemplate);
			console.log("Updated Value: " + myVars.aid+' # '+myVars.pid+ ' # ' +myVars.uid);
		})
	});
</script>


<?php if($user_id){ ?>
<script>
	$("#sellerInfo").on("click", "#placeBidBtn", function(e) {
		var bidAmount = $('#bidAmt_' + myVars.pid).html();
		//console.log("bidAmount :" + bidAmount);
		//console.log('pid :' + pid);
		//var remaining_time = $('#remainingTime').val();
		var remaining_time = (myVars.auction_end_time - myVars.server_current_time);
		//console.log("remaining_time :"+remaining_time);
		console.log('aid:' + myVars.aid + ' # pid:' + myVars.pid + ' # uid:' + myVars.uid + ' # bid_amount:' + bidAmount + ' # bid_increment:' + myVars.bid_increment + '# remaining_time:' + remaining_time + ' # reset_time:' + myVars.reset_time);
		socket.emit('bid_placed', {'aid':myVars.aid, 'pid':myVars.pid, 'uid':myVars.uid, 'bid_amount':bidAmount, 'remaining_time':remaining_time, 'bid_increment':myVars.bid_increment, 'reset_time':myVars.reset_time});	
	});
	
	
	$(document).ready(function(){
		$('#allChatMessages').scrollTop($('#allChatMessages')[0].scrollHeight);
	});
	
	$('#outgoingChatMessage').keypress(function(event) {
		if(event.which == 13) {
			event.preventDefault();
			event.stopPropagation();
			socket.emit("new_chat_message",{"sender_id":myVars.uid,"sender_name":users_full_name,"sender_image":users_image, "aid":myVars.aid, "message":$('#outgoingChatMessage').val()});
			$('#outgoingChatMessage').val('');
			$('#allChatMessages').animate({	scrollTop: $('#allChatMessages').get(0).scrollHeight}, 2000);
		}
	});
</script>
<?php } ?>

