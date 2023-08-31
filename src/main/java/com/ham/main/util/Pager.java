package com.ham.main.util;

public class Pager {
	
	private Long startRow;		// 시작 데이터(행)
	private Long lastRow;		// 마지막 데이터(행)
	private Long totalRow;		// 한페이지에 보여줄 row(데이터)의 갯수
	private Long page;			// 현재 페이지
	private Long totalPage;		// 총페이지 갯수
	private Long startNum;		// 현재 블럭의 첫 페이지
	private Long lastNum;		// 현재 블럭의 마지막 페이지
		
	
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
		if(this.totalRow == null) {
			this.totalRow = 5L;
		}
		
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
	
	
	public void makeRowNum() {
		this.startRow = (this.getPage() - 1)*this.getTotalRow() + 1;
		this.lastRow = this.getPage() * this.getTotalRow();
	}
	
	public void makePageNum(Long total) {
		if(total % this.getTotalRow() == 0) {
			this.totalPage = total / this.getTotalRow();
		} else {
			this.totalPage = total / this.getTotalRow() + 1;
		}
		
		
		long perBlock = 5;								// 한 블럭당 보여줄 페이지 수
		long totalBlock = this.totalPage / perBlock;	// 총 블럭 수
		if(this.totalPage % perBlock != 0) {
			totalBlock++;
		}
		
		
		long block = this.getPage() / perBlock;			// 현재 블럭 
		if(this.getPage() % perBlock != 0) {
			block++;
		}
		
		
		this.startNum = (block - 1)*perBlock + 1;
		
		if(this.totalPage < perBlock){
			this.lastNum = block * this.totalPage;
		} else {
			this.lastNum = block * perBlock;			
		}
		
		
		
	}
		

}
