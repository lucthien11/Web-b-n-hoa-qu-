<?php
session_start();
$is_homepage = true;
require_once('components/header.php');
?>
    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
            <div class="section-title">
                        <h2>Danh mục sản phẩm</h2>
                    </div>                 

                <div class="categories__slider owl-carousel">
                <?php
                 $sql_str = "select * from categories order by name";
                 $result = mysqli_query($conn, $sql_str);
                    while ($row = mysqli_fetch_assoc($result)){
                ?>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg">
                            <h5><a href="#"><?=$row['name']?></a></h5>
                        </div>
                    </div>
                <?php } ?>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm đặc trưng</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <?php
                 $sql_str = "select * from categories order by name";
                 $result = mysqli_query($conn, $sql_str);
                    while ($row = mysqli_fetch_assoc($result)){
                ?>
                            <li data-filter=".<?=str_replace(" ", "_", $row['slug'])?>"><?=$row['name']?></li>
                    <?php } ?>
                           
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <?php
                 $sql_str = "select products.id as pid, products.name as pname, images, price,disscounted_price, categories.slug as cslug from products, categories where products.category_id=categories.id; ";
                 $result = mysqli_query($conn, $sql_str);
                    while ($row = mysqli_fetch_assoc($result)){
                        $anh_arr = explode(';', $row['images']);
                ?>
                <div class="col-lg-3 col-md-4 col-sm-6 mix <?=str_replace(" ", "_",$row['cslug'])?>">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="<?="quantri/".$anh_arr[0]?>">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="sanpham.php?id=<?=$row['pid']?>"><?=$row['pname']?></a></h6>
                            <div class="prices">
                                <?php if ((int)$row['price'] > (int)$row['disscounted_price']) : ?>
                                    <span class="old"><?=number_format($row['price'], 0,'','.') . " đ"?></span>
                                <?php endif; ?>
                                    <span class="curr"><?= number_format($row['disscounted_price'], 0, '', '.') . " đ" ?></span>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <?php } ?>

                
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>Tin tức</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <?php 

                $sql_str="select * from news order by created_at desc limit 0, 3";
            $result = mysqli_query($conn, $sql_str);
            while ($row = mysqli_fetch_assoc($result)){

                ?>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="<?='quantri/'.$row['avatar']?>" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> <?=$row['created_at']?></li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="tintuc.php?id=<?=$row['id']?>"><?=$row['title']?></a></h5>
                            <p><?=$row['sumary']?></p>
                        </div>
                    </div>
                </div>
                <?php } ?>               
                
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
<?php

require_once('components/footer.php');
?>