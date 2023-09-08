package com.ham.main.review;

import java.sql.Date;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class ReviewDTO{

	private Long reviewNum;
	private Long productNum;
	private String id;
	private String reviewContents;
	private Date reviewDate;
	private Long reviewRate;
	private List<ReviewDTO> ktos;
	
//	private Long replyNum;
//	private String replyContents;
//	private Date replyDate;
//	private Long ref;
//	private Long step;
//	private Long depth;
	

	
}
