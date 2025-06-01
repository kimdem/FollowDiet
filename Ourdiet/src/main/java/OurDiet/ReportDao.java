package OurDiet;
import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
public class ReportDao {
	private JdbcTemplate jdbcTemplate;
	public ReportDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public float[] Total_list(int UID, LocalDate date) {
		String sql = "SELECT Total_calrory, Total_tan, Total_dan, Total_ji, Today_weight FROM diet_info WHERE User_id=? AND Info_date=?";
		 return jdbcTemplate.query(sql, rs-> {
			if(rs.next()) {
				return new float[] {
					rs.getFloat("Total_calrory"),
					rs.getFloat("Total_tan"),
					rs.getFloat("Total_dan"),
					rs.getFloat("Total_ji"),
					rs.getFloat("Today_weight")
				};
			} else {return new float[] {0, 0, 0, 0, 0};}
		 }, UID, date);
	}
	
	public float return_wanted_weight(int UID) {
		String sql = "SELECT WantedWeight FROM user WHERE User_id=?";
		float W = jdbcTemplate.queryForObject(sql, Float.class, UID);
		return W;
	}
	
}
