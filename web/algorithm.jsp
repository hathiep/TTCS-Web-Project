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
            <li class="menu-item"><a href="index.jsp">Trang chủ</a></li>
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
            <div class="main-block" id="request">
                <form class="form" method="post" action="algorithmcontrol">
            
                    <h2 id="heading">Thuật toán tìm kiếm đường đi ngắn nhất</h1>

                    <div id="form-top" class="form-block">
                        
                        <div class="form-item2">
                            <label class="form-label" for="type_algorithm">Thuật toán</label>
                            <div id="radio1" class="form-radio">
                                <input type="radio" name="type_algorithm" value="1" checked> BFS<br>
                                <input type="radio" name="type_algorithm" value="0" > DFS</br>
                            </div>
                        </div>
                    
                        <div class="form-item2" class="form-item1">
                            <label class="form-label" id="form-label-top" for="direction">Chiều</label>
                            <div id="radio2" class="form-radio">
                                <input type="radio" name="direction" value="1" checked> Có hướng<br>
                                <input type="radio" name="direction" value="0" > Vô hướng</br>
                            </div>
                        </div>
                        
                    </div>
                    
                    <div id="form-left" class="form-block">
                        
                        <div class="form-item1">
                            <label class="form-label" for="num_node" required>Số đỉnh</label>
                            <input class="form-input" id="num_node" name="num_node" type="number" min="2" placeholder="0"/>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="num_edge">Số cạnh</label>
                            <input class="form-input" id="num_edge" name="num_edge" type="number" min="1" placeholder="0"/>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="start_node">Bắt đầu</label>
                            <select class="form-option" name="start_node" id="start_node">
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
                            <select class="form-option" name="finish_node" id="finish_node">
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
                        <div id="list_edge"></div>
                        <input class="form-input" id="list_input_edge" name="list_input_edge" hidden="true" type="text"/>
                        <input class="form-input" id="list_split_edge" name="list_split_edge" hidden="true" type="text"/>
                    </div>
                    
                    <button class="form-button" id="button-search" type="submit" >Tìm kiếm đường đi</button>
                    <%
                        String edgeString = (String) request.getAttribute("edgeString");
                    %>

                </form>
            </div>
            <div class="main-block" id="answer" >
                <form class="form">
            
                    <h2 id="heading">Ðường đi ngắn nhất ${snode} ${fnode} theo thuật toán ${type}</h1>
                    <h3 id="ans">Kết quả: ${ans}</h3>
                    <svg id="mySvg" style="width: 650px; height: 550px;"></svg>
                    <script>
                        displayResult('<%=edgeString%>');
                    </script>

                </form>
            </div>
        </div>
    </div>
                
</body>
</html>