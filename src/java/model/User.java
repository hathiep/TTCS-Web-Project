package model;

public class User {
    private int id;
    private String fullname, email, phone_num, password;

    public User() {
    }

    public User(int id, String fullname, String email, String phone_num, String password) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phone_num = phone_num;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
