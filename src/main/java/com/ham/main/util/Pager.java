package com.ham.main.util;

public class Pager {
	
	private Long startRow;
	private Long lastRow;
	private Long totalRow;
	private Long page;
	private Long totalPage;
	private Long startNum;
	private Long lastNum;
	
	
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
	public Long getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(Long totalRow) {
		this.totalRow = totalRow;
	}
	public Long getPage() {
		if(this.page == null) {
			this.page = 1L;
		}
		
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
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
		

}
