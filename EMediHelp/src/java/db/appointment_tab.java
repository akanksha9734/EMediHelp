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
@Table(name = "appointment_tab")
public class appointment_tab {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int appoint_id;

    @Column(name = "log_id")
    private int log_id;

    @Column(name = "doc_id")
    private int doc_id;

    @Column(name = "date")
    private String date;

    @Column(name = "day")
    private String day;

    @Column(name = "time")
    private String time;

    @Column(name = "prescription")
    private String prescription;

    @Column(name = "cancel")
    private int cancel;

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

    public appointment_tab() {
    }

    public appointment_tab(int _log_id, int _doc_id, String _date, String _day, String _time, String _prescription, int _cancel, String _edited_on, int _added_by) {

        this.log_id = _log_id;
        this.doc_id = _doc_id;
        this.date = _date;
        this.day = _day;
        this.time = _time;
        this.prescription = _prescription;
        this.cancel = _cancel;
        this.is_active = 1;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = 0;
        this.added_by = _added_by;
    }

    public int getAppoint_id() {
        return appoint_id;
    }

    public void setAppoint_id(int appoint_id) {
        this.appoint_id = appoint_id;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public int getCancel() {
        return cancel;
    }

    public void setCancel(int cancel) {
        this.cancel = cancel;
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
