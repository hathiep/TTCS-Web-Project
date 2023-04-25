function getValue(id){
    return document.getElementById(id).value.trim();
}
var list_edge = new Array();
var list_node = new Array();

function add_edge(e){
    event.preventDefault();
    
    var num_node = getValue('num_node');
    var num_edge = getValue('num_edge');
    var first_node = getValue('first_node');
    var last_node = getValue('last_node');
    var edge = first_node + last_node;
    var edge_reserve = last_node + first_node;
    
    if (num_node == '' || num_edge == '' || first_node == '' || last_node == ''){
        alert("Vui lòng nhập đầy đủ thông tin");
    }
    else if (first_node == last_node){
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
            document.getElementById("list_input_edge").value = list_edge.join("");
        
        }
    }
}
function delete_edge(e){
    event.preventDefault();
    
    var first_node = getValue('first_node');
    var last_node = getValue('last_node');
    var edge = first_node + last_node;
    var edge_reserve = last_node + first_node;
    
    if(list_edge == 0){
        alert("Không có cạnh nào để xoá");
    }
    else if (first_node == '' || last_node == ''){
        alert("Vui lòng nhập cả hai đỉnh!");
    }
    else if (first_node == last_node){
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
function search(e){
    event.preventDefault();
    
    var num_node = getValue('num_node');
    var num_edge = getValue('num_edge');
    var start_node = getValue('start_node');
    var finish_node = getValue('finish_node');

    if (num_node == '' || num_edge == '' || start_node == '' || finish_node == ''){
        alert("Vui lòng nhập đầy đủ thông tin");
    }
    else if (start_node == finish_node){
        alert("Đỉnh bắt đầu không được trùng kết thúc!");
    }
    else if (list_edge.length < num_edge){
        alert("Vui lòng nhập đầy đủ các cạnh!");
    }
    else if (list_node.length < num_node){
        alert("Số đỉnh không đúng!");
    }
    else if (!list_node.includes(start_node)){
        alert("Không có cạnh chứa đỉnh bắt đầu!");
    }
    else if (!list_node.includes(finish_node)){
        alert("Không có cạnh chứa đỉnh kết thúc!");
    }
    else{
        alert("Đăng ký thành công!");
    }
}