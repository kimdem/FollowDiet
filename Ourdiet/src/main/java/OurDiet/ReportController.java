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
public class ReportController {
	@Autowired
	public ReportService reportservice;
	@Autowired
	public MemberDao memberdao;
	
	@GetMapping("report")
	public String report() {
		
		return "report";
	}
}
