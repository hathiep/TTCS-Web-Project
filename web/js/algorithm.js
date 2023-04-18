function getValue(id){
    return document.getElementById(id).value.trim();
}
var list_edge = new Array();
var lisy_size = 0;
var list_node = new Array();

function solve(e){
    event.preventDefault();

    var num_node = getValue('num_node');
    var num_edge = getValue('num_edge');
    var start_node = getValue('start_node');
    var finish_node = getValue('finish_node');
    var all_edge = getValue('all_edge').trim();

    if (num_node == '' || num_edge == '' || start_node == '' || finish_node == '' || all_edge == ''){
        alert("Vui lòng nhập đầy đủ thông tin");
    }
    else if (validate_num_edge(num_node, num_edge)){
        alert("Số cạnh không đúng. Vui lòng nhập lại!");
    }
    else if (validate_node(start_node, finish_node)){
        alert("Đỉnh bắt đầu không được trùng kết thúc!");
    }
    else if (validate_all_edge(num_edge, all_edge)){
        alert("Các cạnh không đúng");
    }
    else{
        alert("Đăng ký thành công");
    }
}

function add_edge(e){
    event.preventDefault();
    
    var num_node = getValue('num_node');
    var num_edge = getValue('num_edge');
    var first_node = getValue('first_node');
    var last_node = getValue('last_node');
    var edge = first_node + last_node;
    var edge_reserve = last_node + first_node;
    
    if (first_node == '' || last_node == ''){
        alert("Vui lòng nhập cả hai đỉnh!");
    }
    else if (validate_node(first_node, last_node)){
        alert("Hai đỉnh không được trùng nhau!");
    }
    else if(list_edge.length == num_edge) {
        alert("Đã đạt giới hạn cạnh!");
    }
    else if(((!list_node.includes(first_node) || !list_node.includes(last_node)) && list_node.length == num_node) ||
            ((!list_node.includes(first_node) && !list_node.includes(last_node)) && list_node.length == num_node-1)){
            alert("Đã đạt giới hạn đỉnh!");
    }
    else {
        if(!list_node.includes(first_node)){
            list_node.push(first_node);
        }
        if(!list_node.includes(last_node)){
            list_node.push(last_node);
        }
        if (list_edge.includes(edge) || list_edge.includes(edge_reserve)){
            alert("Cạnh đã tồn tại!");
        }
        else{
            list_size = list_edge.push(edge);
            document.getElementById("list_edge").innerHTML = list_edge.join(", ");
        }
    }
}

function delete_edge(e){
    event.preventDefault();
    
    var first_node = getValue('first_node');
    var last_node = getValue('last_node');
    var edge = first_node + last_node;
    var edge_reserve = last_node + first_node;
    
    if (first_node == '' || last_node == ''){
        alert("Vui lòng nhập cả hai đỉnh!");
    }
    else if (validate_node(first_node, last_node)){
        alert("Hai đỉnh không được trùng nhau!");
    }
    else if (!list_edge.includes(edge) && !list_edge.includes(edge_reserve)){
        alert("Cạnh không tồn tại!");
    }
    else{
        list_edge.splice(list_edge.indexOf(edge), 1);
        document.getElementById("list_edge").innerHTML = list_edge.join(", ");
    }
}

function validate_num_edge(num_node, num_edge){
    return num_edge > num_node*(num_node-1)/2;
}

function validate_node(first_node, last_node){
    return first_node == last_node;
}

function validate_all_edge(num_edge, all_edge){
    var arr = all_edge.split("\n");
    for(var i=0; i<arr.length; i++){
        if(arr[i].length!=2) return true;
    }
    return arr.length != num_edge;
}

//function validate_all_edge(num_node, num_edge, first_node, last_node, all_edge){
//    return s = all_edge.split(" ,");
//}

function validate_Phone(phone){
    var regex_phone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    return !regex_phone.test(phone);
}

function validate_Password(password){
    var regex_password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,15}$/;
    return !regex_password.test(password);
}