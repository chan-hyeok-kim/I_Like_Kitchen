package com.ham.main.question;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class QuestionDTO {

	private Long questionNum;
	private Long productNum;
	private String id;
	private String questionContents;
	private Date questionDate;
	private String questionKind;
	private Long replyNum;
	private String replyContents;
	private Date replyDate;
	private Long ref;
	private Long step;
	private Long depth;
	
}
