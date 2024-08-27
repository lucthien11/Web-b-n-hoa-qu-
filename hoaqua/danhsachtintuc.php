<style>
    .list-news {
        display: flex;
        flex-wrap: wrap;
    }
</style>
<?php
$is_homepage = false;
include('./components/header.php');
include('./db/conn.php');
$sql_str = "select * from news order by created_at desc";
$result = mysqli_query($conn, $sql_str);
?>
<div class="list-news">
<?php
while ($row = mysqli_fetch_assoc($result)) {
?>
    <div class="col-lg-4 col-md-4 col-sm-6">
        <div class="blog__item">
            <div class="blog__item__pic">
                <img src="<?= 'quantri/' . $row['avatar'] ?>" alt="">
            </div>
            <div class="blog__item__text">
                <ul>
                    <li><i class="fa fa-calendar-o"></i> <?= $row['created_at'] ?></li>
                    <li><i class="fa fa-comment-o"></i> 5</li>
                </ul>
                <h5><a href="tintuc.php?id=<?= $row['id'] ?>"><?= $row['title'] ?></a></h5>
                <p><?= $row['sumary'] ?></p>
            </div>
        </div>
    </div>
    <?php
}
?>
</div>
<?php
include('./components/footer.php');
?>