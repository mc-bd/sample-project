package com.db.product;

import java.sql.Connection;
import java.util.ArrayList;

import com.db.frame.Biz;

public class ProductBiz extends Biz{
	private ProductDao dao;
	public ProductBiz(){
		dao = new ProductDao();
	}

	@Override
	public void register(Object obj) throws Exception {
		Connection con = getConnection();
		try{
			dao.insert(con, obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}
		close(con);
	}

	@Override
	public void modify(Object obj) throws Exception {
		Connection con = getConnection();
		try{
			dao.update(con, obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}
		close(con);
	}

	@Override
	public void remove(Object obj) throws Exception {
		Connection con = getConnection();
		try{
			dao.delete(con, obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}
		close(con);
	}

	@Override
	public Object get(Object obj) throws Exception {
		Object product = null;
		
		Connection con = getConnection();
		product = dao.select(con, obj);
		close(con);
		
		return product;
	}
	

	@Override
	public ArrayList<Object> get() throws Exception {
		ArrayList<Object> list = null;
		
		Connection con = getConnection();
		list = dao.select(con);
		close(con);
		
		return list;
	}

}
