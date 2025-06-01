package OurDiet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
@Controller
public class WebController {
	@Autowired
	private MemberRegisterService memberRegisterService;
	@RequestMapping( {"/", "/main"} )
	public String main() { return "Welcomepage"; }
	@GetMapping("/Login")
	public String Login() {return "Login";}
	@GetMapping("/register")
	public String register() {return "register";}
	@PostMapping("/registercomplete")
	public String registercomplete(Member _member, Model model) {
		try {
			memberRegisterService.regist(_member);
			return "./registercomplete";
		} catch (Exception ex) {
			model.addAttribute("IDX", "이미 사용중인 아이디입니다.");
			return "./register";
		}
	}
	@PostMapping("/mainpage")
	public String mainpage(LoginMember members, HttpSession session, Model model) {
		boolean ok = memberRegisterService.login(members);
		if(ok == true) {
			session.setAttribute("UID", memberRegisterService.outUID_S(members.getLogin_ID()));
			int UID = (Integer)session.getAttribute("UID");
			session.setAttribute("goal", memberRegisterService.return_goal(UID));
			return "redirect:/mainpage";
		} else {
			model.addAttribute("failedLogin", "아이디 또는 비밀번호가 틀렸습니다.");
			return "Login";
		}
	}
	
}
