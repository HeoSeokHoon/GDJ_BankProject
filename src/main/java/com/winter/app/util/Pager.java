package com.winter.app.util;

public class Pager {
	
	private Long startRow;
	private Long lastRow;
	
	//페이지 번호, 파라미터
	private Long page;
	
	//한페이지에서 조회할 갯수
	private Long perPage=10L;
	
	private Long totalPage;
	private Long startNum;
	private Long lastNum;
	
	
	private boolean start;
	private boolean last;
	
	private String search;
	private String kind;
	
	public void makeRow() {
		this.lastRow=this.getPage()*this.getPerPage();
		this.startRow=(this.getPage()-1)*this.getPerPage();
	}
	
	public void makeNum(Long totalCount) {
		//1. 총 페이지 구하기
		this.totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage()!=0) {
			this.totalPage++;
		}
		this.setTotalPage(totalPage);
		
		//2. 총블럭의 수 구하기
		Long perBlock = 5L;
		Long totalBlock = this.getTotalPage()/perBlock;
		if(this.getTotalPage()%perBlock!=0) {
			totalBlock++;
		}
		
		//3. Page의 값으로 현재 블럭 번호 구하기
		Long curBlock = this.getPage()/perBlock;
		if(this.getPage()%perBlock!=0) {
			curBlock++;
		}
		
		//4. 현재 블럭번호로 시작번호와 끝번호 구하기
		Long lastNum=curBlock*perBlock;
		Long startNum=lastNum-perBlock+1L;
		this.setLastNum(lastNum);
		this.setStartNum(startNum);
		
		//5. 이전, 다음 블럭 유무
		if(curBlock==1) {
			this.setStart(true);
		}
		if(curBlock==totalBlock) {
			this.setLastNum(this.getTotalPage());
			this.setLast(true);
		}
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

	public Long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isStart() {
		return start;
	}

	public void setStart(boolean start) {
		this.start = start;
	}

	public boolean isLast() {
		return last;
	}

	public void setLast(boolean last) {
		this.last = last;
	}

	public String getSearch() {
		if(this.search==null) {
			this.setSearch("");
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}
	
	
}
