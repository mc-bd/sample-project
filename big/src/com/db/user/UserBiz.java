package com.db.user;

import java.sql.Connection;
import java.util.ArrayList;

import com.db.frame.Biz;

public class UserBiz extends Biz {
	private UserDao dao;
	public UserBiz(){
		dao = new UserDao();
	}
	
	@Override           //자바 클래스의 최고 상위는 오브젝트. 그래서 하위까지 같이 집어넣는다? 
	public void register(Object obj) throws Exception {
		// Transaction Processing
		Connection con = getConnection();
		try{                       //db에 입력하다가 문제가 생기면?     
			dao.insert(con, obj);
			con.commit(); //정상
		}catch(Exception e){
			con.rollback(); //비정상이면 취소 원상복귀
			throw e; //잡힌걸로 끝 아니구?
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
		user = dao.select(con,obj); //select는 transaction처리(commit,rollback) 필요 없어. 가져오다가 에러 나면 걍 다시 조회하면 되지
		close(con);
		return user;
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		// TODO Auto-generated method stub
		ArrayList<Object> list = null;		//상자 준비
		Connection con = getConnection();	//접속

		list = dao.select(con);				//전부다 가져오는거니까 argument 필요 없겠지?
		
		close(con);							//접속끝
		return list;
	}

}
