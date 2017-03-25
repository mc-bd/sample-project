
package highchart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet({ "/Highchart", "/pie" })
public class Highchart extends HttpServlet {
   private static final long serialVersionUID = 1L;
   Connection conn;
   Statement stmt;
   
    public Highchart(){
        super();
        
      try {
         Class.forName("org.apache.hive.jdbc.HiveDriver");
         conn = DriverManager.getConnection("jdbc:hive2://70.12.114.98:10000/default","root","111111");
      } catch (Exception e) {         
         e.printStackTrace();
      }              
    }

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      try { 
         stmt = conn.createStatement();
//         ResultSet rs = stmt.executeQuery("select level, avg(food),avg(soju),avg(clothing),avg(housing),avg(supplies),avg(medical),avg(transportation),avg(communication),avg(entertainment),avg(education),avg(eatout),avg(etc) from kostat group by level having level=100");
         ResultSet rs = stmt.executeQuery("select level,avg(kostat.food),avg(kostat.soju) from kostat group by level having level=100");
         
         // JSON 형태
         // {data:[a,a,a,a,a,a,a]}
         JSONObject jo = new JSONObject();
         JSONArray ja = new JSONArray();
         
         while (rs.next()) {

        	 ja.add("food");
        	 ja.add(rs.getDouble(2));
        	 ja.add("soju");
        	 ja.add(rs.getDouble(3));
//        	 ja.add("clothing");
//        	 ja.add(rs.getDouble(4));
//        	 ja.add("housing");
//        	 ja.add(rs.getDouble(5));
//        	 ja.add("supplies");
//        	 ja.add(rs.getDouble(6));
//        	 ja.add("medical");
//        	 ja.add(rs.getDouble(7));
//        	 ja.add("transportation");
//        	 ja.add(rs.getDouble(8));
//        	 ja.add("communication");
//        	 ja.add(rs.getDouble(9));
//        	 ja.add("entertainment");
//        	 ja.add(rs.getDouble(10));
//        	 ja.add("education");
//        	 ja.add(rs.getDouble(11));
//        	 ja.add("eatout");
//        	 ja.add(rs.getDouble(12));
//        	 ja.add("etc");
//        	 ja.add(rs.getDouble(13));
        	 
         }      
         
         jo.put("data", ja);
         
         System.out.println(jo.toJSONString());
         System.out.println(ja.toJSONString());
         PrintWriter out = response.getWriter();
         out.print(jo.toJSONString()); // JSON으로 응답
         
//         conn.close();
         System.out.println("Success....");
         
      } catch (SQLException e) {         
         e.printStackTrace();
      }
      
   }
}