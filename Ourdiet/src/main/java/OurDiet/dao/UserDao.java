package OurDiet.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import OurDiet.dto.LoginMember;
import OurDiet.dto.Member;
import OurDiet.dto.profile_edit;
import OurDiet.dto.profile_info;

public class UserDao {
	private JdbcTemplate jdbcTemplate;
	public UserDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public Member IDcheck(String ID) {
		List<Member> results = jdbcTemplate.query(
			"SELECT * FROM user WHERE ID=?",
			(ResultSet rs, int rowNum) -> {
				Member member = new Member(
						rs.getString("ID"), 
						rs.getString("PWD"), 
						rs.getInt("Age"), 
						rs.getFloat("Tall"),
						rs.getFloat("Weight"),
						rs.getFloat("WantedWeight"),
						rs.getInt("gender"),
						rs.getFloat("ex")
						);
				return member;
			},ID);
		return results.isEmpty() ? null : results.get(0);
	}
	
	public void insert(Member member) {
		jdbcTemplate.update(
				new PreparedStatementCreator() {
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					String sql = "insert into user (ID, PWD, Age, Tall, Weight, WantedWeight, goal, gender, ex) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
					int goal = 1;
					if(member.getWeight() > member.getWantedWeight()) {
						goal = 0;
					}
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, member.getID());
					pstmt.setString(2, member.getPWD());
					pstmt.setInt(3, member.getAge());
					pstmt.setFloat(4, member.getTall());
					pstmt.setFloat(5, member.getWeight());
					pstmt.setFloat(6, member.getWantedWeight());
					pstmt.setInt(7, goal);
					pstmt.setInt(8, member.getGender());
					pstmt.setFloat(9, member.getEx());
					return pstmt;
				}
			});
	}
	
	public boolean login(String ID, String PWD) {
		List<LoginMember> results = jdbcTemplate.query(
				"SELECT * FROM user WHERE ID=?",
				(ResultSet rs, int rowNum) -> {
					LoginMember member = new LoginMember(
							rs.getString("ID"), 
							rs.getString("PWD")
							);
					return member;
				},ID);
		if(results.isEmpty()) {
			return false;
		}
		LoginMember member1 = results.get(0);
		return member1.getLogin_PWD().equals(PWD);
	}
	
	public int outUID(String User_id) {
		String sql = "SELECT User_id FROM user WHERE ID = ?";
	    return jdbcTemplate.queryForObject(sql, Integer.class, User_id);
	}
	
	public int outGoal(int UID) {
		String sql = "SELECT goal FROM user WHERE User_id=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, UID);
	}
	
	public profile_info info(int UID) {
		String sql = "SELECT ID, Age, Tall, Weight, WantedWeight, gender FROM user WHERE User_id=?";
		List<profile_info> info = jdbcTemplate.query(sql,
			(ResultSet rs, int rowNum) -> {
				profile_info list = new profile_info(
						rs.getString("ID"),
						rs.getInt("Age"),
						rs.getFloat("Tall"),
						rs.getFloat("Weight"),
						rs.getFloat("WantedWeight"),
						rs.getInt("gender")
				);
				return list;
			}, UID);
		profile_info result = info.get(0);
		return result;
	}
	
	public void edit(int UID, profile_edit edit) {
		String sql = "UPDATE user SET Age=?, Tall=?, Weight=?, WantedWeight=?, ex=? WHERE User_id=?";
		jdbcTemplate.update(sql, edit.getAge(), edit.getTall(), edit.getWeight(), edit.getWantedweight(), edit.getEx(), UID);
	}
	
	
	public String user_pwd(int UID) {
		String sql = "SELECT PWD FROM user WHERE User_id =?";
		return jdbcTemplate.queryForObject(sql, String.class, UID);
	}
	
	public void edit_pwd(int UID, String pwd) {
		String sql = "UPDATE user SET PWD=? WHERE User_id=?";
		jdbcTemplate.update(sql, pwd, UID);
	}
	
}
