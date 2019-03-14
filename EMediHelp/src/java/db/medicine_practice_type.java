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
@Table(name = "medicine_practice_type")
public class medicine_practice_type {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int medi_pract_id;

    @Column(name = "type")
    private String type;

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

    public medicine_practice_type() {
    }

    public medicine_practice_type(String _type, String _edited_on, int _added_by) {

        this.type = _type;
        this.is_active = 1;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = 0;
        this.added_by = _added_by;
    }

    public int getMedi_pract_id() {
        return medi_pract_id;
    }

    public void setMedi_pract_id(int medi_pract_id) {
        this.medi_pract_id = medi_pract_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public int getAdded_by() {
        return added_by;
    }

    public void setAdded_by(int added_by) {
        this.added_by = added_by;
    }

    
}
