package OurDiet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReportController {
	@Autowired
	public ReportService reportservice;
	@Autowired
	public MemberDao memberdao;
	
	
	@GetMapping("report")
	public String report(HttpSession session, @RequestParam(value="date", required=false) String date, Model model) {
		LocalDate date1 = (date != null) ? LocalDate.parse(date) : LocalDate.now();
		Integer UID = (Integer)session.getAttribute("UID");
		if(UID == null) {return "redirect:/Login";}
		LocalDate jspdate = reportservice.getM(date1);
		float[] total = reportservice.totalsum(UID, jspdate);
		List<LocalDate> M_list = reportservice.getMS();
		float[][] week_info = reportservice.return_week_info(UID, jspdate); 
		float W = reportservice.return_wanted_weight(UID);
		model.addAttribute("wanted_weight", W);
		model.addAttribute("goal", (Integer)session.getAttribute("goal"));
		model.addAttribute("total", total);
		model.addAttribute("jspdate",jspdate);
		model.addAttribute("M_list", M_list);
		model.addAttribute("week_info", week_info);
		return "report";
	}
}
