<%-- 
    Document   : languageprocess
    Created on : Apr 16, 2023, 9:45:55 PM
    Author     : havanthiep
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.NLP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xử lý ngôn ngữ tự nhiên</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/language.css">
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
            <form method="post" action="" class="form">
                
                <div id="block1" class="main-block">
                    <h2 id="heading">Tách từ trong câu</h1><br>
                    <textarea class="form-input" id="sentence" name="sentence" placeholder="Nhập câu cần tách" required></textarea>
                    <button class="form-button" id="button-split" type="submit" formaction="languageprocess">Tách</button>
                </div>

                <div id="block2" class="main-block">
                    <div class="block-table">
                        <table id="table1" class="table-word" cellpadding="3" cellspacing="0" border="0">
                        <%
                            ArrayList<String> list = (ArrayList<String>)request.getAttribute("listWord");
                            if(list.size()!=0){
                                for(String i:list){
                        %>
                                    <tr class="row">
                                        <td class="col"><%=i%></td>
                                    </tr>
                        <%
                                }
                            }
                        %>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>