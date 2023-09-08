package com.ham.main.notice;

import com.ham.main.file.FileDTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class NoticeFileDTO extends FileDTO {

	private Long noticeNum;
	
}
