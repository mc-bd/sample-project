package com.db.user.test;

import com.db.user.UserBiz;
import com.db.vo.User;

public class Delete {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserBiz biz = new UserBiz();
		User user = new User("id12","pwd12","È«±æ¶Ë");
		try {
			biz.remove(user);
			System.out.println("Delete OK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Delete Fail");
			e.printStackTrace();
		}
	}

}
