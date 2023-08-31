package com.ham.main.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.file.FileDTO;

@Component
public class FIleManager {
	
	
	
	//fileSave
	public static String fileSave(String path, HttpSession session, MultipartFile multipartFile)throws Exception{
	
		
	
		
		
		String realPath = session.getServletContext().getRealPath(path);
		System.out.println(realPath);
		
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		
		String uId =UUID.randomUUID().toString();
		uId = uId+"_"+multipartFile.getOriginalFilename();
		System.out.println(uId);
		file = new File(file, uId);
		
		
		
		
		multipartFile.transferTo(file);
		
		return uId;
		
	}



//fileDelete
public static boolean fileDelete(FileDTO fileDTO,String path, HttpSession session) {
	
	path=session.getServletContext().getRealPath(path);
	
	File file =new File(path, fileDTO.getFileName());
	
	return file.delete();
	
	}
}