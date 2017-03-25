
package template;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.HiveUtil;

@WebServlet({ "/template" }) // TODO
public class TemplateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	Statement stmt;

	public TemplateController(){
        super();
        
      try {
         Class.forName("org.apache.hive.jdbc.HiveDriver");
         conn = DriverManager.getConnection("jdbc:hive2://70.12.114.98:10000/default","root","111111");
      } catch (Exception e) {         
         e.printStackTrace();
      }              
    }

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String query = "select level,avg(food) food,avg(soju) souju,avg(clothing) clothing,avg(housing),avg(supplies),avg(medical),avg(transportation),avg(communication),avg(entertainment),avg(education),avg(eatout),avg(etc)from chachacha group by level having level=100";  // TODO
		
		HiveUtil.selectList(response, conn, stmt, query);
	}


}