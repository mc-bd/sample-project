package web.dispatcher;

public class Navi {
	public static String home = 
	"<a href='main.big'>HOME</a>";
	public static String register = 
	home + " > register";
	public static String login = 	//static ������ ������ �����? DispatcherServlet.java 53�������� �����
	home + " > login";
	public static String cust = 
	home + " > cust";
	public static String product = 
	home + " > product";
}
