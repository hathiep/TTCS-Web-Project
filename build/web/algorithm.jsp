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

                    <div class="form-left">
                        <div class="form-item">
                            <label class="form-label" for="num_node">Số đỉnh</label>
                            <input class="form-input" id="num_node" name="num_node" type="number" min="2" placeholder="0"/>
                        </div>

                        <div class="form-item">
                            <label class="form-label" for="num_edge">Số cạnh</label>
                            <input class="form-input" id="num_edge" name="num_edge" type="number" min="1" placeholder="0"/>
                        </div>

                        <div class="form-item">
                            <label class="form-label" for="first_node">Đỉnh đầu</label>
                            <select class="form-option" name="first_node" id="first_node">
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

                        <div class="form-item">
                            <label class="form-label" for="last_node">Đỉnh cuối</label>
                            <select class="form-option" name="last_node" id="last_node">
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

                        <div class="form-item2">
                            <label class="form-label" for="type_algorithm">Thuật toán</label>
                            <div class="form-radio">
                                <input type="radio" name="type_algorithm" value="1" checked> BFS<br>
                                <input type="radio" name="type_algorithm" value="0" > DFS</br>
                            </div>
                        </div>

                    </div>

                    <div class="form-right">
                        <div class="form-item3">
                            <label id="label-right" class="form-label" for="all_edge">Các cạnh</label><br>
                            <textarea class="form-inputb" id="all_edge" name="all_edge" cols="2" placeholder="AB  AC  CD" required ></textarea>
                        </div>
                    </div>

                    <button class="form-button" id="button" type="submit" onclick="solve()">Tìm kiếm đường đi</button>

                </form>
            </div>
            <div class="main-block" id="answer" >
                <form method="post" class="form">
            
                    <h1 id="heading">Ðáp án: Ðường đi ngắn nhất theo thuật toán</h1>
                    <div id="ans"></div>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="js/algorithm.js"></script>-->
</html>