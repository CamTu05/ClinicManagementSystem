/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Doctor;
import Models.Schedules;
import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;
import java.util.Comparator;
import java.util.Vector;

public class SchedulesDAO {

    private String status = "ok";
    private Connection con;
    private Vector<Schedules> schedules;
    public static SchedulesDAO INSTANCE = new SchedulesDAO();

    public SchedulesDAO() {
        if (INSTANCE == null) {
            INSTANCE = this;
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public Vector<Schedules> getSchedules() {
        return schedules;
    }

    public void setSchedules(Vector<Schedules> schedules) {
        sortByStartTimeAndWeekday(schedules);
        this.schedules = schedules;
    }

    public void LoadSchedules() {
        String sql = "select * from Schedules ORDER BY start_time";
        schedules = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();             // can get by fi or by oder number 
            while (rs.next()) {
                Schedules s = new Schedules();
                s.setId(rs.getInt(1));
                int doctorId = rs.getInt("doctor_id");
                Doctor doctor = DoctorDAO.INSTANCE.getDoctorById(doctorId);                
                s.setDoctor(doctor);
                
                s.setWeekday(rs.getInt(3));
                s.setStartTime(rs.getTime(4));
                s.setEndTime(rs.getTime(5));


                schedules.add(s);
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }

    }


    public String getStatus() {

        return status;
    }
      public void sortByStartTimeAndWeekday(Vector<Schedules> list) {
        Collections.sort(list, new Comparator<Schedules>() {
            @Override
            public int compare(Schedules s1, Schedules s2) {
                int timeCompare = s1.getStartTime().compareTo(s2.getStartTime());
                if (timeCompare != 0) {
                    return timeCompare;
                } else {
                    return Integer.compare(s1.getWeekday(), s2.getWeekday());
                }
            }
        });
    }
      
    public String getFullNameById(int id) {
        for (User u : UserDAO.INSTANCE.getUser()) {
            if (u.getId() == id) {
                return u.getFullname();
            }
        }
        return "Unknown";
    }
    


}
class Using{
    public static void main(String[] args) {
        DoctorDAO.INSTANCE.LoadDoctor();
        int n= DoctorDAO.INSTANCE.getDoctor().size();
                
        System.out.println(n);
    }
}