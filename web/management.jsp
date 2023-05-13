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
    <title>Quản lý nhân viên</title>
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
                
                <div id="block-work">
                        <a id="link-all-nv" class="menu-work menu-item" href="management?work=2">Tất cả nhân viên</a>
                        <a id="link-current-nv" class="menu-work menu-item" href="management?work=1">Nhân viên hiện tại</a>
                        <a id="link-retired-nv" class="menu-work menu-item" href="management?work=0">Nhân viên đã nghỉ việc</a>
                    </div>
                    
                <div id="block-table" class="main-block">
                                        
                    <h2 class="heading"> Bảng thông tin ${header_table} </h2>
                    
                    <div id="box">
                        <table id="tbl-content" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th id="idleft" class="table-header col0" >ID</th>
                                    <th class="table-header col2">Họ</th>
                                    <th class="table-header col1">Tên</th>
                                    <th class="table-header col2">Ngày sinh</th>
                                    <th class="table-header col1">Giới tính</th>
                                    <th class="table-header col2">SĐT</th>
                                    <th class="table-header col5">Địa chỉ</th>
                                    <th class="table-header col3">Ngày nhận việc</th>
                                    <th class="table-header col4">Chức vụ</th>
                                    <th class="table-header col2">Mức Lương</th>
                                    <th class="table-header col4">Chú thích</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<NV> list = (List<NV>)request.getAttribute("listNV");
                            int t = 0, k = 0, j;
                            for(NV i:list){
                                t++; k = t%2;
                                String[] w = i.getHoten().split("\\s+");
                                String fname = "";
                                for(j=0; j<w.length-1; j++){
                                    fname+= w[j] + " ";
                                }
                                fname.trim();
                                String lname = w[j];
                        %>
                                <tr onclick="insert(<%=i.getId()%>)">
                                    <td class="center col0"><%=i.getId()%></td>
                                    <td class="left col2"><%=fname%></td>
                                    <td class="left col1"><%=lname%></td>
                                    <td class="center col2"><%=i.getNgaysinh()%></td>
                                    <td class="left col2"><%=i.getGioitinh()%></td>
                                    <td class="center col2"><%=i.getSdt()%></td>
                                    <td class="left col5"><%=i.getDiachi()%></td>
                                    <td class="center col3"><%=i.getNgaynhanviec()%></td>
                                    <td class="left col4"><%=i.getChucvu()%></td>
                                    <td class="right col2"><%=i.getMucluong()%></td>
                                    <td class="left col4"><%=i.getChuthich()%></td>
                                    <td style="display:none"><%=i.getImage()%></td>
                                </tr>
                         <%
                            }
                        %>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div id="block-infor" class="main-block">
<!--                    style="display: none;"-->
                    <form method="post" action="" class="form" id="forminfo" enctype="multipart/form-data">

                        <h2 class="heading">Chỉnh sửa thông tin nhân viên</h1>
                        <h4 class="form-message" id="error">${error}</h4>
                        
                        <input class="form-input" id="idimage" name="idimage" type="hidden" value=""/>
                        
                        <%
                            String srcImg = "#";
                            List<NV> list2 = (List<NV>)request.getAttribute("listNV");
                            String id = request.getParameter("idimage");
                            String alt = "";
                            if(id != null){
                                for(NV i:list2){
                                    if(i.getId()== Integer.parseInt(id)){
                                        srcImg = i.getImage();
                                        alt = i.getHoten();
                                    }
                                }
                            }
                            
                        %>
                        
                        <div id="form-image" class="form-block">
                            
                            <div class="form-item3">
                                
                                <a id="link-image" style="width:100%;" src="#" target="_blank">
                                    <img id="preview" src="#" alt="<%=alt%>" style="display: block;"/>
                                </a>
                                <input id="image" type="file" name="image"/>
                                <label id="suggest" for="image">Chọn ảnh</label>
                                <script>
                                    var input = document.getElementById('image');
                                    var preview = document.getElementById('preview');
                                    var filename = document.getElementById('filename');

                                    input.addEventListener('change', function() {
                                      if (this.files && this.files[0]) {
                                        var reader = new FileReader();

                                        reader.onload = function(e) {
                                          preview.setAttribute('src', e.target.result);
                                        }

                                        reader.readAsDataURL(this.files[0]);

                                        filename.innerHTML = this.files[0].name;

                                        input.setAttribute('title', '');
                                      } else {
                                        filename.innerHTML = "";
                                      }
                                    });
                                  </script>
                                
                            </div>
                            
                        </div>    

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
                                <input class="form-input" type="date" name="ngaysinh" id="ngaysinh" value="1980-01-01" required>
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
                                <label class="form-label" for="ngaynhanviec">Ngày nhận việc</label>
                                <input class="form-input" id="ngaynhanviec" name="ngaynhanviec" type="date" value="2020-01-01" required/>
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
                                <button class="form-button" id="button-delete" type="submit" formaction="delete">Xoá</button>
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