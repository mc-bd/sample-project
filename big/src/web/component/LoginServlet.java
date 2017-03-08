package web.component;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.db.user.UserBiz;
import com.db.vo.User;

@WebServlet({"/LoginServlet", "/login"})
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    UserBiz biz;
    private Logger user_log = 
			Logger.getLogger("user");  
    
    public LoginServlet() {
        super();
        biz = new UserBiz();
    }
    
    //LOGOUT, GET TYPE
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session != null){
			User user = 
			(User)session.getAttribute("loginuser");
			user_log.debug("LOGOUT,"+user.getId());
			
			
			session.invalidate();				//session을 없앤다
			response.sendRedirect("main.big");	//메인으로 이동한다
		}
	}
	
	//LOGIN, POST TYPE
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. ID와 PWD를 받는다.
		//2. DB에 해당 ID가 존재하는지
		//3. PWD를 비교한다
		//4. 로그인 정상 시 세션을 만들고 세션에 사용자 정보를 넣는다.
		//5. 로그인 정상 또는 비정상 페이지로 이동
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd"); 
		User user = null;
		String next = "main.jsp";
		String center = "center.jsp";
		try {
			user = (User) biz.get(id);
			if(pwd.equals(user.getPwd())){
				HttpSession session = request.getSession();
				session.setAttribute("loginuser", user);
				user_log.debug("LOGIN,"+user.getId());
				center = "loginok";
			}else{
				
				center = "loginok";
			}
		
		} catch (Exception e) {
			center = "loginfail";
			e.printStackTrace();
		}
		request.setAttribute("center", center);
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
