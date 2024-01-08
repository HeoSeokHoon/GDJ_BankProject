package com.winter.app.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServices {
	
	@Autowired
	public ProductDAO productDAO;
	
	public List<ProductDTO> productList() throws Exception {
		List<ProductDTO> ar = this.productDAO.productList();
		
		return ar;
	}
	
	public ProductDTO productDetail(ProductDTO pD) throws Exception {
		return this.productDAO.productDetail(pD);
	}
	
	public int productAdd(ProductDTO pD) throws Exception {
		return this.productDAO.productAdd(pD);
	}
	
	public int productUpdate(ProductDTO pD) throws Exception {
		return this.productDAO.productUpdate(pD);
	}
	
	public int productDelete(ProductDTO pD) throws Exception {
		return this.productDAO.productDelete(pD);
	}
}
