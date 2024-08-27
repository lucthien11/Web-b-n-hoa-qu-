<?php
$is_homepage = false;
require('./components/header.php');
//lay id goi edit
$id = $_GET['id'];

//ket noi csdl
require('./db/conn.php');

$sql_str = "select * from orders where id=$id";
// echo $sql_str; exit;   //debug cau lenh

$res = mysqli_query($conn, $sql_str);
if (mysqli_num_rows($res) == 0) {
    echo "<script> alert('Không tìm thấy đơn đặt hàng này'); </script>";
    echo "<script> window.location.href = './index.php' </script>";
} else {
    $row = mysqli_fetch_assoc($res);
?>

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Xem trạng thái đơn hàng</h1>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-3">Khách hàng:</div>
                                        <div class="col-md-9">
                                            <?= $row['firstname'] . ' ' . $row['lastname'] ?>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">Địa chỉ:</div>
                                        <div class="col-md-9">
                                            <?= $row['address'] ?>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">Số điện thoại:</div>
                                        <div class="col-md-9">
                                            <?= $row['address'] ?>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">Email:</div>
                                        <div class="col-md-9">
                                            <?= $row['address'] ?>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">Trạng thái đơn hàng:</div>
                                        <div class="col-md-9">
                                            <?php echo $row['status']; ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h3>Chi tiết đơn hàng</h3>
                                    <table class="table">
                                        <tr>
                                            <th>STT</th>
                                            <th>Sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Tiền</th>

                                        </tr>
                                        <?php
                                        $sql = "select *, products.name as pname, order_details.price as oprice  from products, order_details where products.id=order_details.product_id and order_id=$id";
                                        $res = mysqli_query($conn, $sql);
                                        $stt = 0;
                                        $tongtien = 0;
                                        while ($row = mysqli_fetch_assoc($res)) {
                                            $tongtien += $row['qty'] * $row['oprice'];
                                        ?>
                                            <tr>
                                                <td>
                                                    <?= ++$stt ?>
                                                </td>
                                                <td>
                                                    <?= $row['pname'] ?>
                                                </td>
                                                <td>
                                                    <?= number_format($row['oprice'], 0, '', '.') . " VNĐ" ?>
                                                </td>
                                                <td>
                                                    <?= $row['qty'] ?>
                                                </td>
                                                <td>
                                                    <?= number_format($row['total'], 0, '', '.') . " VNĐ" ?>
                                                </td>
                                            </tr>
                                        <?php
                                        }
                                        ?>
                                    </table>
                                    <div class="tongtien">
                                        <h5>
                                            Tổng tiền:
                                            <?= number_format($tongtien, 0, '', '.') . " VNĐ" ?>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<?php
}
require('./components/footer.php');

?>