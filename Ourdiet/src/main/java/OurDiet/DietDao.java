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
	
	public void insert_info(int UID, Diet diet, String date) {
		try {
			jdbcTemplate.update(
				new PreparedStatementCreator() {
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						String sql = "INSERT into diet_info (User_id, Total_calrory, Total_tan, Total_dan, Total_ji, Info_date) values (?, ?, ?, ?, ?, ?)";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, UID);
						pstmt.setFloat(2, diet.getCalrory());
						pstmt.setFloat(3, diet.getTan());
						pstmt.setFloat(4, diet.getDan());
						pstmt.setFloat(5, diet.getJi());
						pstmt.setDate(6, java.sql.Date.valueOf(date));
						return pstmt;
					}
				});
		} catch (Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void update_info(int UID, Diet diet, String date) {
		try {
			jdbcTemplate.update(
				new PreparedStatementCreator() {
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						String sql = "UPDATE diet_info SET Total_calrory= Total_calrory + ?, Total_tan=Total_tan + ?, Total_dan = Total_dan + ?, Total_ji=Total_ji + ? WHERE User_id=? AND Info_date=?";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setFloat(1, diet.getCalrory());
						pstmt.setFloat(2, diet.getTan());
						pstmt.setFloat(3, diet.getDan());
						pstmt.setFloat(4, diet.getJi());
						pstmt.setInt(5, UID);
						pstmt.setDate(6, java.sql.Date.valueOf(date));
						return pstmt;
					}
				});
		} catch (Exception ex){
			ex.printStackTrace();
		}
	}
	
	public boolean info_check(int UID, String date) {
		String sql = "SELECT COUNT(*) FROM diet_info WHERE User_id = ? AND Info_date = ?";
	    Integer count = jdbcTemplate.queryForObject(sql, Integer.class, UID, java.sql.Date.valueOf(date));
	    if(count != null && count > 0) {
	    	return true;
	    } else {return false;}
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
	
	public void insert_W(int UID, float weight, String time) {
		try {
			jdbcTemplate.update(
					new PreparedStatementCreator() {
						public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
							String sql = "INSERT into diet_info (User_id, Today_weight, Info_date) values (?, ?, ?)";
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, UID);
							pstmt.setFloat(2, weight);
							pstmt.setDate(3, java.sql.Date.valueOf(time));
							return pstmt;
						}
					});
		} catch (Exception ex) {
			System.out.println("insert_W DB오류");
			ex.printStackTrace();
		}
	}
	
	public void update_W(int UID, float weight, String time) {
		try {
			jdbcTemplate.update(
				new PreparedStatementCreator() {
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						String sql = "UPDATE diet_info SET Today_weight=? WHERE User_id=? AND Info_date=?";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setFloat(1, weight);
						pstmt.setInt(2, UID);
						pstmt.setDate(3, java.sql.Date.valueOf(time));
						return pstmt;
					}
				});
		} catch (Exception ex){
			ex.printStackTrace();
		}
	}
	
	public Object[] return_W(int UID, LocalDate date) {
		List<Object[]> weights = jdbcTemplate.query(
				"SELECT u.WantedWeight, d.Today_weight"
				+ " FROM user u"
				+ " LEFT JOIN diet_info d ON u.User_id = d.User_id AND d.Info_date = ?"
				+ " WHERE u.User_id = ?",
				(ResultSet rs, int rowNum) -> new Object[]{
							rs.getFloat("WantedWeight"),
							rs.getFloat("Today_weight")
				},java.sql.Date.valueOf(date), UID);
			return weights.get(0);
	}
	
	public Object[] Recommend(int UID) {
		String sql = "SELECT Age, Tall, gender, ex FROM user WHERE User_id=?";
		List<Object[]> obj = jdbcTemplate.query(sql,
			(ResultSet rs, int rowNum) -> new Object[] {
					rs.getInt("Age"),
					rs.getFloat("Tall"),
					rs.getInt("gender"),
					rs.getFloat("ex")
			},UID);
		return obj.get(0);
	}
}
