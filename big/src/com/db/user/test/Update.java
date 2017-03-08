package com.db.user.test;

import com.db.user.UserBiz;
import com.db.vo.User;

public class Update {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserBiz biz = new UserBiz();
		User user = new User("id11","pwd11","ȫ�浿");
		try {
			biz.modify(user);
			System.out.println("Update OK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Update Fail");
			e.printStackTrace();
		}
	}

}
