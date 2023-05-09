function getValue(id){
    return document.getElementById(id).value.trim();
}
function insert(id){

    var table = document.getElementById("tbl-content").rows;
    for(var i=0; i<table.length; i++){
        if(id == table[i].cells[0].innerText){
            document.getElementById('id').innerHTML = table[i].cells[0].innerText;
            document.getElementById('idud').value = table[i].cells[0].innerText;
//            document.getElementById('button-update').href = "updatesalary?idud=" + table[i].cells[0].innerText;
            document.getElementById('thang').innerHTML = table[i].cells[1].innerText;
            document.getElementById('idnv').innerHTML = table[i].cells[2].innerText;
            document.getElementById('hoten').innerHTML = table[i].cells[3].innerText;
            document.getElementById('chucvu').innerHTML = table[i].cells[4].innerText;
            document.getElementById('mucluong').innerHTML = table[i].cells[5].innerText;
            var thuong = table[i].cells[6].innerText;
            if(thuong == 0) thuong = "";
            var phat = table[i].cells[7].innerText;
            if(phat == 0) phat = "";
            document.getElementById('thuong').value = thuong ;
            document.getElementById('phat').value = phat;
            document.getElementById('tongnhan').innerHTML = table[i].cells[8].innerText;
            document.getElementById('chuthich').value = table[i].cells[9].innerText;
//            document.getElementById('vlmonth').value = getValue('ipmonth');
//            document.getElementById('vlyear').value = getValue('ipyear');
//            document.getElementById('vlnv').value = getValue('ipnv');
        }
    }

}
function hideerror(){
    document.getElementById('error').innerHTML = "";
}
//document.getElementById("forminfo").onsubmit = function(){
//    var month = getValue("list-month");
//    var year = getValue("list-year");
//    var idnv = getValue("list-nv");
//    
//    document.getElementById("list-month").value = month;
//    document.getElementById("list-year").value = year;
//    document.getElementById("list-nv").value = idnv;
//    
//    return true;
//};

