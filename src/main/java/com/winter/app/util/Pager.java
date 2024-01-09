package com.winter.app.util;

public class Pager {
	
	private Long startRow;
	private Long lastRow;
	
	//페이지 번호, 파라미터
	private Long page;
	
	//한페이지에서 조회할 갯수
	private Long perPage=10L;
	
	public void makeRow() {
		this.lastRow=this.getPage()*this.getPerPage();
		this.startRow=(this.getPage()-1)*this.getPerPage();
	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getLastRow() {
		return lastRow;
	}

	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getPage() {
		if(this.page==null||this.page<1) {
			this.page=1L;
		}
		return page;
	}

	public void setPage(Long page) {
		
		this.page = page;
	}

	public Long getPerPage() {
		if(this.perPage==null||this.perPage<1) {
				this.perPage=10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
	
	
}
