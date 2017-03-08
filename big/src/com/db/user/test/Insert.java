package com.db.user.test;

import com.db.user.UserBiz;
import com.db.vo.User;

public class Insert {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserBiz biz = new UserBiz();
		User user = new User("id11","pwd11","ȫ�浿");
		try {
			biz.register(user);
			System.out.println("Insert OK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Insert Fail");
			e.printStackTrace();
		}
	}

}
