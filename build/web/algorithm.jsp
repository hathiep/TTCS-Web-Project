<%-- 
    Document   : type_algorithm
    Created on : Apr 16, 2023, 9:44:17 PM
    Author     : havanthiep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thuật toán</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/algorithm.css">
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <script src="https://unpkg.com/d3-svg-arrowhead"></script>
    <script src="js/algorithmsc.js"></script>
</head>
<body>
    <div class="home-heading">
        <h1>Chào mừng bạn đến với Tada!</h1>
    </div>
    <div class="home-body">
        <div class="home-menu">
            <a class="menu-item" href="index.jsp">Trang chủ</a></li>
            <li id="management" class="menu-item">Quản lý nhân viên
                <ul class="sub-menu">
                    <li><a href="management">Thông tin nhân viên</a></li>
                    <li><a href="salary">Quản lý bảng lương</a></li>
                </ul>
            </li>
            <a class="algorithm menu-item" href="algorithm.jsp">Thuật toán</a>
            <a id="languageprocess" class="menu-item" href="languageprocess">Xử lý ngôn ngữ tự nhiên</a>
        </div>
        <div class="home-main">
            <div class="main-block" id="request">
                <form class="form" method="post" action="algorithmcontrol">
            
                    <h2 id="heading">Thuật toán tìm kiếm đường đi trên đồ thị</h1>

                    <div id="form-top" class="form-block">
                        
                        <div class="form-item2">
                            <label class="form-label" for="type_algorithm">Thuật toán</label>
                            <div id="radio1" class="form-radio">
                                <input id="option_type1" type="radio" name="type_algorithm" value="0" > BFS<br>
                                <input id="option_type2" type="radio" name="type_algorithm" value="1" > DFS</br>
                            </div>
                        </div>
                    
                        <div class="form-item2" class="form-item1">
                            <label class="form-label" id="form-label-top" for="direction">Chiều</label>
                            <div id="radio2" class="form-radio">
                                <input id="option_direc1" type="radio" name="direction" value="0" > Có hướng<br>
                                <input id="option_direc2" type="radio" name="direction" value="1" > Vô hướng</br>
                            </div>
                        </div>
                        
                    </div>
                    
                    <div id="form-left" class="form-block">
                        
                        <div class="form-item1">
                            <label class="form-label" for="num_node" required>Số đỉnh</label>
                            <input class="form-input" id="num_node" name="num_node" type="number" min="2" value="${num_node}" placeholder="0"/>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="num_edge">Số cạnh</label>
                            <input class="form-input" id="num_edge" name="num_edge" type="number" min="1" value="${num_edge}" placeholder="0"/>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="start_node">Bắt đầu</label>
                            <select class="form-option" name="start_node" id="start_node" value="${start_node}">
                                <option value="A">A</option> <option value="B">B</option>
                                <option value="C">C</option> <option value="D">D</option>
                                <option value="E">E</option> <option value="F">F</option>
                                <option value="G">G</option> <option value="H">H</option>
                                <option value="I">I</option> <option value="J">J</option>
                                <option value="K">K</option> <option value="L">L</option>
                                <option value="M">M</option> <option value="N">N</option>
                                <option value="O">O</option> <option value="P">P</option>
                                <option value="Q">Q</option> <option value="R">R</option>
                                <option value="S">S</option> <option value="T">T</option>
                                <option value="U">U</option> <option value="V">V</option>
                                <option value="W">W</option> <option value="X">X</option>
                                <option value="Y">Y</option> <option value="X">Z</option>
                            </select>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="finish_node">Kết thúc</label>
                            <select class="form-option" name="finish_node" id="finish_node" value="${finish_node}">
                                <option value="A">A</option> <option value="B">B</option>
                                <option value="C">C</option> <option value="D">D</option>
                                <option value="E">E</option> <option value="F">F</option>
                                <option value="G">G</option> <option value="H">H</option>
                                <option value="I">I</option> <option value="J">J</option>
                                <option value="K">K</option> <option value="L">L</option>
                                <option value="M">M</option> <option value="N">N</option>
                                <option value="O">O</option> <option value="P">P</option>
                                <option value="Q">Q</option> <option value="R">R</option>
                                <option value="S">S</option> <option value="T">T</option>
                                <option value="U">U</option> <option value="V">V</option>
                                <option value="W">W</option> <option value="X">X</option>
                                <option value="Y">Y</option> <option value="X">Z</option>
                            </select>
                        </div>
                                
                        <%
                            String type_algo = (String) request.getAttribute("type_algo");
                            if(type_algo == null) type_algo = "0";
                            String direc_algo = (String) request.getAttribute("direc_algo");
                            if(direc_algo == null) direc_algo = "0";
                            String start_node = (String) request.getAttribute("start_node");
                            if(start_node == null) start_node = "A";
                            String finish_node = (String) request.getAttribute("finish_node");
                            if(finish_node == null) finish_node = "A";
                            
                        %>
                        
                        <script>
                            displayInput('<%=start_node%>','<%=finish_node%>', '<%=type_algo%>', '<%=direc_algo%>')
                        </script>

                    </div>

                    <div id="form-right" class="form-block">
                        
                        
                        <div class="form-item1">
                            <label class="form-label" for="first_node">Đỉnh đầu</label>
                            <select class="form-option" name="first_node" id="first_node">
                                <option value="A">A</option> <option value="B">B</option>
                                <option value="C">C</option> <option value="D">D</option>
                                <option value="E">E</option> <option value="F">F</option>
                                <option value="G">G</option> <option value="H">H</option>
                                <option value="I">I</option> <option value="J">J</option>
                                <option value="K">K</option> <option value="L">L</option>
                                <option value="M">M</option> <option value="N">N</option>
                                <option value="O">O</option> <option value="P">P</option>
                                <option value="Q">Q</option> <option value="R">R</option>
                                <option value="S">S</option> <option value="T">T</option>
                                <option value="U">U</option> <option value="V">V</option>
                                <option value="W">W</option> <option value="X">X</option>
                                <option value="Y">Y</option> <option value="X">Z</option>
                            </select>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="last_node">Đỉnh cuối</label>
                            <select class="form-option" name="last_node" id="last_node">
                                <option value="A">A</option> <option value="B">B</option>
                                <option value="C">C</option> <option value="D">D</option>
                                <option value="E">E</option> <option value="F">F</option>
                                <option value="G">G</option> <option value="H">H</option>
                                <option value="I">I</option> <option value="J">J</option>
                                <option value="K">K</option> <option value="L">L</option>
                                <option value="M">M</option> <option value="N">N</option>
                                <option value="O">O</option> <option value="P">P</option>
                                <option value="Q">Q</option> <option value="R">R</option>
                                <option value="S">S</option> <option value="T">T</option>
                                <option value="U">U</option> <option value="V">V</option>
                                <option value="W">W</option> <option value="X">X</option>
                                <option value="Y">Y</option> <option value="X">Z</option>
                            </select>
                        </div>
                        
                        <button class="form-button" id="button-add" type="button" onclick="add_edge()">Thêm cạnh</button>
                        <button class="form-button" id="button-delete" type="submit" onclick="delete_edge()">Xoá cạnh</button>
                    </div>

                    <div id="form-bottom" class="form-block">
                        
                        <div class="form-label" id="label-bottom" >Danh sách cạnh:</div><br>
                        <div id="list_edge">${list_edge}</div>
                        <input class="form-input" id="list_input_edge" name="list_input_edge" hidden="true" type="text"/>
                        <input class="form-input" id="list_split_edge" name="list_split_edge" hidden="true" type="text"/>
                    </div>
                    
                    <button class="form-button" id="button-search" type="submit" >Tìm kiếm đường đi</button>
                    <%
                        String edgeString = (String) request.getAttribute("edgeString");
                        String pathString = (String) request.getAttribute("pathString");
                        String dir = (String) request.getAttribute("dir");
                    %>

                </form>
            </div>
            <div class="main-block" id="answer" >
                <form class="form">
            
                    <h2 id="heading">Ðường đi trên đồ thị ${snode} ${fnode} theo thuật toán ${type}</h1>
                    <h2 class="ans">${ans}</h2>
                    <svg id="mySvg" style="width: 650px; height: 550px;"></svg>
                    <script>
                        displayResult('<%=edgeString%>', '<%=pathString%>', '<%=dir%>');
                    </script>

                </form>
            </div>
        </div>
    </div>
                
</body>
</html>