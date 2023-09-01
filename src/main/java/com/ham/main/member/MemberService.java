package com.ham.main.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.util.FileManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memDAO;
	@Autowired
	FileManager fileManager;
	
	
	
	
	
	public MemberDTO getCheckInfo(MemberDTO memDTO) throws Exception{
		
		return memDAO.getCheckInfo(memDTO);
	}
	
	public int setUpdate(MemberDTO memDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = memDAO.setUpdate(memDTO);
		
		String path = "/resources/upload/member/";
		
		for(MultipartFile file: files) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				MemberFileDTO memFileDTO = new MemberFileDTO();
				
				memFileDTO.setId(memDTO.getId());
				memFileDTO.setFileName(fileName);
				memFileDTO.setOriginalName(file.getOriginalFilename());
				
				result = memDAO.setFileAdd(memFileDTO);
			}
		}
		
		return result;
	}
	
	public int setDelete(MemberDTO memDTO) throws Exception{
		
		return memDAO.setDelete(memDTO);
	}

}
