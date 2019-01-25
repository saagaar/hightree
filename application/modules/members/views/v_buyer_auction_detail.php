<script>



    var lgn_url = '<?php echo site_url("/user/login/");?>';

    var siteurl = '<?php echo site_url("/bidding/");?>';

    var img_src = '<?php echo base_url().USER_IMG_DIR;?>'+'/loading-bid.gif';

    var bid_url ='<?php echo $this->general->lang_uri("/bidding/index");?>';

</script>

<!--To stop pressing of enter button-->

<script language="javascript" type="text/javascript">

    function stopEnter(evt) {

        var evt = (evt) ? evt : ((event) ? event : null);

        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);

        if ((evt.keyCode == 13) && (node.type == "text") && (node.name == "bidamt")) {

            return false;

        }

    }

    document.onkeypress = stopEnter;

</script>

<?php 



    // To calculate product end time on the basis of product timezone

    // $userTimezone = new DateTimeZone($product->auction_time_zone);

    // $gmtTimezone = new DateTimeZone('GMT');

    // $end_time = new DateTime($product->auc_end_time, $gmtTimezone);

    // $offset = $userTimezone->getOffset($end_time);

    // $auction_end_time = date('Y-m-d H:i:s', $end_time->format('U') + $offset);   



    // // to calculate current time on the basis of product timezone

    // $current_time = new DateTime($current_date, $gmtTimezone);



    // $current_time_offset = $userTimezone->getOffset($current_time);

    // $current_dte = date('Y-m-d H:i:s', $current_time->format('U') + $offset);

    $endtime=$this->general->format_date_time_auction($product->auc_end_time);

    $remainingtime=$this->general->get_remaining_time($product->auc_end_time);

    $localtime=$this->general->get_local_time('time');

 if($this->session->userdata(SESSION.'usertype') == '3')
 {
    $mdnext='12';
 }else{
    $mdnext='8';
 }
?>



<div class="col-md-<?php echo $mdnext;?> col-sm-12">

        	<div class="live_box">

            <?php

            // var_dump($this->general->get_current_time_by_auction_timezone($product->auction_time_zone)); ?>

    			<h2><?php echo $product->name; ?></h2>

                <div class="row">

                    <div class="col-md-6 col-sm-6 col-xs-4">

                        <ol>

                            <li>Auction ID <span><?php echo $product->product_code; ?></span></li>	

                            <li>Budget <span><?php echo $product->currency_sign.$product->budget; ?></span></li>

                        </ol>	

                    </div>

                    <input type="hidden" id="remainingTime" value="<?php echo $remainingtime ?>" />

                    <input type="hidden" id="endDateTime" value="<?php echo $endtime; ?>" />

                    <?php // $current_time = $this->general->get_local_time('now'); 

                    ?>

                    <script>

                        window.onload = function() {

                            //console.log(myVars);

                            myVars.aid = '<?php echo $product->seller_id; ?>';

                            myVars.pid = '<?php echo $product->id; ?>';

                            myVars.uid = '<?php echo $this->session->userdata(SESSION."user_id"); ?>';

                            // myVars.auction_end_time = '<?php echo strtotime($product->auc_end_time); ?>';

                            myVars.auction_end_time = '<?php echo strtotime($endtime); ?>';

                            myVars.server_current_time = '<?php echo strtotime($localtime); ?>';

                            

                            myVars.bid_decrememt = '<?php echo $product->bid_decrement; ?>';

                            

                            var RunTimer = new auctionUpdater();

                            $(document).everyTime('1s',function(i){

                                RunTimer.updateTimer();

                            },0);

                        };

                    </script>

                    <div class="col-md-6 col-sm-6 col-xs-8">

                    	<div class="timer_sec">

                        	<h3><i class="fa fa-clock-o" aria-hidden="true">&nbsp;</i> Time Left</h3>

                            <div class="clearfix"></div>

                                <ul id="timer_<?php echo $product->id;?>">

                                    Checking...

                                </ul>

                                <div id="time-zone-offset">

                                    <?php 

                                    //     $t = round($offset);

                                    // echo 'GMT ' . sprintf('%02d:%02d', ($t/3600),abs($t/60%60));

                                     ?>

                                </div>

                        </div>

                    </div>

                </div>

                     

                <h4>Description</h4> 

                <p><?php echo $product->description; ?></p>

                

                <?php if ($basic_form_values) : ?>

                <ol>

                    <?php foreach($basic_form_values as $basic_form_value) : ?>

                    <li>

                    <?php if($basic_form_value->type == 'FILE') { ?>

                        <?php echo $basic_form_value->name; ?><span><a href="<?php echo base_url().CUSTOM_FIELDS_FILES_PATH.$basic_form_value->value;?>"><?php echo $basic_form_value->value; ?></a></span>

                    <?php } else { ?>

                        <?php echo $basic_form_value->name; ?><span><?php echo $basic_form_value->value;?></span>

                    <?php } ?>

                    </li>	

                    <?php endforeach; ?>

                </ol> 

                <?php endif; ?> 

                <?php if ($custom_form_values) : ?>

                <ol>

                    <?php foreach($custom_form_values as $custom_form_value) : ?>

                    <li><?php echo $custom_form_value->name; ?><span><?php echo $custom_form_value->value;?></span></li>  

                    <?php endforeach; ?>

                </ol> 

                <?php endif; ?>   



    		</div>
              <input type="hidden"  id="productid" value="<?php echo $product->id;?>">
           <div id="chart_div"></div>
           
        </div>



        <?php



         $bidamt=isset($mybid[0]->user_bid_amt)?$mybid[0]->user_bid_amt:'';

         $biddetail=isset($mybid[0]->bid_details)?$mybid[0]->bid_details: '';

         $attachment=isset($mybid[0]->attachment)?$mybid[0]->attachment:'';

        

         if($this->session->userdata(SESSION.'usertype') == '4') { ?>

        <div class="col-md-4 col-sm-12">

        	<div class="live_box">

    			<h2>Place Your Bids</h2>

                <div class="bid_response" id="bidResponse"></div>

                <form id="placeBidForm" method="post" action="<?php echo site_url('bidding/index'); ?>" enctype="multipart/form-data" id="placeBidForm">

					<fieldset>

                        <div class="form-group">

                            <label>Budget</label>

                            <input id="bidamt" type="text" name="bid_amount" class="form-control" placeholder="<?php echo $product->currency_sign; ?>5.00" value="<?php echo set_value('bid_amount',$bidamt); ?>">

                        </div>



                        <div class="form-group">

                            <label>Description</label>

                            <textarea name="bid_description" id="biddesc" class="form-control"><?php echo set_value('bid_description',$biddetail); ?></textarea>

                        </div>

                        

                        <div class="form-group">

                        

                            <label>Attachments (Optional)</label>

                            <input type="file" class="filestyle" name="bid_attachment" id="bid_attachment" data-placeholder="<?php echo $attachment;?>" data-buttonName="btn-primary" data-icon="false" data-buttonText="Browse" value="">

                        </div>

                        <div class="form-group terms">

                            <input type="checkbox" name="terms_and_conditions" checked="checked"><span>I accept the <a href="<?php if($terms_condition) {echo site_url('/page/').'/'.$terms_condition->cms_slug;} else {echo '#';} ?>">Terms & Conditions</a> and the  <a href="<?php if($privacy_policy) {echo site_url('/page/').'/'.$privacy_policy->cms_slug;} else {echo '#';} ?>">Privacy Policy</a> of <a href="<?php echo site_url('/'); ?>">hightreegroup.com</a>.</span></input>
                            <?php echo form_error('terms_and_conditions'); ?>
                        </div>       

                        

                        <button type="submit" name="button" id="placeBid" class="btn">Bid Now</button>

					</fieldset>

                    <input type="hidden" name="auc_id" value="<?php echo $product->id; ?>" />

                    <input type="hidden" name="user_id" value="<?php echo $this->session->userdata(SESSION.'user_id');?>" />

                    <input type="hidden" name="buyer_id" value="<?php echo $product->seller_id; ?>" />
                  

				</form>

    		</div>

        </div>

        <?php } ?>
<div class="row">
         <!-- <div class="col-md-4 col-sm-12"> -->

          


        </div>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   

        <script type="text/javascript">

$(function () {      
      google.charts.load('current', {'packages':['corechart']});
      // Set a callback to run when the Google Visualization API is loaded.
       google.charts.setOnLoadCallback(drawChart);
    });

    function drawChart() {
        var product=$('#productid').val();
        var url="<?php echo site_url('/'.MY_ACCOUNT.'getbidbyproduct')?>"+'/'+product;
   
        var data = new google.visualization.DataTable();
        
    
  $.getJSON(url, function(jsonData) {
    console.log(jsonData);
        data.addColumn('string', 'Day');
        data.addColumn('number', 'Bidding Amount');
        data.addRows(jsonData);
        var options = {
          title: 'Rate the Day on a Scale of 1 to 10',
          <?php /*?>width: 500,
          height: 600,<?php */?>
          hAxis: {
            gridlines: {count: 15}
          },
          vAxis: {
            gridlines: {color: 'none'},
            minValue: 0
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
        var button = document.getElementById('change');
        button.onclick = function () {
          // If the format option matches, change it to the new option,
          // if not, reset it to the original format.
          // options.hAxis.format === 'M/d/yy' ?
          // options.hAxis.format = 'MMM dd, yyyy' :
          // options.hAxis.format = 'M/d/yy';
          chart.draw(data, options);
        };
    }); 
 }
      // Create our data table out of JSON data loaded from server.
     
        // </script>