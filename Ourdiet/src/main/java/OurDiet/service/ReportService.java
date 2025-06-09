package OurDiet.service;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import OurDiet.dao.ReportDao;

public class ReportService {
	private ReportDao reportdao;
	public ReportService(ReportDao reportdao) {
		this.reportdao = reportdao;
	}
	
	public float[] totalsum(int UID, LocalDate date) {
		float totalcal = 0, totaltan = 0, totaldan = 0, totalji = 0;
		float totalcal2 = 0, totaltan2 = 0, totaldan2 = 0, totalji2 = 0;
		float cal = 0, tan = 0, dan = 0, ji = 0;
		int cnt = 0;
		for(int i = 0; i < 7; i++) {
			LocalDate date1 = date.plusDays(i);
			LocalDate date2 = date.minusDays(7-i);
			float[] sum = reportdao.Total_list(UID, date1);
			float[] sum2 = reportdao.Total_list(UID, date2);
			if((sum[0] + sum[1] + sum[2] + sum[3]) != 0) {
				totalcal += sum[0];
				totaltan += sum[1];
				totaldan += sum[2];
				totalji += sum[3];
				totalcal2 += sum2[0];
				totaltan2 += sum2[1];
				totaldan2 += sum2[2];
				totalji2 += sum2[3];
				cnt++;
			}
		} if(cnt == 0) {return new float[] {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0};}
		if((totalcal2 + totaltan2 + totaldan2 + totalji2) != 0) {
			cal = (totalcal - totalcal2) / totalcal2 * 100;
			tan = (totaltan - totaltan2) / totaltan2 * 100;
			dan = (totaldan - totaldan2) / totaldan2 * 100;
			ji = (totalji - totalji2) / totalji2 * 100;
		}
		return new float[] {totalcal, totaltan, totaldan, totalji,
					totalcal/cnt, totaltan/cnt, totaldan/cnt, totalji/cnt,
					cal, tan, dan, ji};
		
		
	}
	
	public LocalDate getM(LocalDate date) {
		LocalDate Monday = date;
		while(Monday.getDayOfWeek() != DayOfWeek.MONDAY) {
			Monday = Monday.minusDays(1);
		}return Monday;
	}
	
	public List<LocalDate> getMS() {
		LocalDate today = LocalDate.now();
		LocalDate today_M = getM(today);
		List<LocalDate> MS = new ArrayList<>();
		for (int i=0; i<52; i++) {
			MS.add(today_M.minusWeeks(i));
		} return MS;
	}
	
	public float[][] return_week_info(int UID, LocalDate date) {
		float[][] week_info = new float[7][5];
		for(int i=0; i<7; i++) {
			float[] list = reportdao.Total_list(UID, date.plusDays(i));
			for(int j=0; j<5; j++) {
				week_info[i][j] = list[j];
			}
		}
		return week_info;
	}
	
	public float return_wanted_weight(int UID) {
		float W = reportdao.return_wanted_weight(UID);
		return W;
	}
	
}
