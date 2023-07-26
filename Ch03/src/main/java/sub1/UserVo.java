package sub1;

public class UserVo {
	private String Uid;
	private String Name;
	private String Hp;
	private int age;
	
	public UserVo(String uid, String name, String hp, int age) {
		super();
		Uid = uid;
		Name = name;
		Hp = hp;
		this.age = age;
	}
	
	public String getUid() {
		return Uid;
	}
	public void setUid(String uid) {
		Uid = uid;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getHp() {
		return Hp;
	}
	public void setHp(String hp) {
		Hp = hp;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
