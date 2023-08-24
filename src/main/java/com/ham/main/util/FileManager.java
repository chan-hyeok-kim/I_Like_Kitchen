package com.ham.main.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.notice.NoticeFileDTO;

@Component
public class FileManager {
	
	public String fileSave(String path, HttpSession session, MultipartFile multipartFile) throws Exception {
		String realPath = session.getServletContext().getRealPath(path);
		
		File file = new File(realPath);
		System.out.println(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String uId = UUID.randomUUID().toString();
		uId = uId + "_" + multipartFile.getOriginalFilename();
		
		file = new File(file, uId);
		
		multipartFile.transferTo(file);
		
		return uId;
	}
	
	
	public boolean fileDelete(NoticeFileDTO noFileDTO, String path, HttpSession session) {
		path = session.getServletContext().getRealPath(path);
		File file = new File(path, noFileDTO.getFileName());
		
		return file.delete(); 
	}

}
