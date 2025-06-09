package OurDiet.dto;

public class Diet {
	private int level;
	private String food;
	private Float calrory;
	private Float tan;
	private Float dan;
	private Float ji;
	
	public Diet(int level, String food, Float calrory, Float tan, Float dan, Float ji) {
		this.level = level;
		this.food = food;
		this.calrory = calrory;
		this.tan = tan;
		this.dan = dan;
		this.ji = ji;
	}

	public String getFood() {
		return food;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public Float getCalrory() {
		return calrory;
	}
	public void setCalrory(Float calrory) {
		this.calrory = calrory;
	}
	public Float getTan() {
		return tan;
	}
	public void setTan(Float tan) {
		this.tan = tan;
	}
	public Float getDan() {
		return dan;
	}
	public void setDan(Float dan) {
		this.dan = dan;
	}
	public Float getJi() {
		return ji;
	}
	public void setJi(Float ji) {
		this.ji = ji;
	}
}
