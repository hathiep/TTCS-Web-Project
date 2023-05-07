<%-- 
    Document   : management
    Created on : Apr 16, 2023, 9:45:18 PM
    Author     : havanthiep
--%>

<%@page import="java.util.List"%>
<%@page import="model.management.NV"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bảng lương</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/salary.css">
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
                        
                        <div id="month-block" class="time-block">
                            <label for="list-month">Chọn tháng: </label>
                            <select class="form-inputb" class="list-select" value="${month}" name="list-month" id="list-month">
                                <option value="">--Hãy chọn tháng--</option>
                                <option value="0">Tất cả tháng</option>
                                <option value="01">Tháng 1</option>
                                <option value="02">Tháng 2</option>
                                <option value="03">Tháng 3</option>
                                <option value="04">Tháng 4</option>
                                <option value="05">Tháng 5</option>
                                <option value="06">Tháng 6</option>
                                <option value="07">Tháng 7</option>
                                <option value="08">Tháng 8</option>
                                <option value="09">Tháng 9</option>
                                <option value="10">Tháng 10</option>
                                <option value="11">Tháng 11</option>
                                <option value="12">Tháng 12</option>
                            </select>
                        </div>
                        
                        <div id="year-block" class="time-block">
                            <label for="list-year">Chọn năm: </label>
                            <select class="form-inputb" class="list-select" value="${year}" name="list-year" id="list-year">
                                <option value="">--Hãy chọn năm--</option>
                                <option value="0">Tất cả năm</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                                <option value="2026">2026</option>
                                <option value="2027">2027</option>
                                <option value="2028">2028</option>
                                <option value="2029">2029</option>
                            </select>
                        </div>
                        
                        <div id="nv-block" class="time-block">
                            <label for="list-nv">Chọn nhân viên: </label>
                            <select class="form-inputb" class="list-select" value="${nv}" name="list-nv" id="list-nv">
                                <option value="">--Hãy chọn nhân viên--</option>
                                <option value="0">Tất cả nhân viên</option>
                            <%
                                List<NV> list = (List<NV>)request.getAttribute("listNV");
                                for(NV i:list){
                            %>    
                                    <option value="<%=i.getId()%>"><%=i.getHoten()%></option>
                            <%
                                }
                            %> 
                            </select>
                        </div>
                        
                        <button id="button-add" class="form-button" type="submit" formaction="addmonth">Thêm tháng</button>
                        <button id="button-search" class="form-button" type="submit" formaction="search">Xem</button>
                    </form>
                    
                    <div id="box">
                        <table id="tbl-content" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th class="col0">ID</th>
                                    <th class="col2">Tháng</th>
                                    <th class="col0">IdNV</th>
                                    <th id="center1" class="col3">Họ và tên</th>
                                    <th id="center2" class="col3">Chức vụ</th>
                                    <th class="col2">Mức Lương</th>
                                    <th class="col2">Thưởng</th>
                                    <th class="col2">Phạt</th>
                                    <th class="col2">Tổng nhận</th>
                                    <th id="center3" class="col4">Chú thích</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<NV> listLuong = (List<NV>)request.getAttribute("listLuong");
                            int t = 0, k = 0;
                            for(NV i:listLuong){
                                t++; k = t%2;
                        %>
                                
                                <tr class="row<%=k%>" onclick="insert(<%=i.getId()%>)">
                                    <td class="col0"><%=i.getId()%></td>
                                    <td class="col2"><%=i.getThang()%></td>
                                    <td class="col0"><%=i.getIdnv()%></td>
                                    <td class="col3"><%=i.getHoten()%></td>
                                    <td class="col3"><%=i.getChucvu()%></td>
                                    <td class="right" class="col2"><%=i.getMucluong()%></td>
                                    <td class="right" class="col2"><%=i.getThuong()%></td>
                                    <td class="right" class="col2"><%=i.getPhat()%></td>
                                    <td class="right" class="col2"><%=i.getTongnhan()%></td>
                                    <td class="col4"><%=i.getChuthich()%></td>
                                </tr>
                        <%
                            }
                        %>
                            </tbody>   
                        </table>
                    </div>
                </div>
                
                <div id="block-table" class="main-block">
                    <form method="post" action="" class="form" id="forminfo">

                        <h2 id="heading">Chỉnh sửa lương nhân viên</h1>
                        <h4 class="form-message" id="error">${error}</h4>

                        <div id="form-left" class="form-block" onclick="hideerror()">
                            
                            <div class="form-item1">
                                <label class="form-label" for="id">ID</label>
                                <div class="form-info" id="id" name="id" >${id}</div>
                                <input id="idl" type="text" value="" hidden="true"/>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="thang">Tháng</label>
                                <div class="form-info" id="thang" name="thang" >${thang}</div>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="idnv">IdNV</label>
                                <div class="form-info" id="idnv" name="idnv" >${idnv}</div>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="hoten">Họ và tên</label>
                                <div class="form-info" id="hoten" name="hoten" >${hoten}</div>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="chucvu">Chức vụ</label>
                                <div class="form-info" id="chucvu" name="chucvu" >${chucvu}</div>
                            </div>

                        </div>

                        <div id="form-center" class="form-block">
                            
                            <div class="form-item1">
                                <label class="form-label" for="mucluong">Mức lương</label>
                                <div class="form-infob" id="mucluong" name="mucluong">${mucluong}</div>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="thuong">Thưởng</label>
                                <input class="form-input" id="thuong" name="thuong" type="text" value="" placeholder="Nhập mức thưởng" required/>
                            </div>

                            <div class="form-item1">
                                <label class="form-label" for="phat">Phạt</label>
                                <input class="form-input" id="phat" name="phat" type="text" value="" placeholder="Nhập mức phạt" required/>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="tongnhan">Tổng nhận</label>
                                <div class="form-infob" id="tongnhan" name="tongnhan">${tongnhan}</div>
                            </div>
                            
                            <div class="form-item1">
                                <label class="form-label" for="chuthich">Chú thích</label>
                                <input class="form-input" id="chuthich" name="chuthich" type="text" value=""  placeholder="Nhập nếu có"/>
                            </div>

                        </div>

                        <div id="form-right" class="form-block">
                            <div class="form-item2">
                                <button class="form-button" id="button-update" type="submit" formaction="updatesalary">Sửa</button>
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
    <script src="js/salary.js"></script>
</html>