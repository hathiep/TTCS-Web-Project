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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/home.css">
</head>
    <body>
        <div class="home-heading">
            <h1>Chào mừng bạn đến với Tada!</h1>
        </div>
        <div class="home-body">
            <div class="home-menu">
                <a class="home menu-item" href="index.jsp">Trang chủ</a>
                <li id="management" class="menu-item">Quản lý nhân viên
                    <ul class="sub-menu">
                        <li><a href="management">Thông tin nhân viên</a></li>
                        <li><a href="salary">Quản lý bảng lương</a></li>
                    </ul>
                </li>
                <a id="algorithm" class="menu-item" href="algorithm.jsp">Thuật toán</a>
                <a id="languageprocess" class="menu-item" href="languageprocess">Xử lý ngôn ngữ tự nhiên</a>
            </div>
            <div class="home-main">
                <div class="form">
                    
                    <div id="block-left" class="form-block">
                        <img id="image" src="https://f9-zpcloud.zdn.vn/9165086841208444155/e443f9dd92b54ceb15a4.jpg" alt="alt"/>

                        <div class="form-item1">
                            <label class="form-label" for="hoten">Họ và tên: </label>
                            <div class="form-info" id="hoten" name="hoten" >Hà Văn Thiệp</div>
                        </div>
                        
                        <div class="form-item1">
                            <label class="form-label" for="ngaysinh">Ngày sinh: </label>
                            <div class="form-info" id="ngaysinh" name="ngaysinh" >23 - 8 - 2002</div>
                        </div>
                        
                        <div class="form-item1">
                            <label class="form-label" for="diachi">Địa chỉ: </label>
                            <div class="form-info" id="diachi" name="diachi" >Nam Định</div>
                        </div>
                        
                        <div class="form-item1">
                            <label class="form-label" for="sdt">SÐT: </label>
                            <div class="form-info" id="sdt" name="sdt" >0865 873 283</div>
                        </div>
                            
                        <div class="form-item1">
                            <label class="form-label" for="msv">Mã SV: </label>
                            <div class="form-info" id="msv" name="msv" >B20DCCN668</div>
                        </div>
                        
                    </div>
                    
                    <div id="block-right" class="form-block">
                        <h2 class="heading"> Ứng dụng tích hợp dành cho môn Thực tập cơ sở </h2>
                        <div class="item"> Truy xuất cơ sở dữ liệu nhân viên cửa hàng </div>
                        <div class="item2 item"> Thông tin nhân viên </div>
                        <div class="item2 item"> Quản lý bảng lương </div>
                        <div class="item"> Thuật toán: Tìm đường đi trên đồ thị với BFS, DFS</div>
                        <div class="item"> Xử lý ngôn ngữ tự nhiên: Tách từ trong câu </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </body>
</html>