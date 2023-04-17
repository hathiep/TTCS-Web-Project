function getValue(id){
    return document.getElementById(id).value.trim();
}

function solve(e){
    event.preventDefault();

    var num_node = getValue('num_node');
    var num_edge = getValue('num_edge');
    var first_node = getValue('first_node');
    var last_node = getValue('last_node');
    var all_edge = getValue('all_edge').trim();

    if (num_node == '' || num_edge == '' || first_node == '' || last_node == '' || all_edge == ''){
        alert("Vui lòng nhập đầy đủ thông tin");
    }
    else if (validate_num_edge(num_node, num_edge)){
        alert("Số cạnh không đúng. Vui lòng nhập lại!");
    }
    else if (validate_node(first_node, last_node)){
        alert("Đỉnh đầu không được trùng đỉnh cuối!");
    }
    else if (validate_all_edge(num_edge, all_edge)){
        alert("Các cạnh không đúng");
    }
    else{
        alert("Đăng ký thành công");
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