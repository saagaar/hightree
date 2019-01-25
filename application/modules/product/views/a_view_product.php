<script type="text/javascript">
$(document).ready(function() { 
    // call the tablesorter plugin 
    $("table").tablesorter({ 
        // sort on the first second third fourth and fifth column, order asc 
        //sortList: [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0]],
		 sortList: [[0,1]],
		sortInitialOrder : 'desc'
    }); 
});

function doconfirm()
{
	job=confirm("Are you sure to delete permanently?");
	if(job!=true)
	{
		return false;
	}
}
</script>

<section class="title">
  <div class="wrap">
    <h2><a href="<?=site_url(ADMIN_DASHBOARD_PATH)?>">ADMIN</a> &raquo; Product Management</h2>
  </div>
</section>

<article id="bodysec" class="sep">
	<div class="wrap">
		<aside class="lftsec"><?php $this->load->view('menu'); ?></aside>
		<section class="smfull">
			<?php
      // $compressedproduct=array();
      // // echo '<pre>';
      // // print_r($product_data);exit;
      // foreach($product_data as $value)
      // {
      //   if(array_key_exists($value->id,$compressedproduct))
      //   {
      //      $tillvalue=$value->cat_name;
      //       $value->cat_name= $tillvalue.','.$value->cat_name;
      //   }
      //   $compressedproduct[$value->id]=$value;
      // }

				 if($this->session->flashdata('message')) 
				 {
					 ?>
						<div id="displayErrorMessage" class="confrmmsg">
  							<p><?php echo $this->session->flashdata('message'); ?></p>
						</div>
					<?php
                 }
			?>
            
            <div class="box_block">
            	<form name="search_product" method="post" enctype="multipart/form-data" accept-charset="utf-8">
            		<fieldset>
                    <ul class="frm">
                      <li style="width:30%">
                        <div>
                          <input type="text" name="srch" class="inputtext" size=45 placeholder="Enter seller name, seller id or product name" value="<?php if($this->input->post('srch',TRUE)){echo $this->input->post('srch',TRUE);} ?>">
                        </div>
                      </li>
                      
                      <li><div><input type="submit" name="submit"  value="search" class="butn"></div></li>
              		</ul>
          		</fieldset>
            	</form>
            </div>

			<div class="box_block">
  				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablesorter tbl_list tbl_full">
    				<thead>
                        <tr>
                            <th width="5%">P. Id</th>
                            <th width="15%">Product Category</th>
                           <?php /*?> <th width="15%">Product Subcategory</th><?php */?>
                            <th width="15%">Product Name </th>
                            <th width="10%">Seller Name</th>
                            <th width="17%">Added Date</th>
                            <th width="10%">Status</th>
                            <th width="13%" class="optn"> Operations </th>
                        </tr>
                    </thead>
    				<tbody>
					<?php 
                    $sn_count=0;
                    if($product_data)
                    {
                        foreach($product_data as $value)
                        { 
                        
                          ?>
                          <tr>
                            <td><?php echo $value->id;?></td>
                            <td><?php echo $value->cat;?></td>
                            <?php /*?><td><?php echo $this->admin_product_model->get_category_name_by_id($value->sub_cat_id);?></td><?php */?>
                            
                            <?php /*?><td>
								<?php 
									if($value->status=='1'){ ?>
                                <a href="<?php echo site_url('buy-product/'.$value->id.'/'.$this->general->clean_url($value->name)); ?>" target="_blank"><?php echo $this->general->string_limit($value->name,20); ?></a>
                                <?php }else if($value->status=='2'){ ?>
									<a href="<?php echo site_url('live-auction/'.$value->id.'/'.$this->general->clean_url($value->name)); ?>" target="_blank"><?php echo $this->general->string_limit($value->name,20); ?></a>
								<?php }else{
									echo $this->general->string_limit($value->name,20);
								}
							?>
                          	</td><?php */?>
                            <td><?php echo $this->general->string_limit($value->name,20); ?></td>
                            
                            <td><?php echo $value->buyer_name; ?></td>                            
                            <td><?php echo $this->general->long_date_time_format($value->post_date);?></td>
                            <td><?php if($value->status=='1') {echo "Not Scheduled";} else if($value->status=='2') {echo "Scheduled";}else if($value->status=='3') {echo "Closed";} else echo "Cancelled"; ;?></td>
                            <td class="optn">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <a href="<?php echo site_url(ADMIN_DASHBOARD_PATH);?>/product/edit_product/<?php echo $value->id;?>" style="margin-right:5px;"><span>Edit</span></a>
                                        </td>
                                        
                                        <td>
                                            <a  style="margin-left:2px;" href="<?php echo site_url(ADMIN_DASHBOARD_PATH);?>/product/delete_product/<?php echo $value->id;?>" onClick="return doconfirm();"><span>Delete</span></a>
                                        </td>
                                        
                                       
                                            <td>
                                            <a  style="margin-left:2px;" href="<?php echo site_url(ADMIN_DASHBOARD_PATH);?>/product/view_bids/<?php echo $value->id;?>"><span>View Bids</span></a>
                                        </td>
									</tr>
                                </table>
                            </td>
                          </tr>
                       <?php } }else{ ?>
                        <tr>
                        	<td colspan="7"><div class="confrmmsg"><p>No Product found.</p></div></td>
                    	</tr>
                    <?php } ?>
                </tbody>
  				</table>
  			</div>
             <?php if ($links) { echo "<ul class='pagination'>".$links."</ul>"; } ?>
		</section>
  		<div class="clearfix"></div>
	</div>
</article>
<div> </div>
