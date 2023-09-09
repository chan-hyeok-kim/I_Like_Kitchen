package com.ham.main.notice;

import java.sql.Date;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class NoticeDTO {

	private String id;
	private Long noticeNum;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeDate;
	private Integer vitalCheck;
	private List<NoticeFileDTO> ktos;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(Long noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public Integer getVitalCheck() {
		return vitalCheck;
	}
	public void setVitalCheck(Integer vitalCheck) {
		this.vitalCheck = vitalCheck;
	}
	public List<NoticeFileDTO> getKtos() {
		return ktos;
	}
	public void setKtos(List<NoticeFileDTO> ktos) {
		this.ktos = ktos;
	}
	

}

