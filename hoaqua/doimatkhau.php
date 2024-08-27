<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./Css/doimatkhau.css">
    <style>
        .changepassword__header {
            font-size: 30px;
            margin-bottom: 20px;
        }

        .input {
            border-radius: 6px;
            width: 300px;
            outline: none;
            padding: 10px 5px;
        }

        .input:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
    </style>
</head>

<body>
    <?php
    session_start();
    $is_homepage = false;
    $email = '';
    require_once('./components/header.php');
    require('./db/conn.php');

    if (!isset($_SESSION['user']['email'])) { // nếu không có biến lưu trữ thông tin tài khoản đăng nhập thì quay về trang đăng nhập
        echo "<script> alert('Vui lòng đăng nhập để có chức năng đổi mật khẩu'); </script>";
        echo "<script> window.location.href = './login.php' </script>";
    } else {
        if (isset($_GET['email'])) {
            $email = $_GET['email'];
        } else {
            ?>
            <h1>Không tìm thấy dữ liệu email để thay đổi mật khẩu</h1>
            <?php
        }

        if ($_SERVER["REQUEST_METHOD"] == "POST") { // phương thức là post
            if (isset($_POST['email']) && isset($_POST['old-password']) && isset($_POST['new-password'])) {
                $email = $_POST['email'];
                $oldPassword = $_POST['old-password'];
                $newPassword = $_POST['new-password'];

                $sql = "select * from account where email='$email' and password='$oldPassword'";
                $rs = mysqli_query($conn, $sql); // thực hiện câu lệnh sql

                if (mysqli_num_rows($rs) == 0) { // nếu không có dữ liệu trả về thì thông báo là sai email hoặc password
                    echo "<script> alert('Tài khoản hoặc mật khẩu hiện tại nhập không đúng'); </script>";
                    echo "<script> window.location.href = './doimatkhau.php?email='$email'' </script>";
                } else {
                    $sqlUpdate = "update account set password='$newPassword' where email='$email'";
                    $rsUpdate = mysqli_query($conn, $sqlUpdate); // thực hiện lệnh update
        
                    if ($rsUpdate) {
                        echo "<script> alert('Cập nhật thông tin mật khẩu thành công'); </script>";
                        echo "<script> window.location.href = './index.php' </script>";
                    }
                }
            }
        }

        ?>
        <div class="changepassword">
            <div class="changepassword__header">Thay đổi mật khẩu</div>
            <form action="./doimatkhau.php?email=<?php echo $email; ?>" method="post" class="changepassword__form">
                <div class="changepassword__group">
                    <label for="" class="changepassword__title-element">Email</label>
                    <input name="email" value="<?php echo $email; ?>" readonly type="email" class="input changepassword__input" placeholder="Nhập email">
                </div>
                <div class="changepassword__group">
                    <label for="" class="changepassword__title-element">Mật khẩu cũ</label>
                    <input name="old-password" type="password" required class="input changepassword__input" placeholder="Nhập mật khẩu cũ">
                </div>
                <div class="changepassword__group">
                    <label for="" class="changepassword__title-element">Mật khẩu mới</label>
                    <input name="new-password" type="password" required class="input changepassword__input" placeholder="Nhập mật khẩu mới">
                </div>
                <button class="btn" type="submit" style="border-radius: 10px; width: 200px; height: 44px; color: #fff; background-color: #7fad39; margin-top: 20px;">Lưu thay đổi</button>
            </form>
        </div>
        <?php
    }
    require_once('./components/footer.php');
    ?>
</body>

</html>