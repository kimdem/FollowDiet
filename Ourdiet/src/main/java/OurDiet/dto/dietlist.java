package OurDiet.dto;

import java.util.List;

public class dietlist {
	private List<Diet_fix_data> breakfastList;
    private List<Diet_fix_data> lunchList;
    private List<Diet_fix_data> dinnerList;
    
    public dietlist(List<Diet_fix_data> breakfastList, List<Diet_fix_data>lunchList, List<Diet_fix_data>dinnerList) {
    	this.breakfastList = breakfastList;
    	this.lunchList = lunchList;
    	this.dinnerList = dinnerList;
    }

	public List<Diet_fix_data> getBreakfastList() {
		return breakfastList;
	}

	public void setBreakfastList(List<Diet_fix_data> breakfastList) {
		this.breakfastList = breakfastList;
	}

	public List<Diet_fix_data> getLunchList() {
		return lunchList;
	}

	public void setLunchList(List<Diet_fix_data> lunchList) {
		this.lunchList = lunchList;
	}

	public List<Diet_fix_data> getDinnerList() {
		return dinnerList;
	}

	public void setDinnerList(List<Diet_fix_data> dinnerList) {
		this.dinnerList = dinnerList;
	}
}
