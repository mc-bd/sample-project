package com.db.user.test;

import com.db.user.UserBiz;
import com.db.vo.User;

public class Select {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserBiz biz = new UserBiz();
		User user = null; //요청하면 받을 준비
		try{
		user = (User) biz.get("id01"); //id01 좀 줄래?
		System.out.println(user);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}