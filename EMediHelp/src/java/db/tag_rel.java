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
@Table(name = "tag_rel")
public class tag_rel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int tag_rel_id;

    @Column(name = "rel_id")
    private int rel_id;

    @Column(name = "rel_type_id")
    private int rel_type_id;

    @Column(name = "tag_id")
    private int tag_id;

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

    public tag_rel() {
    }

    public tag_rel(int _rel_id, int _rel_type_id, int _tag_id, String _edited_on, int _added_by) {

        this.rel_id = _rel_id;
        this.rel_type_id = _rel_type_id;
        this.tag_id = _tag_id;
        this.is_active = true;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = false;
        this.added_by = _added_by;
    }

    public int getTag_rel_id() {
        return tag_rel_id;
    }

    public void setTag_rel_id(int tag_rel_id) {
        this.tag_rel_id = tag_rel_id;
    }

    public int getRel_id() {
        return rel_id;
    }

    public void setRel_id(int rel_id) {
        this.rel_id = rel_id;
    }

    public int getRel_type_id() {
        return rel_type_id;
    }

    public void setRel_type_id(int rel_type_id) {
        this.rel_type_id = rel_type_id;
    }

    public int getTag_id() {
        return tag_id;
    }

    public void setTag_id(int tag_id) {
        this.tag_id = tag_id;
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
