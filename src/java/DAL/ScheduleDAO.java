package DAL;

import DAL.DBContext;
import Models.*;
import Models.Schedule;
import java.util.Vector;
import java.sql.Connection;
import java.sql.Time;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

public class ScheduleDAO extends DBContext {

    private Vector<Schedule> doctors;
    private String status = "ok";
    private Connection con;

    public static ScheduleDAO INSTANCE = new ScheduleDAO();

    public ScheduleDAO() {
        if (INSTANCE == null) {
            INSTANCE = this;
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public Vector<Schedule> loadScheduleByDoctorId(int doctorId) {
        Vector<Schedule> schedules = new Vector<>();

        String sql = """
        SELECT schedule_id, doctor_id, weekday, start_time, end_time
        FROM   Schedules
        WHERE  doctor_id = ?
        ORDER  BY weekday, start_time
    """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, doctorId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Schedule s = new Schedule();
                    s.setId(rs.getInt("schedule_id"));
                    Doctor d = DoctorDAO.INSTANCE.getDoctorById(Integer.parseInt(rs.getString("doctor_id")));
                    s.setDoctor(d);
                    s.setWeekday(rs.getInt("weekday"));
                    s.setStartTime(rs.getTime("start_time").toLocalTime());
                    s.setEndTime(rs.getTime("end_time").toLocalTime());

                    schedules.add(s);
                }
            }
        } catch (SQLException e) {
            // Bạn có thể log lỗi hoặc ném ngoại lệ tùy nhu cầu
            e.printStackTrace();
        }
        return schedules;
    }

    public Vector<Schedule> loadSchedules() {
        Vector<Schedule> schedules = new Vector<>();
        Map<Integer, Doctor> doctorCache = new HashMap<>();

        String sql = """
        SELECT schedule_id, doctor_id, weekday, start_time, end_time
        FROM   Schedules
        ORDER  BY doctor_id, weekday, start_time
    """;

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");

                // --- Lấy Doctor từ cache hoặc DB ---
                Doctor d = doctorCache.get(doctorId);
                if (d == null) {
                    // Gọi đúng hàm tiện ích bạn đang dùng
                    d = DoctorDAO.INSTANCE.getDoctorById(doctorId);
                    doctorCache.put(doctorId, d);
                }

                // --- Tạo Schedule ---
                Schedule s = new Schedule();
                s.setId(rs.getInt("schedule_id"));
                s.setDoctor(d);
                s.setWeekday(rs.getInt("weekday"));
                s.setStartTime(rs.getTime("start_time").toLocalTime());
                s.setEndTime(rs.getTime("end_time").toLocalTime());

                schedules.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();  // production: log bằng Logger
        }

        return schedules;
    }

    public Vector<Schedule> loadSchedulesByWeekday(int weekday) {
        Vector<Schedule> schedules = new Vector<>();
        Map<Integer, Doctor> cacheDoc = new HashMap<>();   // cache tạm
        String sql = """
        SELECT schedule_id, doctor_id, weekday, start_time, end_time
        FROM   Schedules
        WHERE  weekday = ?
        ORDER  BY start_time, doctor_id
    """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, weekday);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int docId = rs.getInt("doctor_id");

                    Doctor doc = cacheDoc.computeIfAbsent(docId, id
                            -> DoctorDAO.INSTANCE.getDoctorById(id)
                    );

                    // --- Tạo Schedule ---
                    Schedule sch = new Schedule();
                    sch.setId(rs.getInt("schedule_id"));
                    sch.setDoctor(doc);
                    sch.setWeekday(rs.getInt("weekday"));
                    sch.setStartTime(rs.getTime("start_time").toLocalTime());
                    sch.setEndTime(rs.getTime("end_time").toLocalTime());

                    schedules.add(sch);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }

    public boolean addSchedule(int doctorId,
            int weekday, // 0 = CN … 6 = Thứ 7
            LocalTime startTime, // 08:00
            LocalTime endTime) {  // 12:00
        String dupCheckSql = """
        SELECT 1 FROM Schedules
        WHERE doctor_id = ? AND weekday = ? AND start_time = ? AND end_time = ?
    """;

        String insertSql = """
        INSERT INTO Schedules(doctor_id, weekday, start_time, end_time)
        VALUES (?, ?, ?, ?)
    """;

        try (PreparedStatement dup = con.prepareStatement(dupCheckSql)) {
            dup.setInt(1, doctorId);
            dup.setInt(2, weekday);
            dup.setTime(3, Time.valueOf(startTime));
            dup.setTime(4, Time.valueOf(endTime));
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        try (PreparedStatement ps = con.prepareStatement(insertSql)) {
            ps.setInt(1, doctorId);
            ps.setInt(2, weekday);
            ps.setTime(3, Time.valueOf(startTime));
            ps.setTime(4, Time.valueOf(endTime));

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteScheduleById(int scheduleId) {

        String sql = "DELETE FROM Schedules WHERE schedule_id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, scheduleId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateSchedule(int scheduleId,
            int weekday,
            LocalTime startTime,
            LocalTime endTime) {

        String sql = """
        UPDATE Schedules
        SET    weekday    = ?,
               start_time = ?,
               end_time   = ?
        WHERE  schedule_id = ?
    """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, weekday);
            ps.setTime(2, java.sql.Time.valueOf(startTime));
            ps.setTime(3, java.sql.Time.valueOf(endTime));
            ps.setInt(4, scheduleId);

            int rows = ps.executeUpdate();     
            return rows > 0;           

        } catch (SQLException e) {
            e.printStackTrace();      
            return false;
        }
    }

    public static void main(String[] args) {
        Vector<Schedule> schedules = ScheduleDAO.INSTANCE.loadScheduleByDoctorId(21);
        for (Schedule s : schedules) {
            System.out.println(s.toString());
        }
        System.out.println("....................");
     //   ScheduleDAO.INSTANCE.addSchedule(21, 4, LocalTime.of(13, 0), LocalTime.of(17, 0));
     //   ScheduleDAO.INSTANCE.deleteScheduleById(28);

        schedules = ScheduleDAO.INSTANCE.loadScheduleByDoctorId(21);
        for (Schedule s : schedules) {
            System.out.println(s.toString());
        }
    }

}
