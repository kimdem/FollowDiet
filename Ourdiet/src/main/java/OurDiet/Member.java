package OurDiet;
public class Member {
	private String ID;
	private String PWD;
	private int Age;
	private float Tall;
	private float Weight;
	private float WantedWeight;
	private int gender;
	private float ex;
	public Member(String ID, String PWD ,int Age, float Tall, float Weight, float WantedWeight, int gender, float ex) {
		this.ID = ID;
		this.PWD = PWD;
		this.Age = Age;
		this.Tall = Tall;
		this.Weight = Weight;
		this.WantedWeight = WantedWeight;
		this.gender = gender;
		this.ex = ex;
	}
	public String getID() {
		return ID;
	}
	public int getGender() {
		return gender;
	}
	public float getEx() {
		return ex;
	}
	public void setEx(float ex) {
		this.ex = ex;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPWD() {
		return PWD;
	}
	public void setPWD(String pWD) {
		PWD = pWD;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public float getTall() {
		return Tall;
	}
	public void setTall(float tall) {
		Tall = tall;
	}
	public float getWeight() {
		return Weight;
	}
	public void setWeight(float weight) {
		Weight = weight;
	}
	public float getWantedWeight() {
		return WantedWeight;
	}
	public void setWantedWeight(float wantedWeight) {
		WantedWeight = wantedWeight;
	}
}
	