<%-- 
    Document   : index
    Created on : Apr 13, 2023, 3:01:25 PM
    Author     : havanthiep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="css/home.css">
</head>
    <body>
        <div class="home-heading">
            <h1>Chào mừng bạn đến với Tada!</h1>
        </div>
        <div class="home-body">
            <div class="home-menu">
                <li id="home" class="menu-item"><a href="index.jsp">Trang chủ</a></li>
                <li id="management" class="menu-item">Quản lý nhân viên
                    <ul class="sub-menu">
                        <li><a href="management">Thông tin nhân viên</a></li>
                        <li><a href="salary">Quản lý bảng lương</a></li>
                    </ul>
                </li>
                <li id="algorithm" class="menu-item"><a href="algorithm.jsp">Thuật toán</a></li>
                <li id="languageprocess" class="menu-item"><a href="languageprocess">Xử lý ngôn ngữ tự nhiên</a></li>
            </div>
            <div class="home-main">
                This is home
            </div>
        </div>
    </body>
</html>