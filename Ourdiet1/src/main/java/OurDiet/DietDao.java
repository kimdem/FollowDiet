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
public class DietDao {
	private JdbcTemplate jdbcTemplate;
	public DietDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public void insert(Diet diet, HttpSession session, String date) {
		Integer UID = (Integer)session.getAttribute("UID");
		try {
			jdbcTemplate.update(
					new PreparedStatementCreator() {
						public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
							String sql = "insert into diet (User_id, level, Food, Calrory, Tan, dan, ji, Diet_date) values (?, ?, ?, ?, ?, ?, ?, ?)";
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, UID);
							pstmt.setInt(2, diet.getLevel());
							pstmt.setString(3, diet.getFood());
							pstmt.setFloat(4, diet.getCalrory());
							pstmt.setFloat(5, diet.getTan());
							pstmt.setFloat(6, diet.getDan());
							pstmt.setFloat(7, diet.getJi());
							pstmt.setDate(8, java.sql.Date.valueOf(date));
							return pstmt;
						}
					});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public List<Diet> todaydiet(int User_id, LocalDate date) {
			List<Diet> results = jdbcTemplate.query(
				"SELECT * FROM diet WHERE User_id=? AND Diet_date=?",
				(ResultSet rs, int rowNum) -> {
					Diet diet = new Diet(
							rs.getInt("level"), 
							rs.getString("Food"), 
							rs.getFloat("Calrory"),
							rs.getFloat("Tan"),
							rs.getFloat("dan"),
							rs.getFloat("ji")
							);
					return diet;
				},User_id, java.sql.Date.valueOf(date));
			return results;
	}
	
	
}
