package web.dispatcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebServlet({ "/DispatcherServlet", "/dispatcher" })
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger work_log = 
			Logger.getLogger("work");  

	
	public DispatcherServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		//work_log.debug("test logger:"+path);

		path = path.substring(1, path.lastIndexOf("."));
		work_log.debug(path);
		String next = "main.jsp";
		if(path.equals("main")){
			String view = request.getParameter("view");
			request.setAttribute("navi", Navi.home);
			if(view != null){									//view�� �ֳ� ���Ŀ� ���� �ɷ�
				build(request, view);
			}
			next = "main.jsp"; //�����̸� ����� ����
		}else{
			next = path;
		}
		RequestDispatcher rd = 
		request.getRequestDispatcher(next);
		rd.forward(request, response);
		
	}
	
	
	private void build(HttpServletRequest request, String view){
		if(view.equals("login")){
			request.setAttribute("center", "login");	//ȸ�� �������� login.jsp�� �ѷ���
			request.setAttribute("nav", Navi.login);	//�Ķ� �������� navi.java�� �ѷ��� (STATIC ������ ����)
		}else if(view.equals("register")){
			request.setAttribute("center", "register");
			request.setAttribute("nav", Navi.register);
		}else if(view.equals("cust")){
			request.setAttribute("center", "cust/center"); //ȸ�� �������� web>cust>center.jsp�� �ѷ���
			request.setAttribute("nav", Navi.cust);		   
		}else if(view.equals("product")){
			request.setAttribute("center", "product/center"); //�Ķ� �������� web>product>product.jsp�� �ѷ���
			request.setAttribute("nav", Navi.product);
		}else if(view.equals("rgraph")){
			request.setAttribute("center", "rgraph");
		}else if(view.equals("highcharts")){
			request.setAttribute("center", "highcharts");
		}
			
		/*if(view.equals("register")){
			request.setAttribute("center", "register");
			request.setAttribute("navi", Navi.register);
		}else if(view.equals("login")){
			request.setAttribute("center", "login");
			request.setAttribute("navi", Navi.login);
		}else if(view.equals("custadd")){
			request.setAttribute("center", "cust/register");
		}else if(view.equals("productadd")){
			request.setAttribute("center", "product/register");
		}else if(view.equals("chart")){
			request.setAttribute("center", "chart/chart");
		}*/
		
	}

}