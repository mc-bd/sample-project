package com.db.user;

import java.sql.Connection;
import java.util.ArrayList;

import com.db.frame.Biz;

public class UserBiz extends Biz {
	private UserDao dao;
	public UserBiz(){
		dao = new UserDao();
	}
	
	@Override           //�ڹ� Ŭ������ �ְ� ������ ������Ʈ. �׷��� �������� ���� ����ִ´�? 
	public void register(Object obj) throws Exception {
		// Transaction Processing
		Connection con = getConnection();
		try{                       //db�� �Է��ϴٰ� ������ �����?     
			dao.insert(con, obj);
			con.commit(); //����
		}catch(Exception e){
			con.rollback(); //�������̸� ��� ���󺹱�
			throw e; //�����ɷ� �� �ƴϱ�?
	}
		close(con);
	}
	
	@Override
	public void modify(Object obj) throws Exception {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		Object user = null;
		Connection con = getConnection();
		user = dao.select(con,obj); //select�� transactionó��(commit,rollback) �ʿ� ����. �������ٰ� ���� ���� �� �ٽ� ��ȸ�ϸ� ����
		close(con);
		return user;
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		// TODO Auto-generated method stub
		ArrayList<Object> list = null;		//���� �غ�
		Connection con = getConnection();	//����

		list = dao.select(con);				//���δ� �������°Ŵϱ� argument �ʿ� ������?
		
		close(con);							//���ӳ�
		return list;
	}

}
