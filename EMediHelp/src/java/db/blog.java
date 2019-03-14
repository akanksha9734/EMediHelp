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
@Table(name = "blog")
public class blog {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int bl_id;

    @Column(name = "img_id")
    private int img_id;

    @Column(name = "heading")
    private String heading;

    @Column(name = "detail")
    private String detail;

    @Column(name = "like_count")
    private int like_count;

    @Column(name = "views")
    private int views;

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

    public blog() {
    }

    public blog(int _img_id, String _heading, String _detail, int _like_count, int _views, String _edited_on, int _added_by) {
        this.img_id = _img_id;
        this.heading = _heading;
        this.detail = _detail;
        this.like_count = _like_count;
        this.views = _views;
        this.is_active = 1;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = 0;
        this.added_by = _added_by;
    }

    public int getBl_id() {
        return bl_id;
    }

    public void setBl_id(int bl_id) {
        this.bl_id = bl_id;
    }

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getLike_count() {
        return like_count;
    }

    public void setLike_count(int like_count) {
        this.like_count = like_count;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
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
