<!--for jquery table sorter-->
<script>
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
    <h2><a href="<?=site_url(ADMIN_DASHBOARD_PATH)?>">ADMIN</a> &raquo; Members Management </h2>
  </div>
</section>

<article id="bodysec" class="sep">
	<div class="wrap">
		<aside class="lftsec"><?php $this->load->view('menu'); ?></aside>
		<section class="smfull">
			<?php
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
            	<form name="search_member" method="post" enctype="multipart/form-data" accept-charset="utf-8">
            		<fieldset>
                    <ul class="frm">
                      <li style="width:30%">
                        <div>
                          <input type="text" name="srch" class="inputtext" size=45 placeholder="Enter name or email" value="<?php if($this->input->post('srch',TRUE)){echo $this->input->post('srch',TRUE);} ?>">
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
                        	<th width="5%">Id</th>
                        	<th width="20%">Name</th>
                            <th width="15%">Email</th>
                           	<th width="5%">User Type</th>
                            <th width="5%">Status </th>
                            <th width="20%">Reg Date</th>
                           	<th width="20%" class="optn"> Operations </th>
                        </tr>
                    </thead>
    				<tbody>
					<?php
					if($member_data)
                    {
                        foreach($member_data as $value)
                        {
							?>
                          <tr>
                          	<td><?php echo $value->id; ?></td>
                            <td><?php echo $value->username; ?></td>
                            <td><?php echo $value->email; ?></td>
                            <td>
                              <?php 
                                if($value->user_type == '3')
                                  echo 'Buyer'; 
                                elseif($value->user_type == '4')
                                  echo 'Supplier';
                              ?>
                            </td>
                         	  
                            <td><?php if ($value->status == '1') {echo "Active";} else if($value->status == '2') { echo "Inactive";} else if ($value->status == '3') {echo "Suspended";} else echo "Closed"; ?> </td>
                           
                            <td><?php echo $this->general->long_date_time_format($value->reg_date); ?></td>
                           	
                           	<td class="optn">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="30%">
                                            <a href="<?php echo site_url(ADMIN_DASHBOARD_PATH);?>/members/edit_member/<?php echo $value->status;?>/<?php echo $value->id;?>" style="margin-right:5px;"><span>Edit</span></a>
                                        </td>
                                        
                                        <td width="40%">
                                            <a  style="margin-left:5px;" href="<?php echo site_url(ADMIN_DASHBOARD_PATH);?>/members/delete_member/<?php echo $value->status;?>/<?php echo $value->id;?>" onClick="return doconfirm();"><span>Delete</span></a>
                                        </td>
                                         <td >
                                       <?php  if($value->user_type == '4') {
                                        ?>
                                       
                                            <a  style="margin-left:5px;" href="<?php echo site_url(ADMIN_DASHBOARD_PATH);?>/members/view_bid_history/<?php echo $value->id;?>" ><span>View Bids</span></a>
                                        
                                        <?php 
                                          }
                                        ?>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                          </tr>
                        <?php } }else{ ?>
                        <tr>
                        	<td colspan="7"><div class="confrmmsg"><p>No Member found.</p></div></td>
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
