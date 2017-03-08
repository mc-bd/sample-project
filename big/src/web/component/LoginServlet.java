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
			
			
			session.invalidate();				//session�� ���ش�
			response.sendRedirect("main.big");	//�������� �̵��Ѵ�
		}
	}
	
	//LOGIN, POST TYPE
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. ID�� PWD�� �޴´�.
		//2. DB�� �ش� ID�� �����ϴ���
		//3. PWD�� ���Ѵ�
		//4. �α��� ���� �� ������ ����� ���ǿ� ����� ������ �ִ´�.
		//5. �α��� ���� �Ǵ� ������ �������� �̵�
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
