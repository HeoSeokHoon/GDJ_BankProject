package com.winter.app.product;

import java.util.List;

import com.winter.app.account.AccountDTO;

public class ProductDTO {
	
	private Long productNum;
	private String productName;
	private String productContents;
	private Double productRate;
	private Double productJumsu;
	private List<ProductFileDTO> productFileDTOs;
	private List<AccountDTO> accountDTOs;
	
	public List<AccountDTO> getAccountDTOs() {
		return accountDTOs;
	}
	public void setAccountDTOs(List<AccountDTO> accountDTOs) {
		this.accountDTOs = accountDTOs;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContents() {
		return productContents;
	}
	public void setProductContents(String productContents) {
		this.productContents = productContents;
	}
	public Double getProductRate() {
		return productRate;
	}
	public void setProductRate(Double productRate) {
		this.productRate = productRate;
	}
	public Double getProductJumsu() {
		return productJumsu;
	}
	public void setProductJumsu(Double productJumsu) {
		this.productJumsu = productJumsu;
	}
	public List<ProductFileDTO> getProductFileDTOs() {
		return productFileDTOs;
	}
	public void setProductFileDTOs(List<ProductFileDTO> productFileDTOs) {
		this.productFileDTOs = productFileDTOs;
	}
	@Override
	public String toString() {
		return "ProductDTO [productNum=" + productNum + ", productName=" + productName + ", productContents="
				+ productContents + ", productRate=" + productRate + ", productJumsu=" + productJumsu
				+ ", productFileDTOs=" + productFileDTOs + ", accountDTOs=" + accountDTOs + "]";
	}
	
	
}
