package com.db.product.test;

import com.db.product.ProductBiz;
import com.db.vo.Product;


public class Select {

	public static void main(String[] args) {
		
		ProductBiz biz = new ProductBiz(); //Biz야 돌아가라
		Product product = null;
		
		try{
		product = (Product) biz.get("105"); 
		System.out.println(product);
		}catch(Exception e){
			e.printStackTrace();
		}

	}

}
