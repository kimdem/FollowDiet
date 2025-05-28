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
	
	public void info_insert(int UID, Diet diet, String date) {
		boolean chk = dietdao.info_check(UID, date);
		if(chk == true) {
			dietdao.update_info(UID, diet, date);
		} else {
			dietdao.insert_info(UID, diet, date);
		}
	}
	
	public void weight_insert(int UID, float weight, String time) {
		boolean chk = dietdao.info_check(UID, time);
		if(chk == true) {
			dietdao.update_W(UID, weight, time);
		} else {
			dietdao.insert_W(UID, weight, time);
		}
	}
	
	public List<Object[]> print_W(int UID, LocalDate date) {
		try {
			return dietdao.return_W(UID, date);
		} catch (Exception ex) {
			System.out.println("체중 출력 DB오류");
			ex.printStackTrace();
			return null;
		}
	}
}
