
<?php
    $is_homepage = false;
    require_once('components/header.php');

    require_once('./db/conn.php');
    $idsp = $_GET['id'];
    $sql_str = "select * from products where id=$idsp";
    $result = mysqli_query($conn, $sql_str);
    $row = mysqli_fetch_assoc($result);
    $anh_arr = explode(';', $row['images']);
    ?>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>
                            <?= $row['name'] ?>
                        </h2>
                        <div class="breadcrumb__option">
                            <a href="./index.">Trang chủ</a>
                            <a href="./index.html">Sản phẩm</a>
                            <span>
                                <?= $row['name'] ?>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">

                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large" src="<?= "quantri/" . $anh_arr[0] ?>"
                                alt="<?= $row['name'] ?>">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <?php
                            for ($i = 0; $i < count($anh_arr); $i++) {
                                ?>
                                <img data-imgbigurl="<?= "quantri/" . $anh_arr[$i] ?>"
                                    src="<?= "quantri/" . $anh_arr[$i] ?>">
                                <?php
                            }
                            ?>

                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>
                            <?= $row['name'] ?>
                        </h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price">
                            <?= $row['price'] ?>
                        </div>
                        <p>
                            <?= $row['summary'] ?>
                        </p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">Thêm vào giỏ hàng</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Mô tả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Đánh giá <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <?= $row['description'] ?>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Đánh giá sản phẩm (reviews)</h6>
                                    <p>(Đang hoàn thiện chức năng)</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Các sản phẩm liên quan</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <?php
//tim cac san pham lien quan cung category_id voi san pham nay
$dmid = $row['category_id'];
$sql2 = "select * from products where category_id=$dmid  and id <> $idsp";
$result2 = mysqli_query($conn, $sql2);
while($row2 = mysqli_fetch_assoc($result2)) {
    $arrs = explode(";", $row2["images"]);
            ?>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<?="quantri/".$arrs[0]?>">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="sanpham.php?id=<?=$row2['id']?>"><?=$row2['name']?></a></h6>
                            <h5><?=$row2['disscounted_price']?></h5>
                        </div>
                    </div>
                </div>
<?php } ?>                
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
<?php require_once('components/footer.php'); ?>