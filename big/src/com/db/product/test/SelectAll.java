package com.db.product.test;

import java.util.ArrayList;

import com.db.product.ProductBiz;

public class SelectAll {

	public static void main(String[] args) {
		ProductBiz biz = new ProductBiz();
		
		ArrayList<Object> list = null;
		
		try {
			list = biz.get();
			for(Object obj:list){ //����Ʈ�� �ִ� object ���δ�
				System.out.println(obj);
			}
		} catch (Exception e) {
			System.out.println("Get Fail");
			e.printStackTrace();
		}

	}

}
