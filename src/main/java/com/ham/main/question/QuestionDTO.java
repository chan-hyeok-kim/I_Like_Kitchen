package com.ham.main.question;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
public class QuestionDTO {

	private Long questionNum;
	private Long productNum;
	private String id;
	private String questionContents;
	private Date questionDate;
	private String questionKind;
	
	
	
	
	
	
}
