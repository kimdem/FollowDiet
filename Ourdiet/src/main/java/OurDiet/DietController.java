package OurDiet;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
@Controller
public class DietController {
	@Autowired
	public DietService dietservice;
	@Autowired
	public MemberDao memberdao;
	
	@PostMapping("insertdiet")
	public String insetdiet(@RequestParam("date") String date, Diet diet, HttpSession session, Model model) {
		int UID = (Integer)session.getAttribute("UID");
		try {
			dietservice.insetdiet(diet, session, date);
			dietservice.info_insert(UID, diet, date);
			return "redirect:/mainpage";
		} catch (Exception ex) {
			System.out.println("에러");
			System.out.println(ex);
			return "redirect:/mainpage";
		}
	}
	@GetMapping("/mainpage")
	public String mainpageGet(@RequestParam(value="year", required = false) Integer year, @RequestParam(value="month", required=false) Integer month,  @RequestParam(value="day", required=false) Integer day,HttpSession session, Model model) {
		LocalDate today = LocalDate.now();
		int selectedyear = (year != null) ? year : today.getYear();
	    int selectedmonth = (month != null) ? month : today.getMonthValue();
	    int selectedday = (day != null) ? day : today.getDayOfMonth();
	    LocalDate selectedDate = LocalDate.of(selectedyear, selectedmonth, selectedday);
	    
		Integer UID = (Integer)session.getAttribute("UID");
		Integer goal = (Integer)session.getAttribute("goal");
		if(UID == null) {return "Login";}
		dietlist _dietlist = dietservice._dietlist(UID, selectedDate);
		Object[] weights = dietservice.print_W(UID, selectedDate, goal);
		double[] recommend = dietservice.Recommend(UID, goal, selectedDate);
		model.addAttribute("recommend", recommend);
		model.addAttribute("dietlist", _dietlist);
		model.addAttribute("weights", weights);
		return "mainpage";
	}
	
	@PostMapping("insertW")
	public String insetW(@RequestParam("weight") float weight, @RequestParam("time") String time, HttpSession session) {
		int UID = (Integer)session.getAttribute("UID");
		try {
			dietservice.weight_insert(UID, weight, time);
			return "redirect:/mainpage";
		} catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/mainpage";
		}
	}
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}
	
}
