function getValue(id){
    return document.getElementById(id).value.trim();
}
function insert(id){

    var table = document.getElementById("tbl-content").rows;
    for(var i=0; i<table.length; i++){
        if(id == table[i].cells[0].innerText){
            document.getElementById('id').value = table[i].cells[0].innerText;
            document.getElementById('hoten').value = table[i].cells[1].innerText;
            document.getElementById('ngaysinh').value = table[i].cells[2].innerText;
            var gioitinh = table[i].cells[3].innerText;
            if(gioitinh == "Nam") document.getElementById('radio1').checked = 'true';
            else document.getElementById('radio2').checked = 'true';
            document.getElementById('sdt').value = table[i].cells[4].innerText;
            document.getElementById('diachi').value = table[i].cells[5].innerText;
            document.getElementById('chinhanh').value = table[i].cells[6].innerText;
            document.getElementById('chucvu').value = table[i].cells[7].innerText;
            document.getElementById('mucluong').value = table[i].cells[8].innerText;
            document.getElementById('chuthich').value = table[i].cells[9].innerText;
        }
    }

}
function hideerror(){
    document.getElementById('error').innerHTML = "";
}

