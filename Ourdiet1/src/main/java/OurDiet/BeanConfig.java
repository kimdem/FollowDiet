package OurDiet;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
@Configuration
public class BeanConfig {
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
	DataSource ds = new DataSource();
	ds.setDriverClassName("com.mysql.jdbc.Driver");
	ds.setUrl("jdbc:mysql://localhost/ourdiet?characterEncoding=utf8&serverTimezone=UTC");
	ds.setUsername("root");
	ds.setPassword("4785");
	ds.setInitialSize(2);
	ds.setMaxActive(10);
	ds.setTestWhileIdle(true);
	ds.setMinEvictableIdleTimeMillis(60000 * 3);
	ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
	return ds;
	}
	@Bean
	public MemberDao memberDao() {
	return new MemberDao(dataSource());
	}
	@Bean
	public MemberRegisterService memberRegSvc() {
	return new MemberRegisterService(memberDao());
	}
	@Bean
	public DietDao dietdao() {
		return new DietDao(dataSource());
	}
	@Bean
	public DietService dietservice() {
		return new DietService(dietdao());
	}
}
