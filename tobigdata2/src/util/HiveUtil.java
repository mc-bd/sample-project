package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class HiveUtil {
	
	public static void selectList(HttpServletResponse response, Connection conn, Statement stmt, String query) throws IOException {
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			JSONObject jo = new JSONObject();
			JSONArray ja = new JSONArray();

			while (rs.next()) {
		        Map<String, Object> rtmap = new HashMap<String, Object>();
		        if(rs != null) {
		            ResultSetMetaData rsmd = rs.getMetaData();
		            int columnCount = rsmd.getColumnCount();
		           
		            for (int i = 1; i <= columnCount; i++) {
		               
		                String columnName = rsmd.getColumnName(i);
		                Object columnValue = rs.getObject(i);
		                               
		                rtmap.put(columnName, columnValue);               
		            }
		        }
		        ja.add(rtmap);
			}
			jo.put("data", ja);

			System.out.println(jo.toJSONString());
			System.out.println(ja.toJSONString());
			PrintWriter out = response.getWriter();
			out.print(jo.toJSONString()); // JSON으로 응답

			// conn.close();
			System.out.println("Success....");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	

}
