package com.db.user.test;

import com.db.user.UserBiz;
import com.db.vo.User;

public class Select {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserBiz biz = new UserBiz();
		User user = null; //��û�ϸ� ���� �غ�
		try{
		user = (User) biz.get("id01"); //id01 �� �ٷ�?
		System.out.println(user);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}