package OurDiet.dto;

public class profile_info {
	private String id;
	private int age;
	private float tall;
	private float weight;
	private float wantedweight;
	private int gender;
	
	public profile_info(String id, int age, float tall, float weight, float wantedweight, int gender) {
		this.id = id;
		this.age = age;
		this.tall = tall;
		this.weight = weight;
		this.wantedweight = wantedweight;
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}
	
	
}
