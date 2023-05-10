function getValue(id){
    return document.getElementById(id).value.trim();
}
function insert(id){

    var table = document.getElementById("tbl-content").rows;
    for(var i=0; i<table.length; i++){
        if(id == table[i].cells[0].innerText){
            document.getElementById('id').value = table[i].cells[0].innerText;
            document.getElementById('hoten').value = table[i].cells[1].innerText + " " + table[i].cells[2].innerText;
            document.getElementById('ngaysinh').value = table[i].cells[3].innerText;
            var gioitinh = table[i].cells[4].innerText;
            if(gioitinh == "Nam") document.getElementById('radio1').checked = 'true';
            else document.getElementById('radio2').checked = 'true';
            document.getElementById('sdt').value = table[i].cells[5].innerText;
            document.getElementById('diachi').value = table[i].cells[6].innerText;
            document.getElementById('ngaynhanviec').value = table[i].cells[7].innerText;
            document.getElementById('chucvu').value = table[i].cells[8].innerText;
            document.getElementById('mucluong').value = table[i].cells[9].innerText;
            document.getElementById('chuthich').value = table[i].cells[10].innerText;
        }
    }

}
function makeSortable() {
    const table = document.querySelector('#tbl-content');
    const headers = table.querySelectorAll('.table-header');

    headers.forEach((header, index) => {
        header.addEventListener('click', () => {
          // Xác định thứ tự sắp xếp và cột được chọn
            const isAscending = header.classList.contains('asc');
            const columnIndex = index;

            // Sắp xếp bảng
            sortTableByColumn(table, columnIndex, isAscending);

            // Đổi thứ tự sắp xếp và cập nhật lớp CSS trên tiêu đề cột
            headers.forEach((h) => {
                h.classList.remove('asc', 'desc');
            });
            header.classList.toggle(isAscending ? 'desc' : 'asc');
        });
    });
}

function sortTableByColumn(table, column, asc = true) {
    const dirModifier = asc ? 1 : -1;
    const tBody = table.tBodies[0];
    const rows = Array.from(tBody.querySelectorAll("tr"));

    // Sắp xếp các hàng theo giá trị của cột được chỉ định
    const sortedRows = rows.sort((a, b) => {
        const aVal = a.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
        const bVal = b.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
        return aVal.localeCompare(bVal, undefined, {numeric: true}) * dirModifier;
    });

    // Xóa các hàng hiện tại khỏi bảng
    while (tBody.firstChild) {
        tBody.removeChild(tBody.firstChild);
    }

    // Thêm các hàng đã sắp xếp trở lại vào bảng
    tBody.append(...sortedRows);
}
makeSortable();

function hideerror(){
    document.getElementById('error').innerHTML = "";
}

