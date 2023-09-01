package com.ham.main.notice;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeDTO {

	private String id;
	private Long noticeNum;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeDate;
	private Integer vitalCheck;
	private List<NoticeFileDTO> ktos;
	

}

