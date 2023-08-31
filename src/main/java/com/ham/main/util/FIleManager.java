package com.ham.main.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.ham.main.file.FileDTO;

@Component
public class FIleManager extends AbstractView{
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("FileManager");
		String b = (String)model.get("review");
		FileDTO fileDTO = (FileDTO)model.get("file");
		
		//1. 파일 경로 준비
		String path="/resources/upload/"+b;
		path=request.getSession().getServletContext().getRealPath(path);
		
		//2. File 객체 생성
		File file = new File(path, fileDTO.getFileName());
		
		//3. 파일의 크기 설정
		response.setContentLength((int)file.length());
		
		//4. 다운로드 이름 인코딩 
		String downName = fileDTO.getOriginalName();
		downName = URLEncoder.encode(downName, "UTF-8");
		
		//5. Header 정보 설정
		response.setHeader("Content-Disposition", "attachment;fileName=\""+downName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//6. 전송
		FileInputStream is = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(is, os);
		
		//7. 자원 해제
		os.close();
		is.close();
		
		
	}
	
	
	//fileSave
	public String fileSave(String path, HttpSession session, MultipartFile multipartFile)throws Exception{
	
		
	
		
		
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