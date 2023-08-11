package com.ham.main.board;

import java.util.List;

import com.iu.main.util.Pager;

public interface BoardDAO {

	//total
	public Long getTotal(Pager pager) throws Exception;
	
	//List
	public List<BoardDTO> getList(Pager pager) throws Exception;
	
	//Detail
	public BoardDTO getDetail(BoardDTO boDTO) throws Exception;
	
	//Add
	public int setAdd(BoardDTO boDTO) throws Exception;
	
	//Update
	public int setUpdate(BoardDTO boDTO) throws Exception;
	
	//Delete
	public int setDelete(BoardDTO boDTO) throws Exception;
	
	//HitUpadate
	public int setHitUpdate(BoardDTO boDTO) throws Exception;
	
	//totalCount
//	public Long getTotal(Pager pager) throws Exception;
//	
//	//조회수 업데이트
//	public int setHitUpdate(BoardDTO boDTO) throws Exception;
	
	
}
