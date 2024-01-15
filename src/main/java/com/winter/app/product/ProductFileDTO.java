package com.winter.app.product;

import com.winter.app.product.files.FileDTO;

public class ProductFileDTO extends FileDTO{
	
	private Long productNum;

	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
}
