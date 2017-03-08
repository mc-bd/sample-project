package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.db.product.ProductBiz;
import com.db.vo.Product;
import com.db.vo.User;
import com.oreilly.servlet.MultipartRequest;


//jsp는 복사해도 되지만 서블릿은 복사하지마!!!
//서블릿 만들고 나서 서버 재부팅하는거 잊지마!!!




@WebServlet({ "/ProductServlet", "/product" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProductBiz biz;  
    private Logger data_log = 
			Logger.getLogger("data");  //나 지금부터 data에다가 로그 찍는다?!

    
    public ProductServlet() {
        super();
        biz = new ProductBiz();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = request.getParameter("view");
		String next = "main.jsp";
		String center = "product/center";
		
		if(view != null){
			center = "product/add";
			} else {
			String db = request.getParameter("db");
			
			if(db.equals("add")){
				// File upload...
				String dir = "C:\\hive\\big\\Web\\img";
				int maxSize = 1024*1024*1024;
				MultipartRequest mpr 
				= new MultipartRequest(request, dir, maxSize, "EUC-KR");
			
				// name, price, img_name
				String name = mpr.getParameter("name");
				int price = Integer.parseInt(mpr.getParameter("price"));
				String img = mpr.getOriginalFileName("img");
				
				// DB에 입력
				Product p = new Product(name, price, img);
				try {
					biz.register(p);
					request.setAttribute("addproduct", p);
					center = "product/addok";
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}else if(db.equals("search")){
				 ArrayList<Object> list = null;
				 try {
				 list = biz.get();
				 request.setAttribute("plist", list);
				 center = "product/list";
			
				 } catch (Exception e) {
					 e.printStackTrace();
				 }
			
			}else if(db.equals("delete")){
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					biz.remove(id);
					request.setAttribute("deleteid", id);
					center = "product/deleteok";
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			}else if(db.equals("updateview")){
				 int id = Integer.parseInt(request.getParameter("id"));
	        	 Product product = null;
	        	 try {
					product = (Product) biz.get(id);
					request.setAttribute("updateproduct", product);
					center = "product/update";
				} catch (Exception e) {
					e.printStackTrace();
			}
			
			}else if(db.equals("update")){
				
				// File upload...
				String dir = "C:\\hive\\big\\Web\\img";
				int maxSize = 1024*1024*1024;
				MultipartRequest mpr 
				= new MultipartRequest(request, dir, maxSize, "EUC-KR");
			
				// id, name, price, img_name
				int id = Integer.parseInt(mpr.getParameter("id"));
				String name = mpr.getParameter("name");
				int price = Integer.parseInt(mpr.getParameter("price"));
				String img = mpr.getParameter("img");
				String newimg = mpr.getOriginalFileName("newimg");
				
				// 신규 이미지가 있으면 신규 이미지로 수정, 없으면 기존 이미지로 수정
				if (newimg != null || !newimg.equals("")){
					img = newimg;
				}
				
				// DB에 입력
				Product p = new Product(id, name, price, img);
				try {
					biz.modify(p);
					next = "product.big?db=detail$id="+id;
				} catch (Exception e) {
					e.printStackTrace();
				}
								
			}else if(db.equals("detail")){
				 int id = Integer.parseInt(request.getParameter("id"));
	        	 Product product = null;
	        	 try {
					product = (Product) biz.get(id);
					/*Start Log*/
					data_log.debug(product.getId()
							+","
							+product.getName()
							+","
							+product.getPrice());
					/*End Log*/
					request.setAttribute("detailproduct", product);
					center = "product/detail";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		}
		 request.setAttribute("center", center);
	     RequestDispatcher rd = 
	     request.getRequestDispatcher(next);
	     rd.forward(request, response);

	}
}
