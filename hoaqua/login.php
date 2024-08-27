<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../Css/login.css" type="text/css">
    <link rel="stylesheet" href="../Css/base.css" type="text/css">
</head>
<body>
    <?php
    session_start(); // khởi tạo session để sử dụng lưu trữ dữ liệu
    $is_homepage = false; // không phải là home page
    require_once('./components/header.php'); // thêm nội dung vô trang login.php
    if (isset($_SESSION['user']['email'])) { // kiểm tra xem có tồn tại biến $_SESSION['user']['email'] này hay ko, nếu có tồn tại thì trả về true
        echo "<script> window.location.href = './index.php' </script>"; // đến trang index.php
    } else {
    if (isset($_GET['action']) && $_GET['action'] == 'getuser') { // kiểm tra xem có tồn tại biến $_GET['action'] và biến $_GET['action'] có dữ liệu là getuser hay ko
        $email = $_POST['email']; // gán dữ liệu từ biến $_POST['email']
        $password = $_POST['password'];

        $sql = "SELECT * FROM account WHERE email = '$email' && password = '$password'";
        $rs = mysqli_query($conn, $sql); // thực hiện lệnh truy vấn vô database
            
        if(mysqli_num_rows($rs) > 0) { // nếu có dữ liệu trả về khi truy vấn thì thỏa mãn điều kiện if
            $_SESSION['user']['email'] = $email; // lưu trữ dữ liệu của user khi đăng nhập trên server để giữ phiên đăng nhập
            echo "<script> alert('Đăng nhập thành công'); </script>"; // đưa ra thông báo
            echo "<script> window.location.href = './index.php' </script>"; // chuyển sang trang index.php
        } else {
            echo "<script> alert('Email hoặc mật khẩu không đúng'); </script>";
            echo "<script> window.location.href = './login.php' </script>"; // chuyển sang trang login.php
        }
    }
    
        ?>
        <div class="container">
            <div class="auth-form">
                <div class="auth-form__header">
                    <p style="font-size: 30px;">Đăng nhập</p>
                </div>
                <div class="auth-form__form">
                    <form method="post" action="./login.php?action=getuser" class="auth-form__form-login">
                        <div class="auth-form__group">
                            <label>Email</label>
                            <input type="email" class="auth-form__input" placeholder="Nhập email" required name="email">
                        </div>
                        <div class="auth-form__group">
                            <label>Mật khẩu</label>
                            <input type="password" class="auth-form__input" placeholder="Nhập mật khẩu" required name="password">
                        </div>
                        <div class="auth-form__btn-login">
                            <button class="btn" type="submit" style="border: 1px solid #7fad39; border-radius: 10px; width: 200px; height: 44px; color: #7fad39; border-color: #7fad39;">Đăng Nhập</button>
                        </div>
                    </form>
                </div>
                <div class="auth-form__register">
                    <label>Bạn chưa có tài khoản?</label>
                    <a class="auth-form__register-link" href="./register.php" style="color: #fff; background-color: #7fad39; width: 150px; padding: 10px 0; text-align: center; border-radius: 10px; margin-left: 10px;">Đăng ký</a>
                </div>
            </div>
        </div>
        <?php
    }
        require_once('./components/footer.php');
    ?>
</body>
</html>