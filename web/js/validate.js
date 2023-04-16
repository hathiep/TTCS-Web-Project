function getValue(id){
    return document.getElementById(id).value.trim();
}

function validate_SignUp(e){
    event.preventDefault();

    var fullname = getValue('fullname');
    var email = getValue('email');
    var phone = getValue('phone');
    var password = getValue('password');
    var password_confirm = getValue('password_confirm');

    if (fullname === '' || email === '' || phone === '' || password === '' || password_confirm === ''){
        alert("Vui lòng điền đầy đủ thông tin");
    }
    else if (validate_Fullname(fullname)){
        alert("Vui lòng nhập đầy đủ họ và tên");
    }
    else if (validate_Email(email)){
        alert("Email không đúng định dạng");
    }
    else if (validate_Phone(phone)){
        alert("Số điện thoại không đúng");
    }
    else if (validate_Password(password)){
        alert("Mật khẩu dài từ 6 - 15 kí tự, có đầy đủ kí tự thường, kí tự viết hoa, chữ số và kí tự đặc biệt");
    }
    else{
        alert("Đăng ký thành công");
        window.location.href="login.html";
    }
}

function validate_Login(e){
    event.preventDefault();
    var email = getValue('email');
    var password = getValue('password');

    if (email === null || password === null ){
        alert("Vui lòng điền đầy đủ thông tin");
    }
    else if (validate_Email(email)){
        alert("Email không đúng định dạng");
    }
    else if (validate_Password(password)){
        alert("Mật khẩu dài từ 6 - 15 kí tự, có đầy đủ kí tự thường, kí tự viết hoa, chữ số và kí tự đặc biệt");
    }
    else{
        alert("Đăng nhập thành công");
        window.location.href = "infor.html";
    }
}

function validate_Fullname(fullname){
    return fullname.split(" ").length < 2;
}

function validate_Email(email){
    var regex_email = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    return !regex_email.test(email);
}

function validate_Phone(phone){
    var regex_phone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    return !regex_phone.test(phone);
}

function validate_Password(password){
    var regex_password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,15}$/;
    return !regex_password.test(password);
}