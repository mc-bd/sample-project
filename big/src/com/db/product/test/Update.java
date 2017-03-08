package com.db.product.test;

import com.db.product.ProductBiz;
import com.db.vo.Product;

public class Update {

	public static void main(String[] args) {
		ProductBiz biz = new ProductBiz();
		Product product = new Product("Ä¡¸¶",5000,"BB.jpg",121);
		
		try {
			biz.modify(product);
			System.out.println("Update OK");
		} catch (Exception e) {
			System.out.println("Update Fail");
			e.printStackTrace();
		}
		

	}

}
