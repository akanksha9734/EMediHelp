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
@Table(name = "image")
public class image {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int img_id;

    @Column(name = "url")
    private String url;

    @Column(name = "img_name")
    private String img_name;

    @Column(name = "img_type_id")
    private int img_type_id;

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

    public image() {
    }

    public image(String _url, String _img_name, int _img_type_id, String _edited_on, int _added_by) {

        this.url = _url;
        this.img_name = _img_name;
        this.img_type_id = _img_type_id;
        this.is_active = true;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = false;
        this.added_by = _added_by;
    }

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getImg_name() {
        return img_name;
    }

    public void setImg_name(String img_name) {
        this.img_name = img_name;
    }

    public int getImg_type_id() {
        return img_type_id;
    }

    public void setImg_type_id(int img_type_id) {
        this.img_type_id = img_type_id;
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
