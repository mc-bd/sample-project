package com.hive;


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



@WebServlet({ "/RHiveServlet", "/rhive" })
public class RHiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	Statement stmt;
	
       
  
    public RHiveServlet() {	//����
        super();
        
        try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");			
		} catch (Exception e) {			
			e.printStackTrace();
		}
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//����� �����ͼ� JSON���� �������
		try {
			conn = DriverManager.getConnection
					("jdbc:hive2://192.168.111.100:10000/default","root","111111");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select Month, avg(Date) from log_in"
					+ " group by Month");
			JSONArray ja=new JSONArray();		//�갡 ���ȣ
			
			
			
			while(rs.next()) {
			     JSONObject jo=new JSONObject();
			     jo.put("name",rs.getString(1));
			     jo.put("y",rs.getDouble(2));
			     ja.add(jo);
			}
			System.out.println(ja.toJSONString());
			PrintWriter out=response.getWriter();	//�������� ������
			out.print(ja.toJSONString());			//JSON ���·� ������
			conn.close();
			System.out.println("Success....");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
