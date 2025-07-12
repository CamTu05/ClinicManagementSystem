package DAL;

import Models.*;
import java.sql.*;
import java.util.Vector;

public class DoctorDAO extends DBContext {

    private Vector<Doctor> doctors;
    private String status = "ok";
    private Connection con;

    public static DoctorDAO INSTANCE = new DoctorDAO();

    public DoctorDAO() {
        if (INSTANCE == null) {
            INSTANCE = this;
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Vector<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(Vector<Doctor> doctors) {
        this.doctors = doctors;
    }

    public String getDoctorNameById(int id) {
        String sql = "Select [fullname] From [dbo].[Users] where [user_id] = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("fullname");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Vector<Doctor> LoadDoctorsBySpecialty(int specialty_id) {
        String sql = "SELECT [doctor_id]\n"
                + "      ,[specialty_id]\n"
                + "      ,[years_experience]\n"
                + "      ,[description]\n"
                + "      ,[picture]\n"
                + "  FROM [dbo].[Doctors]\n"
                + "  WHERE specialty_id=?";
        doctors = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, specialty_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("");
                Doctor doc = new Doctor();
                doc.setId(rs.getInt("doctor_id"));
                doc.setSpecialty(SpecialtyDAO.INSTANCE.getSpecialtyById(specialty_id));
                doc.setYearsExp(rs.getInt("years_experience"));
                doc.setDescription(rs.getString("description"));
                doc.setPicture(rs.getString("picture"));
                doctors.add(doc);
            }
            return doctors;
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return null;
    }

    public Vector<Doctor> LoadAllDoctors() {
        String sql = "SELECT [doctor_id], [specialty_id], [years_experience], [description], [picture] FROM [dbo].[Doctors]";
        doctors = new Vector<>();
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Doctor doc = new Doctor();
                doc.setId(rs.getInt("doctor_id"));
                doc.setSpecialty(SpecialtyDAO.INSTANCE.getSpecialtyById(rs.getInt("specialty_id")));
                doc.setYearsExp(rs.getInt("years_experience"));
                doc.setDescription(rs.getString("description"));
                doc.setPicture(rs.getString("picture"));
                doctors.add(doc);
            }
            return doctors;
        } catch (SQLException e) {
            System.out.println("Error at reading Doctors: " + e.getMessage());
            status = "Error at reading Doctors: " + e.getMessage();
        }
        return new Vector<>();
    }

    public Doctor getDoctorById(int id, Vector<Doctor> doctors) {
        for (Doctor d : doctors) {
            if (d.getId() == id) {
                return d;
            }
        }
        return null;
    }

//    public List<DoctorInformation> getDoctorInformation() throws SQLException {
//        String sql = """
//            WITH DoctorSchedule AS (
//                SELECT s.doctor_id,
//                       CASE s.weekday
//                            WHEN 0 THEN N'Chủ nhật' WHEN 1 THEN N'Thứ 2'
//                            WHEN 2 THEN N'Thứ 3'    WHEN 3 THEN N'Thứ 4'
//                            WHEN 4 THEN N'Thứ 5'    WHEN 5 THEN N'Thứ 6'
//                            WHEN 6 THEN N'Thứ 7' END AS weekday_name,
//                       s.start_time, s.end_time
//                FROM Schedules s )
//            SELECT d.doctor_id, u.fullname, u.gender, u.dob, u.email,
//                   u.phone, u.address, sp.specialty_name,
//                   d.years_experience, d.[description], d.picture,
//                   STRING_AGG(
//                       FORMATMESSAGE(N'%s %s-%s',
//                                     ds.weekday_name,
//                                     FORMAT(ds.start_time, N'hh\\:mm'),
//                                     FORMAT(ds.end_time  , N'hh\\:mm')), N', ')
//                       WITHIN GROUP (ORDER BY ds.weekday_name) AS schedule,
//                   ROUND(AVG(f.rating*1.0),1) AS avg_rating
//            FROM Doctors d
//            JOIN Users u           ON u.user_id      = d.doctor_id
//            JOIN Specialties sp    ON sp.specialty_id = d.specialty_id
//            LEFT JOIN DoctorSchedule ds ON ds.doctor_id = d.doctor_id
//            LEFT JOIN Feedbacks f  ON f.doctor_id    = d.doctor_id
//            GROUP BY d.doctor_id, u.fullname, u.gender, u.dob, u.email,
//                     u.phone, u.address, sp.specialty_name,
//                     d.years_experience, d.[description], d.picture;
//            """;
//
//        List<DoctorInformation> result = new ArrayList<>();
//
//        try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
//
//            while (rs.next()) {
//                DoctorInformation info = new DoctorInformation();
//                info.setDoctorId(rs.getInt("doctor_id"));
//                info.setFullName(rs.getString("fullname"));
//                info.setGender(rs.getString("gender"));
//                info.setDob(rs.getDate("dob").toLocalDate());
//                info.setEmail(rs.getString("email"));
//                info.setPhone(rs.getString("phone"));
//                info.setAddress(rs.getString("address"));
//                info.setSpecialtyName(rs.getString("specialty_name"));
//                info.setYearsExperience(rs.getInt("years_experience"));
//                info.setDescription(rs.getString("description"));
//                info.setPicture(rs.getString("picture"));
//                info.setSchedule(rs.getString("schedule"));
//                info.setAvgRating(rs.getDouble("avg_rating"));
//
//                result.add(info);
//            }
//        }
//        return result;
//    }
//}

    public static void main(String[] args) {

    }
}
