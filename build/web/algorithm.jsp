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
    <link rel="stylesheet" href="css/algorithm.css">
</head>
<body>
    <div class="home-heading">
        <h1>Chào mừng bạn đến với Tada!</h1>
    </div>
    <div class="home-body">
        <div class="home-menu">
            <li><a href="home.jsp">Trang chủ</a></li>
            <li><a href="management.jsp">Quản lý</a></li>
            <li><a href="languageprocess.jsp">Xử lý ngôn ngữ tự nhiên</a></li>
        </div>
        <div class="home-main">
            <div class="main-block" id="request">
                <form method="post" class="form">
            
                    <h1 id="heading">Thuật toán tìm kiếm đường đi ngắn nhất</h1>

                    <div id="form-top" class="form-block">
                        
                        <div class="form-item2" class="form-item1">
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
                            <label class="form-label" for="num_node">Số đỉnh</label>
                            <input class="form-input" id="num_node" name="num_node" type="number" min="2" placeholder="0"/>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="num_edge">Số cạnh</label>
                            <input class="form-input" id="num_edge" name="num_edge" type="number" min="1" placeholder="0"/>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="start_node">Bắt đầu</label>
                            <select class="form-option" name="start_node" id="start_node">
                                <option value="1">A</option> <option value="2">B</option>
                                <option value="3">C</option> <option value="4">D</option>
                                <option value="5">E</option> <option value="6">F</option>
                                <option value="7">G</option> <option value="8">H</option>
                                <option value="9">I</option> <option value="10">J</option>
                                <option value="11">K</option> <option value="12">L</option>
                                <option value="13">M</option> <option value="14">N</option>
                                <option value="15">O</option> <option value="16">P</option>
                                <option value="17">Q</option> <option value="18">R</option>
                                <option value="19">S</option> <option value="20">T</option>
                                <option value="21">U</option> <option value="22">V</option>
                                <option value="23">W</option> <option value="24">X</option>
                                <option value="25">Y</option> <option value="26">Z</option>
                            </select>
                        </div>

                        <div class="form-item1">
                            <label class="form-label" for="finish_node">Kết thúc</label>
                            <select class="form-option" name="finish_node" id="finish_node">
                                <option value="1">A</option> <option value="2">B</option>
                                <option value="3">C</option> <option value="4">D</option>
                                <option value="5">E</option> <option value="6">F</option>
                                <option value="7">G</option> <option value="8">H</option>
                                <option value="9">I</option> <option value="10">J</option>
                                <option value="11">K</option> <option value="12">L</option>
                                <option value="13">M</option> <option value="14">N</option>
                                <option value="15">O</option> <option value="16">P</option>
                                <option value="17">Q</option> <option value="18">R</option>
                                <option value="19">S</option> <option value="20">T</option>
                                <option value="21">U</option> <option value="22">V</option>
                                <option value="23">W</option> <option value="24">X</option>
                                <option value="25">Y</option> <option value="26">Z</option>
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
                        
                        <button class="form-button" id="button-add" type="submit" onclick="add_edge()">Thêm cạnh</button>
                        <button class="form-button" id="button-delete" type="submit" onclick="delete_edge()">Xoá cạnh</button>
                    </div>

                    <div id="form-bottom" class="form-block">
                        
                        <div class="form-label" id="label-bottom" >Danh sách cạnh: </div><br>
                        <div id="list_edge"></div>
                                
                    </div>
                    
                    <button class="form-button" id="button-search" type="submit" onclick="solve()">Tìm kiếm đường đi</button>

                </form>
            </div>
            <div class="main-block" id="answer" >
                <form method="post" class="form">
            
                    <h1 id="heading">Ðáp án: Ðường đi ngắn nhất theo thuật toán</h1>
                    <div id="ans">${ans}</div>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="js/algorithm.js"></script>
</html>