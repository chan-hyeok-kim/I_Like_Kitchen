package com.ham.main.question;

import java.sql.Date;

public class QuestionDTO {

	private Long questionNum;
	private Long productNum;
	private String id;
	private String questionContents;
	private Date questionDate;
	private String questionKind;
	
	
	public Long getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(Long questionNum) {
		this.questionNum = questionNum;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuestionContents() {
		return questionContents;
	}
	public void setQuestionContents(String questionContents) {
		this.questionContents = questionContents;
	}
	public Date getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}
	public String getQuestionKind() {
		return questionKind;
	}
	public void setQuestionKind(String questionKind) {
		this.questionKind = questionKind;
	}
}
