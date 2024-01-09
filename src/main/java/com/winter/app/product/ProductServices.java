package com.winter.app.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.util.Pager;

@Service
public class ProductServices {
	
	@Autowired
	public ProductDAO productDAO;
	
	public List<ProductDTO> productList(Pager pager) throws Exception {
		pager.makeRow();
		Long totalCount = productDAO.totalData();
		pager.makeNum(totalCount);
		List<ProductDTO> ar = this.productDAO.productList(pager);
		
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
