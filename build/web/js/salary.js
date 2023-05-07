function getValue(id){
    return document.getElementById(id).value.trim();
}
function insert(id){

    var table = document.getElementById("tbl-content").rows;
    for(var i=0; i<table.length; i++){
        if(id == table[i].cells[0].innerText){
            document.getElementById('id').innerHTML = table[i].cells[0].innerText;
            document.getElementById('idl').value = table[i].cells[0].innerText;
            document.getElementById('thang').innerHTML = table[i].cells[1].innerText;
            document.getElementById('idnv').innerHTML = table[i].cells[2].innerText;
            document.getElementById('hoten').innerHTML = table[i].cells[3].innerText;
            document.getElementById('chucvu').innerHTML = table[i].cells[4].innerText;
            document.getElementById('mucluong').innerHTML = table[i].cells[5].innerText;
            document.getElementById('thuong').value = table[i].cells[6].innerText;
            document.getElementById('phat').value = table[i].cells[7].innerText;
            document.getElementById('tongnhan').innerHTML = table[i].cells[8].innerText;
            document.getElementById('chuthich').value = table[i].cells[9].innerText;
        }
    }

}
function hideerror(){
    document.getElementById('error').innerHTML = "";
}

