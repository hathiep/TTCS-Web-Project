<%-- 
    Document   : signup
    Created on : Apr 13, 2023, 3:03:08 PM
    Author     : havanthiep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
    <link rel="stylesheet" href="css/form.css">
</head>
    <body>
        <form method="post" action="signup" class="form">
            
            <h1 id="heading">Đăng ký</h1>

            <div class="form-group">
                <label class="form-label" for="fullname">Họ và tên</label>
                <input class="form-control" id="fullname" name="fullname" type="text" placeholder="Nhập đầy đủ họ và tên" required/>
                <span class="form-message" id="fullname_error"></span>
            </div>

            <div class="form-group">
                <label class="form-label" for="email">Email</label>
                <input class="form-control" id="email" name="email" type="text" placeholder="Nhập địa chỉ email" />
                <span class="form-message" id="email_error">${email_error2}</span>
            </div>

            <div class="form-group">
                <label class="form-label" for="phone">SĐT</label>
                <input class="form-control" id="phone" name="phone_num" type="text" placeholder="Nhập số điện thoại" />
                <span class="form-message" id="phone_error"></span>
            </div>

            <div class="form-group">
                <label class="form-label" for="password">Mật khẩu</label>
                <input class="form-control" id="password" name="password" type="password" placeholder="Nhập mật khẩu" />
                <span class="form-message" id="phone_error"></span>
            </div>

            <div class="form-group">
                <label class="form-label" for="password_confirm">Nhập lại mật khẩu</label>
                <input class="form-control" id="password_confirm" name="password_confirm" type="password" placeholder="Nhập lại mật khẩu" />
                <span class="form-message" id="phone_error"></span>
            </div>

            <button class="form-button" id="button" type="submit" onclick="validate_SignUp()">Đăng ký</button>

            <div class="form-link">
                <label class="form-label" >Bạn đã có tài khoản?</label>
                <a href="index.jsp">Đăng nhập ngay</a>
            </div>
        </form>
    </body>
<!--    <script src="js/validate.js"></script>-->
</html>