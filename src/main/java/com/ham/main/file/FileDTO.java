package com.ham.main.file;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


public class FileDTO {
	
	private Long fileNum;
	private String fileName;
	private String originalName;
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	

	

}
