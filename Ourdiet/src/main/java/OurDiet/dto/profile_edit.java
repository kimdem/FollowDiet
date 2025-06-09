package OurDiet.dto;

public class profile_edit {
	private int age;
	private float tall;
	private float weight;
	private float wantedweight;
	private float ex;
	
	public profile_edit(int age, float tall, float weight, float wantedweight, float ex) {
		this.age = age;
		this.tall = tall;
		this.weight = weight;
		this.wantedweight = wantedweight;
		this.ex = ex;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public float getTall() {
		return tall;
	}
	public void setTall(float tall) {
		this.tall = tall;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public float getWantedweight() {
		return wantedweight;
	}
	public void setWantedweight(float wantedweight) {
		this.wantedweight = wantedweight;
	}
	public float getEx() {
		return ex;
	}
	public void setEx(float ex) {
		this.ex = ex;
	}
	
	
}
