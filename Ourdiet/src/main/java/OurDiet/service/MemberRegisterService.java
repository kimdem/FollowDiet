package OurDiet.service;

import OurDiet.dao.MemberDao;
import OurDiet.dto.LoginMember;
import OurDiet.dto.Member;
import OurDiet.dto.profile_edit;
import OurDiet.dto.profile_info;

public class MemberRegisterService {
	private MemberDao memberDao;
	public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void regist(Member _member) throws Exception {
		Member member = memberDao.IDcheck(_member.getID());
		if (member != null) {
			throw new Exception("DuplicateMemberException");
		}
		memberDao.insert(_member);
	}
	
	public boolean login(LoginMember members){
		boolean Loginok = memberDao.login(members.getLogin_ID(), members.getLogin_PWD());
		if(Loginok == true) {
			return true;
		} else {
			return false;
		}
	}
	public int outUID_S(String User_id) {
		return memberDao.outUID(User_id);
	}
	
	public int return_goal(int UID) {
		return memberDao.outGoal(UID);
	}
	
	public profile_info info(int UID) {
		profile_info data = memberDao.info(UID);
		return data;
	}
	
	public boolean checking_pwd(int UID, String pwd, String newpwd, String confirmpwd) {
		String User_pwd = memberDao.user_pwd(UID);
		if(pwd.equals(User_pwd) && newpwd.equals(confirmpwd)) {
			memberDao.edit_pwd(UID, newpwd);
			return true;
		} else {return false;}
	}
	
	public void profile_edit(int UID, profile_edit edit) {
		memberDao.edit(UID, edit);
	}
	
	public boolean id_valid(String ID) {
		String idreg = "^[a-zA-Z0-9]{4,16}$";
		if(!ID.matches(idreg)) {
			return false;
		} else {return true;}
	}
	
	public boolean pwd_valid(String pwd) {
		String pwdreg = "^(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%*?&+])[A-Za-z\\d!@#$%*?&+]{8,16}$";
		if(!pwd.matches(pwdreg)) {
			return false;
		} else {return true;}
	}
	
	public boolean confirm_pwd(String pwd, String confirmpwd) {
		if(pwd.equals(confirmpwd)) {
			return true;
		} else {return false;}
	}
}
