/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Models.TempModels;
import java.sql.Date;


public class FeedbackInfor {
    private String patient_name;
    private String initial;
    private Date feedback_date;
    private String comment;

    public FeedbackInfor() {
    }

    public FeedbackInfor(String patient_name, String initial, Date feedback_date, String comment) {
        this.patient_name = patient_name;
        this.initial = initial;
        this.feedback_date = feedback_date;
        this.comment = comment;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public void setInitial(String initial) {
        this.initial = initial;
    }

    public void setFeedback_date(Date feedback_date) {
        this.feedback_date = feedback_date;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "FeedbackInfor{" + "patient_name=" + patient_name + ", initial=" + initial + ", feedback_date=" + feedback_date + ", comment=" + comment + '}';
    }

    public String getPatient_name() {
        return patient_name;
    }

    public String getInitial() {
        return initial;
    }

    public Date getFeedback_date() {
        return feedback_date;
    }

    public String getComment() {
        return comment;
    }
    
    
    
}
