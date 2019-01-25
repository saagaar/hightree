<div class="col-md-8 col-sm-7">
    <div class="log-form">
    <?php if($proposal_bids) { ?>
        <table class="table table-hover footable">
            <thead>
                <tr>
                    <th data-hide="phone">Auction ID</th>
                    <th data-class="expand">Auction Name</th>
                    <th data-hide="phone">Budget</th>
                    <th data-hide="phone">Date & Time</th>
                    <th data-hide="phone">Views</th>
                </tr>
            </thead>
            <tbody> 
            <?php foreach($proposal_bids as $proposal_bid) { ?>
                <tr>
                    <td><?php echo $proposal_bid->product_code; ?></td>
                    <td><?php echo $proposal_bid->name; ?></td>
                    <td><?php echo $proposal_bid->user_bid_amt; ?></td>
                    <td><?php echo $this->general->date_month_year_time_format($proposal_bid->bid_date); ?></td>
                    <td><a title="Detail" style="font-size:20px;" href="<?php echo site_url('/'. MY_ACCOUNT. 'auction_detail/'. $proposal_bid->prd_id); ?>"><i class="fa fa-info-circle" aria-hidden="true"></i> </a><a style="color:red;font-size:20px;" title="Delete" href="<?php echo site_url('/'. MY_ACCOUNT. 'cancelbid/'. $proposal_bid->bid_id); ?>"  onclick="return doconfirm()"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                </tr>                
                
            <?php } ?>
            </tbody>
        </table>
        <?php } else { ?>
            No proposal bids yet
        <?php  }?>
    </div>
</div>

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