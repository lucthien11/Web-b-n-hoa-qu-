<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../Css/register.css" type="text/css">
    <link rel="stylesheet" href="../Css/base.css" type="text/css">
</head>

<body>
    <?php
    $is_homepage = false;
    require_once('./components/header.php'); // thêm nội dung từ file header.php vô file register.php
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    $created_time = date("Y-m-d h:i:s"); // lấy dữ liệu thời gian thực

    if (isset($_GET['action']) && $_GET['action'] == 'insert') { // kiểm tra xem có tồn tại biến $_GET['action'] và biến $_GET['action'] có chứa dữ liệu là insert ko
        $email = $_POST['email']; // gán dữ liệu từ biến $_POST['email'] vào biến $email
        $password = $_POST['password'];
        $repassword = $_POST['re-password'];

        if ($password != $repassword) {
            echo "<script> alert('Mật khẩu phải trùng với mật khẩu nhập lại'); </script>";
            echo "<script> window.location.href = './register.php' </script>";
        } else {
            $sql = "SELECT * FROM account WHERE email = '$email'";
            $rs = mysqli_query($conn, $sql); // thực hiện câu lệnh sql để truy vấn vào database
            if (mysqli_num_rows($rs) > 0) { // nếu có dữ liệu truy vấn được trả về thì trả về true
                echo "<script> alert('Tài khoản $email đã tồn tại trong hệ thống'); </script>";
                echo "<script> window.location.href = './register.php' </script>";
            } else {
                $sql = "INSERT INTO account (email, password, created_at) VALUES ('$email', '$password', '$created_time')";
                $rs = mysqli_query($conn, $sql); // thực thi câu lệnh sql
                if ($rs) {
                    echo "<script> alert('Tạo tài khoản thành công'); </script>";
                    echo "<script> window.location.href = './login.php' </script>";
                }
            }
        }
    }

    ?>
    <div class="container">
        <div class="auth-form">
            <div class="auth-form__header">
                <p style="font-size: 30px;">Đăng ký</p>
            </div>
            <div class="auth-form__form">
                <form method="post" action="./register.php?action=insert" class="auth-form__form-register">
                    <div class="auth-form__group">
                        <label>Email</label>
                        <input type="email" class="auth-form__input" required placeholder="Nhập email" name="email">
                    </div>
                    <div class="auth-form__group">
                        <label>Mật khẩu</label>
                        <input type="password" class="auth-form__input" required placeholder="Nhập mật khẩu" name="password">
                    </div>
                    <div class="auth-form__group">
                        <label>Nhập lại mật khẩu</label>
                        <input type="password" class="auth-form__input" required placeholder="Nhập lại mật khẩu" name="re-password">
                    </div>
                    <div class="auth-form__btn-register">
                        <button class="btn" type="submit" style="border: 1px solod #7fad39; border-radius: 10px; width: 200px; height: 44px; color: #7fad39; border-color: #7fad39;">Đăng ký</button>
                    </div>
                </form>
            </div>
            <div class="auth-form__login" style="margin-bottom: 30px;">
                <label>Bạn đã có tài khoản?</label>
                <a class="auth-form__login-link" href="./login.php" style="color: #fff; background-color: #7fad39; width: 150px; padding: 10px 0; text-align: center; border-radius: 10px; margin-left: 10px;">Đăng nhập</a>
            </div>
        </div>
    </div>
    <?php
    require_once('./components/footer.php');
    ?>
</body>

</html>