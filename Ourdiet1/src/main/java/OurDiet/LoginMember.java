package OurDiet;

public class LoginMember {
	private String Login_ID;
	private String Login_PWD;
	
	public LoginMember(String Login_ID, String Login_PWD) {
		this.Login_ID = Login_ID;
		this.Login_PWD = Login_PWD;
	}

	public String getLogin_ID() {
		return Login_ID;
	}

	public void setLogin_ID(String login_ID) {
		Login_ID = login_ID;
	}

	public String getLogin_PWD() {
		return Login_PWD;
	}

	public void setLogin_PWD(String login_PWD) {
		Login_PWD = login_PWD;
	}
	
	
}
