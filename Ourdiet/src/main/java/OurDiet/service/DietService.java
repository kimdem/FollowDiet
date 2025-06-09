package OurDiet.service;
import java.util.ArrayList;
import java.time.LocalDate;
import java.util.List;

import OurDiet.dao.DietDao;
import OurDiet.dto.Diet;
import OurDiet.dto.dietlist;
import jakarta.servlet.http.HttpSession;

public class DietService {
	private DietDao dietdao;
	public DietService(DietDao dietdao) {
		this.dietdao = dietdao;
	}
	
	public void insetdiet(Diet diet, int UID, String date) {
		dietdao.insert(diet, UID, date);
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
	
	public Object[] print_W(int UID, LocalDate date, int goal) {
		try {
			Object[] arr = dietdao.return_W(UID, date);
			String msg = "";
			if(goal == 0) { //감량
				if((Float)arr[0] > (Float)arr[1]) { // 성공
					msg = "목표 체중보다 " + String.format("%.1f",(Float)arr[0] - (Float)arr[1]) + "KG 감량하셨습니다! 축하드립니다.";
					
				} else if ((Float)arr[0] == (Float)arr[1]){
					msg = "목표 체중에 도달하였습니다! 축하드립니다.";
				} else {msg = "목표 체중까지 " + String.format("%.1f", (Float)arr[1] - (Float)arr[0]) + "KG 남았습니다.";}
				
			} else { // 찌우기
				if((Float)arr[0] > (Float)arr[1]) { // 실패
					msg = "목표 체중까지 " + String.format("%.1f", (Float)arr[0] - (Float)arr[1]) + "KG 남았습니다.";
				}else if ((Float)arr[0] == (Float)arr[1]){
					msg = "목표 체중에 도달하였습니다! 축하드립니다.";
				} else {msg = "목표 체중보다 " + String.format("%.1f", (Float)arr[1] - (Float)arr[0]) + "KG 초과했습니다! 축하드립니다.";}
			}
			Object[] arr1 = new Object[3];
			for(int i =0; i < 2; i++) {
				arr1[i] = arr[i];
			} arr1[2] = msg;
			return arr1;
		} catch (Exception ex) {
			System.out.println("체중 출력 DB오류");
			ex.printStackTrace();
			return null;
		}
	}
	
	public double[] Recommend(int UID, int goal, LocalDate date) { //gender -> 0남자 1여자 || goal -> 0감량 1증량
		Object[] obj = dietdao.Recommend(UID);
		Object[] weight_obj = dietdao.return_W(UID, date);
		int Age = (int)obj[0];
		float Tall = (float)obj[1];
		int gender = (int)obj[2];
		float ex = (float)obj[3];
		float weight = (float)weight_obj[1];
		if(weight == 0.0) {return new double[] {0, 0, 0, 0};}
		double TDEE = 0;
		double tan = 0, dan = 0, ji = 0;
		if(gender == 0) {
			TDEE = (double)(88.362 + (13.397 * weight) + (4.799 * Tall) - (5.677 * Age));
			TDEE *= ex;
		} else {
			TDEE = (double)(447.593 + (9.247 * weight) + (3.098 * Tall) - (4.330 * Age));
			TDEE *= ex;
		}
		switch(goal) {
		case 0:
			TDEE *= 0.8;
			tan = TDEE * 0.5 / 4;
			dan = TDEE * 0.3 / 4;
			ji = TDEE * 0.2 / 9;
			break;
		case 1:
			TDEE *= 1.1;
			tan = TDEE * 0.55 / 4;
			dan = TDEE * 0.15 / 4;
			ji = TDEE * 0.3 / 9;
			break;
		default:
			break;
		}
		return new double[] {TDEE, tan, dan, ji};
	}
}
