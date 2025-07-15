package Models;
import java.sql.Time;

public class Schedules {
    private int id;
    private Doctor doctor;
    private int weekday;
    private Time startTime;
    private Time endTime;
    
    public Schedules() {
    }

    
    public Schedules(int id, Doctor doctor, int weekday, Time startTime, Time endTime) {
        this.id = id;
        this.doctor = doctor;
        this.weekday = weekday;
        this.startTime = startTime;
        this.endTime = endTime;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public int getWeekday() {
        return weekday;
    }

    public void setWeekday(int weekday) {
        this.weekday = weekday;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }



}