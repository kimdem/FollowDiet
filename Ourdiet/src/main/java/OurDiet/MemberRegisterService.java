package OurDiet;
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
}
