package com.ham.main.board;

import java.sql.Date;

public class BoardDTO {

	private Long boardNum;
	private String writer;
	private String boardName;
	private String boardContents;
	private Date boardDate;
	private Long boardHit;
	
	public Long getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Long boardNum) {
		this.boardNum = boardNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public Long getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(Long boardHit) {
		this.boardHit = boardHit;
	}
	
	
	
}
