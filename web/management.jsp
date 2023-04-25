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
    <title>Quản lý nhân viên</title>
    <link rel="stylesheet" href="css/management.css">
</head>
    <body>
        <div class="home-heading">
            <h1>Quản lý nhân viên</h1>
        </div>
        <div class="home-body">
            <div class="home-menu">
                <li><a href="index.jsp">Trang chủ</a></li>
                <li><a href="algorithm.jsp">Thuật toán</a></li>
                <li><a href="languageprocess.jsp">Xử lý ngôn ngữ tự nhiên</a></li>
            </div>
            <div class="home-main">
                <div class="main-top">
                    
                </div>
                    
                <div id="block-table" class="main-block">
                    <div id="sort"><h3>Sắp xếp</h3></div>
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
                            for(NV i:list){
                                int k = i.getId()%2;
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
                
<!--                <div class="main-block" id="crud">
                    
                </div>-->
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
                                <button class="form-button" id="button-edit" type="submit" formaction="update">Sửa</button>
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