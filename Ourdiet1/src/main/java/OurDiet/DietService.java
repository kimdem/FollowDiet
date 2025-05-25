package OurDiet;
import java.util.ArrayList;
import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpSession;

public class DietService {
	private DietDao dietdao;
	public DietService(DietDao dietdao) {
		this.dietdao = dietdao;
	}
	
	public void insetdiet(Diet diet, HttpSession session, String date) {
		dietdao.insert(diet, session, date);
	}
	
	public dietlist _dietlist(int User_id, LocalDate date) {
		List<Diet> todaylist = dietdao.todaydiet(User_id, date);
		List<Diet> breakfastList = new ArrayList<>();
	    List<Diet> lunchList = new ArrayList<>();
	    List<Diet> dinnerList = new ArrayList<>();
	    for (Diet d : todaylist) {
	        if (d.getLevel() == 1) breakfastList.add(d);
	        else if (d.getLevel() == 2) lunchList.add(d);
	        else if (d.getLevel() == 3) dinnerList.add(d);
	    }
		return new dietlist(breakfastList, lunchList, dinnerList);
	}
}
