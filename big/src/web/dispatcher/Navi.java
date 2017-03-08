package web.dispatcher;

public class Navi {
	public static String home = 
	"<a href='main.big'>HOME</a>";
	public static String register = 
	home + " > register";
	public static String login = 	//static 변수형 변수는 뭐라고? DispatcherServlet.java 53라인으로 연결됨
	home + " > login";
	public static String cust = 
	home + " > cust";
	public static String product = 
	home + " > product";
}
