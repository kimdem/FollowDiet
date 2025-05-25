package OurDiet;
import java.time.LocalDate;

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
	@GetMapping("setdiet")
	public String setdiet(@RequestParam("level") String level, @RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day, Model model) {
		LocalDate selectedDate = LocalDate.of(year, month, day);
		model.addAttribute("selectedDate", selectedDate.toString());
		model.addAttribute("level", level);
		return "setdiet";
	}
	@PostMapping("insertdiet")
	public String insetdiet(@RequestParam("date") String date, Diet diet, HttpSession session, Model model) {
		try {
			dietservice.insetdiet(diet, session, date);
			return "redirect:/mainpage";
		} catch (Exception ex) {
			System.out.println("에러");
			System.out.println(ex);
			model.addAttribute("insetdiet_err", "오류발생");
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
		if(UID == null) {return "Login";}
		dietlist _dietlist = dietservice._dietlist(UID, selectedDate);
		model.addAttribute("dietlist", _dietlist);
		return "mainpage";
	}
}
