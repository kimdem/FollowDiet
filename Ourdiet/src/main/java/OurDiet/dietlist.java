package OurDiet;

import java.util.List;

public class dietlist {
	private List<Diet> breakfastList;
    private List<Diet> lunchList;
    private List<Diet> dinnerList;
    
    public dietlist(List<Diet> breakfastList, List<Diet>lunchList, List<Diet>dinnerList) {
    	this.breakfastList = breakfastList;
    	this.lunchList = lunchList;
    	this.dinnerList = dinnerList;
    }

	public List<Diet> getBreakfastList() {
		return breakfastList;
	}

	public void setBreakfastList(List<Diet> breakfastList) {
		this.breakfastList = breakfastList;
	}

	public List<Diet> getLunchList() {
		return lunchList;
	}

	public void setLunchList(List<Diet> lunchList) {
		this.lunchList = lunchList;
	}

	public List<Diet> getDinnerList() {
		return dinnerList;
	}

	public void setDinnerList(List<Diet> dinnerList) {
		this.dinnerList = dinnerList;
	}
}
