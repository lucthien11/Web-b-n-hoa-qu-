<?php 

// Lấy id admin cần chỉnh sửa
$id = $_GET['id'];

// Kết nối CSDL
require('../db/conn.php');

// Truy vấn lấy thông tin admin
$sql_str = "SELECT * FROM account WHERE id=$id";
$res = mysqli_query($conn, $sql_str);

$admin = mysqli_fetch_assoc($res);

if (isset($_POST['btnUpdate'])){
    // Nếu nút Cập nhật được nhấn
    // Lấy dữ liệu từ form
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    $status = $_POST['status'];
    $type = $_POST['type'];

    // Thực hiện việc cập nhật
    $sql_str2 = "UPDATE account SET name='$name', email='$email', phone='$phone', address='$address', status='$status', type='$type', updated_at=NOW() WHERE id=$id";
    
    mysqli_query($conn, $sql_str2);
    
    // Chuyển qua trang danh sách admin
    header("location: listuser.php");
} else {
    require('includes/header.php');
?>

<div class="container">

<div class="card o-hidden border-0 shadow-lg my-5">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
            <div class="col-lg-12">
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4">Cập nhật thông tin </h1>
                    </div>
                    <form class="user" method="post" action="#">                        
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="Tên Admin" value="<?php echo $admin['name']; ?>">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="Email" value="<?php echo $admin['email']; ?>">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" id="phone" name="phone" placeholder="Số điện thoại" value="<?php echo $admin['phone']; ?>">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control form-control-user" id="address" name="address" placeholder="Địa chỉ"><?php echo $admin['address']; ?></textarea>
                        </div>
                        <div class="form-group">
                            <select class="form-control form-control-user" id="status" name="status">
                                <option value="Active" <?php if($admin['status'] == 'Active') echo 'selected'; ?>>Active</option>
                                <option value="Inactive" <?php if($admin['status'] == 'Inactive') echo 'selected'; ?>>Inactive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control form-control-user" id="type" name="type">
                                <option value="1" <?php if($admin['type'] == 1) echo 'selected'; ?>>Admin</option>
                                <option value="0" <?php if($admin['type'] == 0) echo 'selected'; ?>>Staff</option>
                            </select>
                        </div>
                        <button class="btn btn-primary" name="btnUpdate">Cập nhật</button>
                    </form>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>

</div>

<?php
require('includes/footer.php');
}
?>
