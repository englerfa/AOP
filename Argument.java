package aop;

public class Argument {
	String name;
	String value;
	String type;
	
	public Argument(String name, String value, String type){
		this.name = name;
		this.value = value;
		this.type = type;
	}
	
	public String toString() {
		return "name=" + name + ", value=" + value + ", type=" + type;
	}
}
