package com.db.product.test;

import com.db.product.ProductBiz;
import com.db.vo.Product;

public class Delete {

	public static void main(String[] args) {
		ProductBiz biz = new ProductBiz();
		//Product product = new Product(); ////////////////////////////
		
		try {
			biz.remove(106); //////////////////////////////
			System.out.println("Delete OK");
		} catch (Exception e) {
			System.out.println("Delete Fail");
			e.printStackTrace();
		}
		

	}

}
