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
		Product product = (Product) obj; //ĳ�����ϴ� ����?
		PreparedStatement pstmt = con.prepareStatement(Sql.insertProduct); //Sql.java�� �ֱ� ������ �ڵ��ϼ� ��						   
		pstmt.setString(1, product.getName());	//////////Product.java���� ��������� �ڵ��ϼ� ��
		pstmt.setInt(2, product.getPrice());	//////////Sql.java���� ����ǥ 2���ϱ� 1,2 ���ִ°�
		pstmt.setString(3, product.getImg());	////////////////////////
		pstmt.executeUpdate(); //db�� ����ִ´�
		close(pstmt); //���ݰ�´� ����
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		Product product = (Product) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.udpateProduct);
		pstmt.setString(1, product.getName());  //Sql.java���� �Է°� ����, ���� Ȯ����		
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
		pstmt.setInt(1, Integer.parseInt(obj.toString())); /////////////////////Sql.java���� ? 1���ϱ� 1�̱�, ��Ʈ���ߴ��� �ٽ� ��Ʈȭ
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
