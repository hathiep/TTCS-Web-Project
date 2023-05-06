<%-- 
    Document   : management
    Created on : Apr 16, 2023, 9:45:18 PM
    Author     : havanthiep
--%>

<%@page import="java.util.List"%>
<%@page import="model.NV"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bảng lương</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/management.css">
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
                    
                <div id="block-table" class="main-block">
                    <form method="post" id="sort">
                        
                        <div id="info-block" class="sort-block">
                            <label for="info-sort">Sắp xếp theo thông tin: </label>
                            <select class="form-inputb" class="list-select" name="info-sort" id="info-sort">
                                <option value="">--Hãy chọn tên cột--</option>
                                <option value="id">ID</option>
                                <option value="hoten">Họ và tên</option>
                                <option value="ngaysinh">Ngày sinh</option>
                                <option value="chucvu">Chức vụ</option>
                                <option value="mucluong">Mức Lương</option>
                            </select>
                        </div>
                        
                        <div id="rannk-block" class="sort-block">
                            <label for="rank-sort">Sắp xếp theo thứ tự: </label>
                            <select class="form-inputb" class="list-select" name="rank-sort" id="rank-sort">
                                <option value="">--Hãy chọn thứ tự--</option>
                                <option value="1">Thứ tự tăng dần</option>
                                <option value="2">Thứ tự giảm dần</option>
                            </select>
                        </div>
                        
                        <button id="button-sort" class="form-button" type="submit" formaction="management">Sắp xếp</button>
                    </form>
                    
                    <div style="width:100%;margin-right:-1px;background:#c3c3c3;border:solid 1px #000;" >
                        <table id="header" cellpadding="3" cellspacing="0" border="0">
                            <tr>
                                <th class="col0">ID</th>
                                <th class="col3">Họ và tên</th>
                                <th class="col2">Ngày sinh</th>
                                <th class="col1">Giới tính</th>
                                <th class="col2">SĐT</th>
                                <th class="col4">Địa chỉ</th>
                                <th class="col1">Chi nhánh</th>
                                <th class="col3">Chức vụ</th>
                                <th class="col2">Mức Lương</th>
                                <th class="col2">Chú thích</th>
                            </tr>
                        </table>
                    </div>
                    <div id="box">
                        <table id="tbl-content" cellpadding="3" cellspacing="0" border="0">
                        <%
                            List<NV> list = (List<NV>)request.getAttribute("listNV");
                            int t = 0, k = 0;
                            for(NV i:list){
                                t++; k = t%2;
                        %>
                                <tr class="row<%=k%>" onclick="insert(<%=i.getId()%>)">
                                    <td class="col0"><%=i.getId()%></td>
                                    <td class="col3"><%=i.getHoten()%></td>
                                    <td class="col2"><%=i.getNgaysinh()%></td>
                                    <td class="col1"><%=i.getGioitinh()%></td>
                                    <td class="col2"><%=i.getSdt()%></td>
                                    <td class="col4"><%=i.getDiachi()%></td>
                                    <td class="col1"><%=i.getChinhanh()%></td>
                                    <td class="col3"><%=i.getChucvu()%></td>
                                    <td class="right" class="col2"><%=i.getMucluong()%></td>
                                    <td class="col2"><%=i.getChuthich()%></td>
                                </tr>
                         <%
                            }
                        %>
                        </table>
                    </div>
                </div>
                
                <div id="block-table" class="main-block">
                    <form method="post" action="" class="form" id="forminfo">

                        <h2 id="heading">Chỉnh sửa thông tin nhân viên</h1>
                        <h4 class="form-message" id="error">${error}</h4>

                        <div id="form-left" class="form-block" onclick="hideerror()">
                            
                            <div class="form-item1">
                                <label class="form-label" for="id">ID</label>
                                <input class="form-input" id="id" name="id" type="text" value="" placeholder="Nhập ID" required/>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="hoten">Họ và tên</label>
                                <input class="form-input" id="hoten" name="hoten" type="text" value="" placeholder="Nhập đầy đủ họ và tên" required/>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="ngaysinh">Ngày sinh</label>
                                <input class="form-input" type="date" name="ngaysinh" id="ngaysinh" value="" value="1980-01-01" required>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="gioitinh">Giới tính</label>
                                <div class="form-radio">
                                    <input id="radio1" type="radio" name="gioitinh" value="Nam">
                                    <label for="radio1" class="radio-label">Nam</label>
                                    <input id="radio2" type="radio" name="gioitinh" value="Nữ">
                                    <label for="radio2" class="radio-label">Nữ</label>
                                </div>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="sdt" required>SĐT</label>
                                <input class="form-input" id="sdt" name="sdt" type="text" value="" placeholder="Nhập số điện thoại" required/>
                            </div>

                        </div>

                        <div id="form-center" class="form-block">


                            <div class="form-item1">
                                <label class="form-label" for="diachi">Địa chỉ</label>
                                <input class="form-input" id="diachi" name="diachi" type="text" value="" placeholder="Nhập địa chỉ" required/>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="chinhanh">Chi nhánh</label>
                                <input class="form-input" id="chinhanh" name="chinhanh" type="text" value="" placeholder="Nhập chi nhánh" required/>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="chucvu">Chức vụ</label>
                                <input class="form-input" id="chucvu" name="chucvu" type="text" value="" placeholder="Nhập chức vụ" required/>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="mucluong">Mức lương</label>
                                <input class="form-input" id="mucluong" name="mucluong" type="text" value="" placeholder="Nhập mức lương" required/>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="chuthich">Chú thích</label>
                                <input class="form-input" id="chuthich" name="chuthich" type="text" value=""  placeholder="Nhập nếu có"/>
                            </div>

                        </div>

                        <div id="form-right" class="form-block">
                            <div class="form-item2">
                                <button class="form-button" id="button-add" type="submit" formaction="add">Thêm</button>
                            </div>
                            <div class="form-item2">
                                <button class="form-button" id="button-update" type="submit" formaction="update">Sửa</button>
                            </div>
                            <div class="form-item2">
                                <button class="form-button" id="button-delete" type="submit" action="deleteNV()">Xoá</button>
                            </div>
                            <div class="form-item2">
                                <button class="form-button" id="button-reset" type="reset" action="resetForm()">Reset</button>
                            </div>
                        </div>
                      
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="js/information.js"></script>
</html>