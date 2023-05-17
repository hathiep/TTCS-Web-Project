<%-- 
    Document   : languageprocess
    Created on : Apr 16, 2023, 9:45:55 PM
    Author     : havanthiep
--%>
<%@page import="java.util.*"%>
<%@page import="model.languageprocess.NLP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xử lý ngôn ngữ tự nhiên</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/languageprocess.css">
    <script src="js/languageprocess.js"></script>
</head>
<body>
    <div class="home-heading">
        <h1>Chào mừng bạn đến với Tada!</h1>
    </div>
    <div class="home-body">
        <div class="home-menu">
            <a id="home" class="menu-item" href="index.jsp">Trang chủ</a>
            <li id="management" class="menu-item">Quản lý nhân viên
                <ul class="sub-menu">
                    <li><a href="management">Thông tin nhân viên</a></li>
                    <li><a href="salary">Quản lý bảng lương</a></li>
                </ul>
            </li>
            <a id="algorithm" class="menu-item" href="algorithm.jsp">Thuật toán</a>
            <a class="languageprocess menu-item" href="languageprocess">Xử lý ngôn ngữ tự nhiên</a>
        </div>
        <div class="home-main">
            <form method="post" action="" class="form">
                
                <div id="block1" class="main-block">
                    <h2 class="heading">Tách từ trong câu</h1><br>
                    <textarea class="form-input" id="sentence" name="sentence" placeholder="Nhập câu cần tách" required></textarea>
                    <button class="form-button" id="button-split" type="submit" formaction="languageprocess">Tách</button>
                </div>

                <div id="block2" class="main-block">
                    <h2 class="heading">Danh sách từ trong câu</h1><br>
                    <div id="all-table">
                        <div id="block-table1" class="block-table">
                            <table id="table1" class="table-word" cellpadding="3" cellspacing="0" border="0">

                                <thead>
                                    <tr>
                                        <th class="table-header col0">STT</th>
                                        <th class="table-header col">Tất cả từ</th>
                                    </tr>
                                </thead>

                                <tbody>

                            <%
                                ArrayList<String> list = (ArrayList<String>)request.getAttribute("listWord");
                                if(list.size()!=0){
                                    int stt = 0;
                                    for(String i:list){
                                        stt++;
                                        if(i=="") break;
                                    
                            %>
                                        <tr class="row">
                                            <td class="col0"><%=stt%></td>
                                            <td class="col"><%=i%></td>
                                        </tr>
                            <%
                                    }
                                }
                            %>
                                </tbody>
                            </table>
                        </div>  

                        <div id="block-table2" class="block-table">
                            <table id="table2" class="table-word" cellpadding="3" cellspacing="0" border="0">

                                <thead>
                                    <tr>
                                        <th class="table-header col2">STT</th>
                                        <th class="table-header col1">Từ khác nhau</th>
                                        <th class="table-header center col2">Số lần</th>
                                    </tr>
                                </thead>
                                <tbody>

                            <%
                                HashMap<String, Integer> map = (HashMap<String, Integer>)request.getAttribute("mapWord");
                                if(map.size()!=0){
                                    int t = 0;
                                    for (String word : map.keySet()) {
                                        int count = map.get(word);
                                        if(count==0) break;
                                        t++;
                            %>
                                        <tr class="row">
                                            <td class="col2"><%=t%></td>
                                            <td class="col1"><%=word%></td>
                                            <td class="right col2"><%=count%></td>
                                        </tr>
                            <%
                                    }
                                }
                            %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>