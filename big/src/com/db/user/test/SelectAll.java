package com.db.user.test;

import java.util.ArrayList;

import com.db.user.UserBiz;

public class SelectAll {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserBiz biz = new UserBiz();	//∞¥√º
		ArrayList<Object> list = null;  //∞¥√º ¥„¿ª ªÛ¿⁄
		try {
			list = biz.get();
			for(Object obj:list){ //:ππø¥¥ı∂Û?
				System.out.println(obj);
			}
		} catch (Exception e) {
			System.out.println("Get Fail");
			e.printStackTrace();
		}
		
	}

}
