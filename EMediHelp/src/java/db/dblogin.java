/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author ku1d33p
 */
@Entity
@Table(name = "login")
public class dblogin {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int log_id;
    @Column(name = "role_id")
    private int role_id;
    @Column(name = "full_name")
    private String full_name;
    @Column(name = "img_id")
    private int img_id;
    @Column(name = "email")
    private String email;
    @Column(name = "dob")
    private String dob;
    @Column(name = "phone_no")
    private String phone_no;
    @Column(name = "password")
    private String password;
    @Column(name = "is_active")
    private int is_active;
    @Column(name = "added_on")
    private String added_on;
    @Column(name = "edited_on")
    private String edited_on;
    @Column(name = "deleted")
    private int deleted;

    public dblogin() {
    }

    public dblogin(int _role_id, String _fullname, String _email, String _dob, String _phone_no, String _password, String _edited_on) {
        this.role_id = _role_id;
        this.full_name = _fullname;
        this.img_id = 1;
        this.email = _email;
        this.dob = _dob;
        this.phone_no = _phone_no;
        this.password = _password;
        this.is_active = 1;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = 0;
    }

    public int getLog_id() {
        return log_id;
    }

    public void setLog_id(int log_id) {
        this.log_id = log_id;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone_no() {
        return phone_no;
    }

    public void setPhone_no(String phone_no) {
        this.phone_no = phone_no;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    public String getAdded_on() {
        return added_on;
    }

    public void setAdded_on(String added_on) {
        this.added_on = added_on;
    }

    public String getEdited_on() {
        return edited_on;
    }

    public void setEdited_on(String edited_on) {
        this.edited_on = edited_on;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    
}
