package aop;

public class Main {
	
	public static void main(String[] args) {
		doubles(2);
		int a = add(2,4);
		String n1 = getName();
		sayHello(n1);
		Argument arg = new Argument("a", "4", "Integer");
		arg = getArgument(arg);
		double result = square(3.0);
	}
	
	public static int doubles(int a) {
		return 2*a;
	}
	
	public static int add(int a, int b) {
		return a+b;
	}
	
	public static String getName() {
		return "Anna";
	}
	
	public static void sayHello(String name) {
		//System.out.println("hello " + name);
	}
	
	/*
	 * Does not make sense - just to see how reference as argument and return type look like
	 */
	public static Argument getArgument(Argument a) {
		return new Argument("a", "5", "Int");
	}
	
	private static double square(double x) {
		return x*x;
	}
	

}
