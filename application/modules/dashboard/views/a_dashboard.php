<section class="title">
  <div class="wrap">
    <h2>Dashboard</h2>
  </div>
</section>

<article id="bodysec">
  <div class="wrap">
    <section class="dashboard">
      <div class="box_block">
        <h3>General Statistics</h3>
        <ul class="list">
            <li>Total Active Members  <span><?php echo $total_active_members ? $total_active_members : 0; ?></span></li>
            <li>Total Sold Products <span><?php echo $total_sold_products;?></span></li>
            <li>Total Revenue collected from Credits Sale<span><?php echo $total_revenue_from_credits ? $total_revenue_from_credits : 0;?></span></li>
            <!-- <li>Total Commissions from Product sale <span><?php //if(isset($total_commission_from_products) && $total_commission_from_products!=''){echo $total_commission_from_products;} else {echo '0';}?></span></li> -->
        </ul>
      </div><?php ?>
      
      <?php ?><div class="box_block">
        <h3>Recent Members</h3>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_list">
              <thead>
                <tr>
                 <th align="left">Username</th>
                 <th align="left">Member Email</th>
                 <th align="left">Registered Date</th>
                </tr>
              </thead>
              <?php if(!empty($recent_members)){?>
              <tbody>
                <?php foreach($recent_members as $item){ ?>
                <tr>
                	<td align="left" >
                    	<a href="<?php echo site_url(ADMIN_DASHBOARD_PATH.'/members/edit_member/1/'.$item->id); ?>">
							<?php echo $item->username;?>
                   		</a>
                    </td>
                  	<td align="left" >
						<?php //if($item->is_fb_user=='Yes'): ?>
                            <!-- <span class="flag_icon"><img src='<?php echo base_url().IMG_DIR; ?>facebook.png' height="12"> </span>	 -->
                        <?php //endif; ?>
                    	<?php echo $item->email;?>
                    </td>
                  	<td align="left"><?php echo $this->general->long_date_time_format($item->reg_date); ?></td>
                </tr>
                <?php } ?>
              </tbody>
              <?php } else {?>
              <tfoot>
                <tr>
                  <td colspan="3" align="left">No any members found</td>
                </tr>
              </tfoot>
              <?php } ?>
            </table>
      </div><?php ?>
    </section>
    <section class="dashboard">
      <?php ?><div class="box_block">
        <h3>Recent Messages</h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_list">
          <thead>
            <tr>
              <th align="left">From (User ID)</th>
              <th align="left">Message</th>
              <th align="left">Date</th>
            </tr>
          </thead>
         	<?php if(!empty($admin_recent_inbox)){?>
              <tbody>
                <?php foreach($admin_recent_inbox as $item){ ?>
                <tr>
                  <td align="left" ><?php echo $item->msg_from_user_id;?></td>
                  <td align="left" ><?php echo character_limiter((htmlentities($item->msg_message)),45);?></td>
                  <td align="left" ><?php echo $this->general->long_date_time_format($item->msg_date); ?></td>
                </tr>
                <?php } ?>
              </tbody>
              <?php } else {?>
              <tfoot>
                <tr>
                  <td colspan="3" align="left">No any message from seller</td>
                </tr>
              </tfoot>
              <?php } ?>
        </table>
      </div><?php ?>
      
      <?php ?><div class="box_block">
        <h3>Recent Products</h3>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_list">
          <thead>
            <tr>
              <th align="left">Product Name</th>
              <th align="left">Product Category</th>
              <th align="left">Seller ID</th>
              <th align="left">Added Date</th>
            </tr>
          </thead>
          <?php if(!empty($recent_products)):?>
          <tbody>
            <?php foreach($recent_products as $item): ?>
            <tr>
              <td align="left" ><?php echo $item->name;?></td>
              <td align="left" ><?php echo $item->cat_name;?></td>
              <td align="left" ><?php echo $item->seller_id;?></td>
              <td align="left" ><?php echo $this->general->long_date_time_format($item->post_date); ?></td>
            </tr>
            <?php endforeach; ?>
          </tbody>
          <?php else:?>
          <tfoot>
            <tr>
              <td colspan="4" align="left">No any recent products found</td>
            </tr>
          </tfoot>
          <?php endif; ?>
        </table>
      </div><?php ?>
    </section>
    <div class="clearfix"></div>
  </div>
</article>
<div> </div>
