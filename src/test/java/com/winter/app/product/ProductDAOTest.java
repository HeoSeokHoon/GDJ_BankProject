package com.winter.app.product;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.winter.app.MyTest;

public class ProductDAOTest extends MyTest{

	@Autowired
	private ProductDAO productDAO;
	
//	@Test
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
	
//	@Test
	public void addTest() throws Exception {
		ProductDTO pDTO = new ProductDTO();
		for(int i=0;i<100;i++) {
			pDTO.setProductName("Test"+i);
			pDTO.setProductContents("test");
			pDTO.setProductRate(3.5);
			pDTO.setProductJumsu(3.5);
			int result = productDAO.productAdd(pDTO);
			if(i%10==0) {
				Thread.sleep(500);
			}
		}
		System.out.println("100개 입력 완료");
	}

}
