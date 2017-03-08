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
      
      if(view != null) { // view ���
         center = "cust/add";
      } else { //db ���
          center = "cust/list";
          String db = request.getParameter("db");
         if(db.equals("search")) {
            // ���� ��ȸ
            ArrayList<Object> list = null;
            try {
               list = biz.get(); //connection�� ����ų� db�� �׾��� �� 
            } catch (Exception e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
            // Center ȭ�� �̵�
            request.setAttribute("custlist", list);
            center="cust/list";
         }else if(db.equals("add")){
        	 //db�� �Է��Ѵ�
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
				//ID�� �޴´�
			String id = request.getParameter("id");
				//biz�� ���ؼ� ���� ��û�Ѵ�
			try {
				biz.remove(id);
				request.setAttribute("deleteid", id);
				center = "cust/deleteok";
			} catch (Exception e) {
				e.printStackTrace();
			}
				//������ �Ϸ�Ǹ� ���� �Ϸ� �������� �̵�
		}else if(db.equals("updateview")){
				// ID�� �޴´�
				// User ������ ��ȸ�Ѵ�
				// ���� �������� �̵��Ѵ�
				// User ������ ��Ƽ� ������
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
				// ����� ������ �޴´�
				// User ��ü�� �����
				// biz�� ���� ������ ��û�Ѵ�
				// ���� �Ϸ�Ǹ� �� �������� �̵�
				 String id = request.getParameter("id");
	        	 String pwd = request.getParameter("pwd");
	        	 String name = request.getParameter("name");
	        	 name = Util.convertKr(name);
	        	 User user = new User(id, pwd, name);
	        	 try {
					biz.modify(user);					//biz�� ���� ������ �Ϸ�Ǹ�
					next = "cust.big?db=detail&id="+id;	//���������� �̵�����
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