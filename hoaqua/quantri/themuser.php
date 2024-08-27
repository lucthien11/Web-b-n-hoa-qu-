<?php
require('includes/header.php');
include('../db/conn.php');
//kiem tra quyền
// print_r($_SESSION['user']); exit;
if ($_SESSION['user']['type'] != 'Admin'){
    echo "<h2>Bạn không có quyền truy cập nội dung này</h2>";
    // exit;
    } else {

        if (isset($_GET['action']) && $_GET['action'] == 'insert') { // kiểm tra xem có tồn tại biến $_GET['action'] hay ko, nếu có tồn tại thì trả về true
            $name = $_POST['name']; // lấy dữ liệu từ biến $_POST['name'] rồi gán vào biến $name
            $email = $_POST['email'];
            $password = $_POST['password'];
            $phone = $_POST['phone'];
            $address = $_POST['address'];
            $type = $_POST['type'];
    
            $sql = "SELECT * FROM account WHERE email = '$email'";
            $rs = mysqli_query($conn, $sql); // thực hiện câu lệnh sql để truy vấn từ database
            if (mysqli_num_rows($rs) > 0) { // nếu có dữ liệu trả về thì câu lệnh if này đúng
                echo "<script> alert('Tài khoản $email đã tồn tại trong hệ thống'); </script>"; // đưa ra thông báo
                echo "<script> window.location.href = './themuser.php' </script>";// chuyển sang trang themuser.php
            } else {
                $sql = "INSERT INTO account (name, email, password, phone, address , created_at, type) VALUES ('$name', '$email', '$password', '$phone', '$address', '$created_time', '$type')";
                $rs = mysqli_query($conn, $sql); // thực hiện câu lệnh sql và trả về trạng thái vào biến $rs
                if ($rs) {
                    echo "<script> alert('Thêm tài khoản thành công'); </script>";
                    echo "<script> window.location.href = './listuser.php' </script>";
                }
            }
        }
?>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Thêm mới Người dùng</h1>
                        </div>
                        <form class="user" method="post" action="./themuser.php?action=insert">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="name" name="name"
                                    aria-describedby="emailHelp" placeholder="Tên người dùng(quản trị)">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="email" name="email"
                                    aria-describedby="emailHelp" placeholder="email">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user" id="password" name="password"
                                    aria-describedby="emailHelp" placeholder="password">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="phone" name="phone"
                                    aria-describedby="emailHelp" placeholder="Số điện thoại">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="address" name="address"
                                    aria-describedby="emailHelp" placeholder="Địa chỉ">
                            </div>                                              

                            <div class="form-group">
                                <label class="form-label">Quyền:</label>
                                <select class="form-control" name="type">
                                    <option>Chọn quyền</option>
                                    <option value ="1" >Quản trị</option>

                                    <option value ="0">Nhân viên</option>
                                    
                                </select>
                            </div>

                            <button class="btn btn-primary">Tạo mới</button>
                        </form>
                        <hr>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<?php
}
require('includes/footer.php');