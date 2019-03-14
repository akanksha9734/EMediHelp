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
 * @author bhanu
 */
@Entity
@Table(name = "role")
public class role {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int role_id;

    @Column(name = "role_name")
    private String role_name;

    @Column(name = "acces_lvl")
    private int acces_lvl;

    @Column(name = "is_active")
    private int is_active;

    @Column(name = "added_on")
    private String added_on;

    @Column(name = "edited_on")
    private String edited_on;

    @Column(name = "deleted")
    private int deleted;

    @Column(name = "added_by")
    private int added_by;

    public role() {
    }

    public role(String _role_name, int _acces_lvl, String _edited_on, int _added_by) {

        this.role_name = _role_name;
        this.acces_lvl = _acces_lvl;
        this.is_active = 1;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = 0;
        this.added_by = _added_by;

    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public int getAcces_lvl() {
        return acces_lvl;
    }

    public void setAcces_lvl(int acces_lvl) {
        this.acces_lvl = acces_lvl;
    }

    public int isIs_active() {
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

    public int isDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public int getAdded_by() {
        return added_by;
    }

    public void setAdded_by(int added_by) {
        this.added_by = added_by;
    }

}
