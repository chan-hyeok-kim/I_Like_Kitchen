package com.ham.main.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.iu.main.util.Pager;

public interface BoardService {

	//List
	public List<BoardDTO> getList(Pager pager) throws Exception;
	
	//Detail
	public BoardDTO getDetail(BoardDTO boDTO) throws Exception;
	
	//Add
	public int setAdd(BoardDTO boDTO, MultipartFile[] file, HttpSession session) throws Exception;
	
	//Update
	public int setUpdate(BoardDTO boDTO, MultipartFile[] files, HttpSession session) throws Exception;
	
	//Delete
	public int setDelete(BoardDTO boDTO) throws Exception;
	
	//totalCount
//	public Long getTotal(Pager pager) throws Exception;
//	
//	//조회수 업데이트
//	public int setHitUpdate(BoardDTO boDTO) throws Exception;
	
}
