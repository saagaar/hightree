<section class="title">
  <div class="wrap">
    <h2><a href="<?=site_url(ADMIN_DASHBOARD_PATH)?>">ADMIN</a> &raquo; Members Management </h2>
  </div>
</section>

<article id="bodysec" class="sep">
	<div class="wrap">
		<aside class="lftsec"><?php $this->load->view('menu'); ?></aside>
		<section class="smfull">
			<div class="box_block">
  				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_list tbl_full">
    				<thead>
                        <tr>
                            <th width="10%">Product ID</th>
                            <th width="20%">Product Name</th>
                            <th width="15%">Budget</th>
                            <th width="10%">User Bid Amount </th>
                            <th width="10%">Bid Date & Time</th>
                             <th width="10%">Actions</th>
                          
                        </tr>
                    </thead>
    				<tbody>
					<?php 
               $userid=$this->uri->segment(4);
                    //$sn_count=0;
                    if($bids_data)
                    {
                        foreach($bids_data as $value)
                        {				
						?>
                          <tr>
                            <td><?php echo $value->prd_id; ?></td>
                            <td><?php echo $value->name; ?></td>
                            <td><?php echo $value->budget; ?></td>
                            <td><?php echo $value->user_bid_amt; ?></td> 
                            <td><?php echo $value->bid_date; ?></td>
                            <td><a style="color:red;" title="Delete" href="<?php echo site_url(ADMIN_DASHBOARD_PATH);?>/members/cancelbid/<?php echo $value->bid_id.'/'.$userid; ?>"  onclick="return doconfirm()">Delete</a></td>
						
                          </tr>
                        <?php 
                        }
                    }
                    ?>
                </tbody>
  				</table>
  			</div>
             <?php if ($links) { echo "<ul class='pagination'>".$links."</ul>"; } ?>
		</section>
  		<div class="clearfix"></div>
	</div>
</article>
<div> </div>

<script type="text/javascript">
    function doconfirm()
    {
        job=confirm("Are you sure to delete permanently?");
        if(job!=true)
        {
            return false;
        }
    }
</script>