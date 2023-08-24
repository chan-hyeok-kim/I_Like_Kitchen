package com.ham.main.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.util.FileManager;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noDAO;
	@Autowired
	private FileManager fileManager;
	
	
	public List<NoticeDTO> getList() throws Exception{
		
		return noDAO.getList();
	}
	
	public NoticeDTO getDetail(NoticeDTO noDTO) throws Exception{
		
		return noDAO.getDetail(noDTO);
	}
	
	public int setAdd(NoticeDTO noDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = noDAO.setAdd(noDTO);
		
		String path = "/resources/upload/notice/";
		
		for(MultipartFile file: files) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				NoticeFileDTO noFileDTO = new NoticeFileDTO();
				
				noFileDTO.setNoticeNum(noDTO.getNoticeNum());
				noFileDTO.setFileName(fileName);
				noFileDTO.setOriginalName(file.getOriginalFilename());
				
				result = noDAO.setFileAdd(noFileDTO);
			}
		}
		
		return result;
	}
	
	public int setUpdate(NoticeDTO noDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = noDAO.setUpdate(noDTO);
		
		String path = "/resources/upload/notice/";
		
		for(MultipartFile file: files) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				NoticeFileDTO noFileDTO = new NoticeFileDTO();
				
				noFileDTO.setNoticeNum(noDTO.getNoticeNum());
				noFileDTO.setFileName(fileName);
				noFileDTO.setOriginalName(file.getOriginalFilename());
				
				result = noDAO.setFileAdd(noFileDTO);
			}
		}
		
		return result;
	}
	
	public int setDelete(NoticeDTO noDTO) throws Exception{
		
		return noDAO.setDelete(noDTO);
	}
	
	// file(파일)
	public int setFileDelete(NoticeFileDTO noFileDTO, HttpSession session) throws Exception {
		noFileDTO = noDAO.getFileDetail(noFileDTO);
		boolean flag = fileManager.fileDelete(noFileDTO, "/resources/upload/notice", session);
		
		if(flag) {
			return noDAO.setFileDelete(noFileDTO);
		}
		
		return 0;
	}
	
	
	
}
