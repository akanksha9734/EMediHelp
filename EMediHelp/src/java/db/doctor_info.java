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
@Table(name = "doctor_info")
public class doctor_info {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int doc_id;

    @Column(name = "img_id")
    private int img_id;

    @Column(name = "log_id")
    private int log_id;

    @Column(name = "specialization_id")
    private int specialization_id;

    @Column(name = "medi_pract_id")
    private int medi_pract_id;

    @Column(name = "gender")
    private int gender;

    @Column(name = "experience")
    private String experience;

    @Column(name = "verified_guaranteed")
    private int verified_guaranteed;

    @Column(name = "discription")
    private String description;

    @Column(name = "base_fee")
    private int base_fee;

    @Column(name = "ratting")
    private int ratting;

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

    public doctor_info() {
    }

    public doctor_info(int _img_id, int _log_id, int _specialization_id, int _medi_pract_id, int _gender, String _experience, int _verified_guaranteed, String _description, int _base_Fee, int _rating, String _edited_on, int _added_by) {

        this.img_id = _img_id;
        this.log_id = _log_id;
        this.specialization_id = _specialization_id;
        this.medi_pract_id = _medi_pract_id;
        this.gender = _gender;
        this.experience = _experience;
        this.verified_guaranteed = _verified_guaranteed;
        this.description = _description;
        this.base_fee = _base_Fee;
        this.base_fee = _base_Fee;
        this.ratting = _rating;
        this.is_active = 1;
        this.added_on = (new Date()).toString();
        this.edited_on = (_edited_on.equals("no")) ? "no" : _edited_on;
        this.deleted = 0;
        this.added_by = _added_by;
    }

    public int getDoc_id() {
        return doc_id;
    }

    public void setDoc_id(int doc_id) {
        this.doc_id = doc_id;
    }

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public int getLog_id() {
        return log_id;
    }

    public void setLog_id(int log_id) {
        this.log_id = log_id;
    }

    public int getSpecialization_id() {
        return specialization_id;
    }

    public void setSpecialization_id(int specialization_id) {
        this.specialization_id = specialization_id;
    }

    public int getMedi_pract_id() {
        return medi_pract_id;
    }

    public void setMedi_pract_id(int medi_pract_id) {
        this.medi_pract_id = medi_pract_id;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public int getVerified_guaranteed() {
        return verified_guaranteed;
    }

    public void setVerified_guaranteed(int verified_guaranteed) {
        this.verified_guaranteed = verified_guaranteed;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getBase_fee() {
        return base_fee;
    }

    public void setBase_fee(int base_fee) {
        this.base_fee = base_fee;
    }

    public int getRatting() {
        return ratting;
    }

    public void setRatting(int ratting) {
        this.ratting = ratting;
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
