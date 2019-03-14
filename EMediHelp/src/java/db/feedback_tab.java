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
@Table(name = "feedback_tab")
public class feedback_tab {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int feed_id;

    @Column(name = "log_id")
    private int log_id;

    @Column(name = "doc_id")
    private int doc_id;

    @Column(name = "recomend")
    private int recomend;

    @Column(name = "problem")
    private String problem;

    @Column(name = "discription")
    private String description;

    @Column(name = "public_visible")
    private int public_visible;

    @Column(name = "ratting")
    private int rating;

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

    public feedback_tab() {
    }

    public feedback_tab(int _log_id, int _doc_id, int _recomend, String _problem, String _description, int _public_visible, int _rating, String _edited_on, int _added_by) {

        this.log_id = _log_id;
        this.doc_id = _doc_id;
        this.recomend = _recomend;
        this.problem = _problem;
        this.description = _description;
        this.public_visible = _public_visible;
        this.rating = _rating;
        this.is_active = 1;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = 0;
        this.added_by = _added_by;
    }

    public int getFeed_id() {
        return feed_id;
    }

    public void setFeed_id(int feed_id) {
        this.feed_id = feed_id;
    }

    public int getLog_id() {
        return log_id;
    }

    public void setLog_id(int log_id) {
        this.log_id = log_id;
    }

    public int getDoc_id() {
        return doc_id;
    }

    public void setDoc_id(int doc_id) {
        this.doc_id = doc_id;
    }

    public int getRecomend() {
        return recomend;
    }

    public void setRecomend(int recomend) {
        this.recomend = recomend;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPublic_visible() {
        return public_visible;
    }

    public void setPublic_visible(int public_visible) {
        this.public_visible = public_visible;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
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
