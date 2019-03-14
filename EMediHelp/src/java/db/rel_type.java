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
@Table(name = "rel_type")
public class rel_type {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int rel_id;

    @Column(name = "rel_name")
    private String rel_name;

    @Column(name = "is_active")
    private boolean is_active;

    @Column(name = "added_on")
    private String added_on;

    @Column(name = "edited_on")
    private String edited_on;

    @Column(name = "deleted")
    private boolean deleted;

    @Column(name = "added_by")
    private int added_by;

    public rel_type() {
    }

    public rel_type(String _rel_name, String _edited_on, int _added_by) {

        this.rel_name = _rel_name;
        this.is_active = true;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = false;
        this.added_by = _added_by;
    }

    public int getRel_id() {
        return rel_id;
    }

    public void setRel_id(int rel_id) {
        this.rel_id = rel_id;
    }

    public String getRel_name() {
        return rel_name;
    }

    public void setRel_name(String rel_name) {
        this.rel_name = rel_name;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
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

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public int getAdded_by() {
        return added_by;
    }

    public void setAdded_by(int added_by) {
        this.added_by = added_by;
    }

}
