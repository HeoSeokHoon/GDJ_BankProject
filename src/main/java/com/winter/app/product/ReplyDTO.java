package com.winter.app.product;

import java.sql.Date;

public class ReplyDTO {
	
	private Long replyNum;
	private String userName;
	private Long productNum;
	private String replyText;
	private Date replyDate;
	private Integer replyJumsu;
	
	
	public Long getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public Integer getReplyJumsu() {
		return replyJumsu;
	}
	public void setReplyJumsu(Integer replyJumsu) {
		this.replyJumsu = replyJumsu;
	}
	
	
	
}
