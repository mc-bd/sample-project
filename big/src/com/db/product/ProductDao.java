package com.db.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

import com.db.frame.Dao;
import com.db.frame.Sql;
import com.db.vo.Product;


public class ProductDao extends Dao{

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Product product = (Product) obj; //캐스팅하는 이유?
		PreparedStatement pstmt = con.prepareStatement(Sql.insertProduct); //Sql.java에 있기 때문에 자동완성 뜸						   
		pstmt.setString(1, product.getName());	//////////Product.java에서 만들어져서 자동완성 뜸
		pstmt.setInt(2, product.getPrice());	//////////Sql.java에서 물음표 2개니까 1,2 써주는겨
		pstmt.setString(3, product.getImg());	////////////////////////
		pstmt.executeUpdate(); //db에 집어넣는다
		close(pstmt); //문닫고온다 ㅋㅋ
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		Product product = (Product) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.udpateProduct);
		pstmt.setString(1, product.getName());  //Sql.java에서 입력값 뭔지, 순서 확인해		
		pstmt.setInt(2, product.getPrice());
		pstmt.setString(3, product.getImg());
		pstmt.setInt(4, product.getId());
		pstmt.executeUpdate(); 
		close(pstmt); 
		
	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		//Product product = (Product) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.deleteProduct);
		pstmt.setInt(1, Integer.parseInt(obj.toString())); /////////////////////Sql.java에서 ? 1개니까 1이구, 스트링했던거 다시 인트화
		pstmt.executeUpdate();
		close(pstmt);
		
	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		
		Object product = null;
		
		PreparedStatement pstmt = con.prepareStatement(Sql.selectProduct);
		pstmt.setInt(1, Integer.parseInt(obj.toString())); //////////////
		
		ResultSet rset = null;
		rset = pstmt.executeQuery();
		rset.next();
		
		int id = rset.getInt("ID");
		String name = rset.getString("NAME");
		int price = rset.getInt("PRICE");
		Date regdate = rset.getDate("REGDATE");
		String img = rset.getString("IMG");
		product = new Product(id, name, price, regdate, img);
				
		close(rset);
		close(pstmt);
		return product;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		
		ArrayList<Object> list = new ArrayList<>();	
		PreparedStatement pstmt = con.prepareStatement(Sql.selectAllProduct);
		
		ResultSet rset = null;	
		rset = pstmt.executeQuery();		
		
		while(rset.next()){	
			int id = rset.getInt("ID");
			String name = rset.getString("NAME");
			int price = rset.getInt("PRICE");
			Date regdate = rset.getDate("REGDATE");
			String img = rset.getString("IMG");
			Product product = new Product(id, name, price, regdate, img);	
			list.add(product); /////////////////
		}
				
		return list; //////////////////////////
	}

}
