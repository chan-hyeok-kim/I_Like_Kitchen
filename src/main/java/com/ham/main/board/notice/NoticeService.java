package com.ham.main.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.board.BoardDAO;
import com.ham.main.board.BoardDTO;
import com.ham.main.board.BoardService;
import com.iu.main.bankbook.BankBookFileDTO;
import com.iu.main.file.FileDTO;
import com.iu.main.member.MemberDTO;
import com.iu.main.util.FileManager;
import com.iu.main.util.Pager;

@Service
public class NoticeService implements BoardService {
	@Autowired
	private NoticeDAO noDAO;
	@Autowired
	private FileManager fileManager;
	
	
	public boolean setContentsImgDelete(String path, HttpSession session) throws Exception {
		FileDTO fileDTO = new FileDTO();
		path = path.substring(0, path.lastIndexOf("/") + 1);
		fileDTO.setFileName(path.substring(path.lastIndexOf("/") + 1));
		
		return fileManager.fileDelete(fileDTO, path, session);
	}
	
	public String setContentsImg(MultipartFile file, HttpSession session) throws Exception {
		String path = "/resources/upload/board/";
		String fileName = fileManager.fileSave(path, session, file);
		
		return path + fileName; 
	}
	
	public int setFileDelete(NoticeFileDTO noFileDTO, HttpSession session) throws Exception{
		noFileDTO = noDAO.getFileDetail(noFileDTO);			// 폴더 파일 삭제
		boolean flag = fileManager.fileDelete(noFileDTO, "/resources/upload/board/", session);
		
		if(flag) {
			return noDAO.setFileDelete(noFileDTO);				// DB 삭제
		}
		
		return 0;
	}
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(noDAO.getTotal(pager));
		
		return noDAO.getList(pager);
	}
	
	@Override
	public BoardDTO getDetail(BoardDTO boDTO) throws Exception {
		// TODO Auto-generated method stub
		return noDAO.getDetail(boDTO);
	}

	@Override
	public int setAdd(BoardDTO boDTO, MultipartFile[] files, HttpSession session) throws Exception {
		boDTO.setWriter(((MemberDTO)session.getAttribute("member")).getId());		// 작성자 를 로그인한 id로 설정
		String path = "/resources/upload/board/";
	
		int result = noDAO.setAdd(boDTO);
		
		for(MultipartFile file: files) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				NoticeFileDTO noFileDTO = new NoticeFileDTO();
				
				noFileDTO.setBoardNum(boDTO.getBoardNum());
				noFileDTO.setFileName(fileName);
				noFileDTO.setOriginalName(file.getOriginalFilename());
				
				result = noDAO.setFileAdd(noFileDTO);
			}
		}
		
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = noDAO.setUpdate(boDTO); 
		String path = "/resources/upload/board/";
		
		for(MultipartFile file: files) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				NoticeFileDTO noFileDTO = new NoticeFileDTO();
				
				noFileDTO.setBoardNum(boDTO.getBoardNum());
				noFileDTO.setFileName(fileName);
				noFileDTO.setOriginalName(file.getOriginalFilename());
				
				result = noDAO.setFileAdd(noFileDTO);
			}
		}
		
		return result; 
	}

	@Override
	public int setDelete(BoardDTO boDTO) throws Exception {
		// TODO Auto-generated method stub
		return noDAO.setDelete(boDTO);
	}


	/*
	public List<BoardDTO> getList(Pager pager) throws Exception{
		Long total = boDAO.getTotal(pager);
		
		pager.makeRowNum();
		pager.makePageNum(total);
		
		return boDAO.getList(pager);
	}
	
	public int setAdd(NoticeDTO boDTO) throws Exception {
		
		return boDAO.setAdd(boDTO);
	}
	
	public BoardDTO getDetail(BoardDTO boDTO) throws Exception {
		
		return boDAO.getDetail(boDTO);
	}
	
	public int setUpdate(NoticeDTO boDTO) throws Exception {
		
		return boDAO.setUpdate(boDTO);
	}
	
	public int setDelete(NoticeDTO boDTO) throws Exception {
		
		return boDAO.setDelete(boDTO);
	}
	*/
	
}
