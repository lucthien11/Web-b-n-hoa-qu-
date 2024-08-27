<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .card {
            text-align: center;
        }
    </style>
</head>

<body>
    <?php
    $is_homepage = true;
    require('./components/header.php');
    if (!isset($_GET['email'])) {
        echo "<script> alert('Email không đúng với tài khoản'); </script>";
        echo "<script> window.location.href = './index.php' </script>";
    } else {
        $email = $_GET['email'];
    ?>
        <div>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Thống kê đơn hàng</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <?php
                        require('./db/conn.php');
                        $sql_str = "select * from orders where email='$email' order by created_at";
                        $result = mysqli_query($conn, $sql_str);
                        $stt = 0;
                        if (mysqli_num_rows($result) > 0) {
                        ?>
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Tên người đặt hàng</th>
                                        <th>Ngày đặt</th>
                                        <th>Trạng thái</th>
                                        <th>Xem</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        $stt++;
                                    ?>
                                        <tr>
                                            <td><?= $stt ?></td>
                                            <td><?= $row['id'] ?></td>
                                            <td><?= $row['firstname'] . ' ' . $row['lastname'] ?></td>
                                            <td><?= $row['created_at'] ?></td>
                                            <td><span class='<?= $row['status'] ?>'><?= $row['status'] ?></span></td>
                                            <td>
                                                <a class="btn btn-warning" href="./vieworder.php?id=<?php echo $row['id']; ?>">Xem</a>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                        ?>
                                </tbody>
                            </table>
                        <?php
                                    
                        } else {
                        ?>
                            <h3>Không có đơn đặt hàng!</h3>
                        <?php
                        }
                    ?>
                    </div>
                </div>
            </div>
        </div>
    <?php
    ?>
    <?php
    }
    require('./components/footer.php');
    ?>
</body>

</html>