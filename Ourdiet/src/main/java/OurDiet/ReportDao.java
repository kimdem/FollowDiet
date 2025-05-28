package OurDiet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import jakarta.servlet.http.HttpSession;
public class ReportDao {
	private JdbcTemplate jdbcTemplate;
	public ReportDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public float[] TotalSUM(int UID, String date) {
		String sql = "SELECT Total_calrory, Total_tan, Total_dan, Total_ji FROM diet_info WHERE User_id=? AND Info_date=?";
		 return jdbcTemplate.query(sql, rs-> {
			if(rs.next()) {
				return new float[] {
					rs.getFloat("Total_calrory"),
					rs.getFloat("Total_tan"),
					rs.getFloat("Total_dan"),
					rs.getFloat("Total_ji")
				};
			} else {
				return new float[] {0, 0, 0, 0};
			}
		 }, UID, date);
	}
}
