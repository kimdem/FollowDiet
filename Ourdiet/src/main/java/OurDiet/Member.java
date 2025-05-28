package OurDiet;
public class Member {
	private String ID;
	private String PWD;
	private int Age;
	private float Tall;
	private float Weight;
	private float WantedWeight;
	public Member(String ID, String PWD ,int Age, float Tall, float Weight, float WantedWeight) {
		this.ID = ID;
		this.PWD = PWD;
		this.Age = Age;
		this.Tall = Tall;
		this.Weight = Weight;
		this.WantedWeight = WantedWeight;
	}
	public String getID() {
		return ID;
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
	