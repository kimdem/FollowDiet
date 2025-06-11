package OurDiet.controller;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import OurDiet.dao.UserDao;
import OurDiet.dto.Diet;
import OurDiet.dto.Diet_fix_data;
import OurDiet.dto.dietlist;
import OurDiet.dto.food_fix;
import OurDiet.service.DietService;
import jakarta.servlet.http.HttpSession;
@Controller
public class DietController {
	@Autowired
	public DietService dietservice;
	@Autowired
	public UserDao memberdao;
	
	@PostMapping("insertdiet")
	public String insetdiet(@RequestParam("date") String date, Diet diet, HttpSession session, RedirectAttributes red) {
		Integer UID = (Integer)session.getAttribute("UID");
		if(UID == null) {return "redirect:/Login";}
		try {
			if((diet.getFood()).length() > 100) {
				red.addFlashAttribute("too_long_name", "음식의 이름이 너무 깁니다.");
				return "redirect:/mainpage";
			}
			dietservice.insetdiet(diet, UID, date);
			dietservice.info_insert(UID, diet, date);
			return "redirect:/mainpage";
		} catch (Exception ex) {
			System.out.println("에러 : " + ex);
			return "redirect:/errorpage";
		}
	}
	
	@GetMapping("/mainpage")
	public String mainpageGet(@RequestParam(value="date", required=false) String date, HttpSession session, Model model) {
	    LocalDate selectedDate;
	    if(date != null) {
	    	selectedDate = LocalDate.parse(date);
	    } else {
	    	selectedDate = LocalDate.now();
	    }
	    
		Integer UID = (Integer)session.getAttribute("UID");
		Integer goal = (Integer)session.getAttribute("goal");
		if(UID == null) {return "redirect:/Login";}
		try {
			dietlist _dietlist = dietservice._dietlist(UID, selectedDate);
			Object[] weights = dietservice.print_W(UID, selectedDate, goal);
			double[] recommend = dietservice.Recommend(UID, goal, selectedDate);
			model.addAttribute("recommend", recommend);
			model.addAttribute("dietlist", _dietlist);
			model.addAttribute("weights", weights);
			return "mainpage";
		} catch (Exception ex) {
			return "redirect:/errorpage";
		}
	}
	
	@GetMapping("food_edit")
	public String food_edit(@RequestParam(value="diet_id", required=true) int diet_id, HttpSession session, Model model) {
		Integer UID = (Integer)session.getAttribute("UID");
		if(UID == null) {return "redirect:/Login";}
		try {
			food_fix diet = dietservice.food_edit(diet_id);
			model.addAttribute("diet_id", diet_id);
			model.addAttribute("diet", diet);
			return "food_edit";
		} catch (Exception ex) {
			return "redirect:/errorpage";
		}
	}
	
	@PostMapping("food_fix")
	public String food_fix(Diet_fix_data diet, Model model) {
		try {
			dietservice.food_update(diet);
			return "redirect:/mainpage";
		} catch (Exception ex) {
			return "redirect:/errorpage";
		}
	}
	
	@PostMapping("insertW")
	public String insetW(@RequestParam("weight") float weight, @RequestParam("time") String time, HttpSession session) {
		Integer UID = (Integer)session.getAttribute("UID");
		if(UID == null) {return "redirect:/Login";}
		try {
			dietservice.weight_insert(UID, weight, time);
			return "redirect:/mainpage";
		} catch(Exception ex) {
			return "redirect:/errorpage";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}
	
}
