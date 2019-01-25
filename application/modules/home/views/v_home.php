<section>
<!--start Public Auction House sec -->
<div class="auction-house">
<div class="container">
  <h1>Public Auction House</h1>
    <table class="table footable">
        <thead>
            <tr>
                <th data-hide="phone,tablet">Auction ID</th>
                <th data-class="expand" class="col_1">Auction Name</th>
                <th data-hide="phone,tablet" class="col_2">Details</th>
                <th class="text-center col_3" data-hide="phone">Start Date</th>
                <th class="text-center col_4" data-hide="phone">End Date</th>
                <th class="text-right col_5" data-hide="phone"></th>
            </tr>
        </thead>
        <tbody>                        
            <?php if($public_auctions) {
              foreach($public_auctions as $auction)
              {
              ?>
                <tr>
                <td><?php echo $auction->product_code; ?></td>
                <td><?php echo $auction->name; ?></td>
                <td><?php echo character_limiter($auction->description, 100); ?></td>
                <td class="text-center"><?php echo $this->general->format_date_frontenddatetime($auction->auc_start_time); ?></td>
                <td class="text-center"><?php echo $this->general->format_date_frontenddatetime($auction->auc_start_time); ?></td>
                <?php 
                    if(!$this->session->userdata(SESSION.'user_id')) 
                    {
                        $url = site_url('/user/login');
                    }
                    else
                    {
                        $url = site_url('/'. MY_ACCOUNT. 'auction_detail/'.$auction->id);
                    }
                ?>
                <td class="text-right"><a href="<?php echo $url; ?>" class="bid-btn">Bid Now</a></td>
            </tr>
            <?php 
              }
            }
            ?>
            
        </tbody>
    </table>

    <section> 
    <!-- pagination-Sec -->  
        <nav class="pagination_sec text-center">
          <ul class="pagination">
            <?php if($links) { echo $links; }; ?>
            <!-- <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li>
              <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li> -->
          </ul>
          <div class="clearfix"></div>
        </nav>
    <!--/.end-->
    </section>
                                
</div>
  
</div>
<div class="clearfix"></div>
<!--end of Public Auction House sec -->
</section>
