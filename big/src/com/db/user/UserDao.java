package com.db.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.db.frame.Dao;
import com.db.frame.Sql;
import com.db.vo.User;

public class UserDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		User user = (User) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.insertCust);
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPwd());
		pstmt.setString(3, user.getName());
		pstmt.executeUpdate(); //db�� ����ִ´�
		close(pstmt);
	
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		User user = (User) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.updateCust);
		pstmt.setString(1, user.getPwd());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getId());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		//User user = (User) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.deleteCust);
		pstmt.setString(1, obj.toString());
		pstmt.executeUpdate(); //db�� �ݿ��Ѵ�
		close(pstmt);
	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
		Object user = null;
		PreparedStatement pstmt = con.prepareStatement(Sql.selectCust);
		pstmt.setString(1, obj.toString());
		ResultSet rset = null;
		rset = pstmt.executeQuery();
		rset.next(); //�ű�ٰ�???���ؾȵ� //ù°�� data�ƴ϶� �÷����̶� ���پ� �ڷ� �и���?
		String id = rset.getString("ID");
		String pwd = rset.getString("PWD");
		String name = rset.getString("NAME");
		user = new User(id, pwd, name);
		return user;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		
		ArrayList<Object> list = new ArrayList<>();						   //�迭���� �����
		PreparedStatement pstmt = con.prepareStatement(Sql.selectAllCust); //sql�غ��Ѵ�?
		
		ResultSet rset = null;						//��ü�� ���� ������� �����
		rset = pstmt.executeQuery();				//Dao�� DB������ ���� ��ü ������ ����
		while(rset.next()){							//��ü���� ������ ������
			String id = rset.getString("ID");
			String pwd = rset.getString("PWD");
			String name = rset.getString("NAME");
			User user = new User(id, pwd, name);	//
			list.add(user);
		}
		close(rset);
		close(pstmt);
		return list;
	}

}
