package OurDiet.dto;

import java.time.LocalDate;

public class food_fix {
	private int level;
	private String food;
	private float calrory;
	private float tan;
	private float dan;
	private float ji;
	private LocalDate diet_date;
	
	public food_fix(int level, String food, float calrory, float tan, float dan, float ji, LocalDate diet_date) {
		this.level = level;
		this.food = food;
		this.calrory = calrory;
		this.tan = tan;
		this.dan = dan;
		this.ji = ji;
		this.diet_date = diet_date;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public float getCalrory() {
		return calrory;
	}

	public void setCalrory(float calrory) {
		this.calrory = calrory;
	}

	public float getTan() {
		return tan;
	}

	public void setTan(float tan) {
		this.tan = tan;
	}

	public float getDan() {
		return dan;
	}

	public void setDan(float dan) {
		this.dan = dan;
	}

	public float getJi() {
		return ji;
	}

	public void setJi(float ji) {
		this.ji = ji;
	}

	public LocalDate getDiet_date() {
		return diet_date;
	}

	public void setDiet_date(LocalDate diet_date) {
		this.diet_date = diet_date;
	}
	
}
