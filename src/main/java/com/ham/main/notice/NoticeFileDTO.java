package com.ham.main.notice;

import com.ham.main.file.FileDTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

public class NoticeFileDTO extends FileDTO {

	private Long noticeNum;

	public Long getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(Long noticeNum) {
		this.noticeNum = noticeNum;
	}
}
