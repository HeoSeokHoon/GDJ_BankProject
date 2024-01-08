package com.winter.app.product;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.winter.app.MyTest;

public class ProductDAOTest extends MyTest{

	@Autowired
	private ProductDAO productDAO;
	
	@Test
	public void updateTest() throws Exception {
		ProductDTO pD = new ProductDTO();
		pD.setProductNum(1L);
		pD.setProductName("TEST3");
		pD.setProductContents("1");
		pD.setProductRate(3.3);
		pD.setProductJumsu(3.3);
		int result = productDAO.productUpdate(pD);
		
		assertEquals(1, result);
	}

}
