package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.user.UserBiz;
import com.db.vo.User;

import web.dispatcher.Util;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({ "/CustServlet", "/cust" })
public class CustServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   UserBiz biz;
   
   public CustServlet() {
      super();
      biz = new UserBiz();
   }
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String view = request.getParameter("view");
      String next = "main.jsp";
      String center = "";
      
      if(view != null) { // view 사용
         center = "cust/add";
      } else { //db 사용
          center = "cust/list";
          String db = request.getParameter("db");
         if(db.equals("search")) {
            // 정보 조회
            ArrayList<Object> list = null;
            try {
               list = biz.get(); //connection이 끊겼거나 db가 죽었을 때 
            } catch (Exception e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
            // Center 화면 이동
            request.setAttribute("custlist", list);
            center="cust/list";
         }else if(db.equals("add")){
        	 //db에 입력한다
        	 String id = request.getParameter("id");
        	 String pwd = request.getParameter("pwd");
        	 String name = request.getParameter("name");
        	 name = Util.convertKr(name);
        	 User user = new User(id, pwd, name);
        	 
        	 try {
				biz.register(user);
				request.setAttribute("adduser", user);
				center = "cust/addok";
			} catch (Exception e) {
				center = "cust/addfail";
				e.printStackTrace();
			}
         }else if(db.equals("detail")){
        	 String id = request.getParameter("id");
        	 User user = null;
        	 try {
				user = (User) biz.get(id);
				request.setAttribute("detailuser", user);
				center = "cust/detail";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(db.equals("delete")){
				//ID를 받는다
			String id = request.getParameter("id");
				//biz를 통해서 삭제 요청한다
			try {
				biz.remove(id);
				request.setAttribute("deleteid", id);
				center = "cust/deleteok";
			} catch (Exception e) {
				e.printStackTrace();
			}
				//삭제가 완료되면 삭제 완료 페이지로 이동
		}else if(db.equals("updateview")){
				// ID를 받는다
				// User 정보를 조회한다
				// 수정 페이지로 이동한다
				// User 정보를 담아서 보낸다
				String id = request.getParameter("id");
				User user = null;
				try {
					user = (User) biz.get(id);
					request.setAttribute("updateuser", user);
					center = "cust/update";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(db.equals("update")){
				// 사용자 정보를 받는다
				// User 객체를 만든다
				// biz를 통해 수정을 요청한다
				// 수정 완료되면 상세 페이지로 이동
				 String id = request.getParameter("id");
	        	 String pwd = request.getParameter("pwd");
	        	 String name = request.getParameter("name");
	        	 name = Util.convertKr(name);
	        	 User user = new User(id, pwd, name);
	        	 try {
					biz.modify(user);					//biz를 통해 수정이 완료되면
					next = "cust.big?db=detail&id="+id;	//상세페이지로 이동해줘
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
      }	//end if else
      request.setAttribute("center", center);
      RequestDispatcher rd = 
            request.getRequestDispatcher(next);
            rd.forward(request, response);
   }

}