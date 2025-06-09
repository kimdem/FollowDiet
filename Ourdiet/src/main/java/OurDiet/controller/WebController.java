package OurDiet.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import OurDiet.dto.LoginMember;
import OurDiet.dto.Member;
import OurDiet.dto.profile_edit;
import OurDiet.dto.profile_info;
import OurDiet.service.MemberRegisterService;
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
	@GetMapping("/errorpage")
	public String errorpage() {return "errorpage";}
	
	@PostMapping("/registercomplete")
	public String registercomplete(@RequestParam(value="ConfirmPwd", required=true) String ConfirmPwd, Member _member, RedirectAttributes red) {
		try {
			if(!memberRegisterService.id_valid(_member.getID())) {
				red.addFlashAttribute("id_valid", "ID는 영문과 숫자를 조합한 4-16자내로 작성하십시오");
				return "redirect:/register";
			}
			if(!memberRegisterService.pwd_valid(_member.getPWD())) {
				red.addFlashAttribute("pwd_valid", "비밀번호는 특수기호 [!@#$%*?&+]를 포함한 영문, 숫자를 조합한 8-16자 이내로 작성하시오");
				return "redirect:/register";
			}
			if(!memberRegisterService.confirm_pwd(_member.getPWD(), ConfirmPwd)) {
				red.addFlashAttribute("confirmpwd", "비밀번호가 일치하지 않습니다.");
				return "redirect:/register";
			}
			memberRegisterService.regist(_member);
			return "./ ";
		} catch (Exception ex) {
			red.addFlashAttribute("IDX", "이미 사용중인 아이디입니다.");
			return "redirect:/register";
		}
	}
	
	@PostMapping("/mainpage")
	public String mainpage(LoginMember members, HttpSession session, Model model) {
		try {
			if(memberRegisterService.login(members)) {
				session.setAttribute("UID", memberRegisterService.outUID_S(members.getLogin_ID()));
				int UID = (Integer)session.getAttribute("UID");
				session.setAttribute("goal", memberRegisterService.return_goal(UID));
				return "redirect:/mainpage";
			} else {
				model.addAttribute("failedLogin", "아이디 또는 비밀번호가 틀렸습니다.");
				return "Login";
			}
		} catch (Exception ex) {
			return "redirect:/errorpage";
		}
	}
	
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		Integer UID = (Integer)session.getAttribute("UID");
		if(UID == null) {return "redirect:/Login";}
		try {
			profile_info data = memberRegisterService.info(UID);
			if(data.getGender() == 0) {model.addAttribute("gender", "남성");}
			else {model.addAttribute("gender", "여성");}
			model.addAttribute("info", data);
			return "profile";
		} catch (Exception ex) {
			return "redirect:/errorpage";
		}
	}
	
	@PostMapping("/edit_pwd")
	public String edit_pwd(@RequestParam(value="pwd", required = true) String pwd, @RequestParam(value="newpwd", required=true) String newpwd, @RequestParam(value="confirmpwd", required=true) String confirmpwd, HttpSession session, RedirectAttributes red) {
		Integer UID = (Integer)session.getAttribute("UID");
		if(UID == null) {return "redirect:/Login";}
		try {
			if(!memberRegisterService.pwd_valid(newpwd)) {
				red.addFlashAttribute("pwd", "비밀번호는 특수기호 [!@#$%*?&+]를 포함한 영문, 숫자를 조합한 8-16자 이내로 작성하시오");
				return "redirect:/profile";
			}
			if(memberRegisterService.checking_pwd(UID, pwd, newpwd, confirmpwd)) {
				red.addFlashAttribute("pwd", "비밀번호가 수정되었습니다.");
				return "redirect:/profile";
			} else {
				red.addFlashAttribute("pwd", "입력값이 잘못되었습니다.");
				return "redirect:/profile";
			}
		} catch (Exception ex) {
			return "redirect:/errorpage";
		}
	}
	
	@PostMapping("profile_edit")
	public String profile_edit(HttpSession session, RedirectAttributes red, profile_edit edit) {
		Integer UID = (Integer)session.getAttribute("UID");
		if(UID == null) {return "redirect:/Login";}
		try {
			memberRegisterService.profile_edit(UID, edit);
		} catch (Exception ex){
			return "redirect:/errorpage";
		}
		red.addFlashAttribute("edit_complete", "수정이 완료되었습니다.");
		return "redirect:/profile";
	}
}
