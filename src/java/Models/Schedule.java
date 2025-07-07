/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.time.LocalTime;

/**
 *
 * @author admin
 */
public class Schedule {
    private int id;
    private Doctor doctor;
    private int weekday;
    private LocalTime startTime;
    private LocalTime endTime;

    public Schedule() {
    }

    public Schedule(int id, Doctor doctor, int weekday, LocalTime startTime, LocalTime endTime) {
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

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Schedule{" + "id=" + id + ", doctor=" + doctor + ", weekday=" + weekday + ", startTime=" + startTime + ", endTime=" + endTime + '}';
    }

}
