package com.ham.main.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.board.BoardDAO;
import com.ham.main.board.BoardDTO;
import com.iu.main.util.Pager;

@Repository
public class NoticeDAO implements BoardDAO {
	@Autowired
	SqlSession sqlSession;
	private final String NAMESPACE = "com.iu.main.board.notice.NoticeDAO.";

	
	public NoticeFileDTO getFileDetail(NoticeFileDTO noFileDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE + "getFileDetail", noFileDTO);
	}
	
	public int setFileDelete(NoticeFileDTO noFileDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE + "setFileDelete", noFileDTO);
	}
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getDetail", boDTO);
	}

	@Override
	public int setAdd(BoardDTO boDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + "setAdd", boDTO);
	}

	@Override
	public int setUpdate(BoardDTO boDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + "setUpdate", boDTO);
	}

	@Override
	public int setDelete(BoardDTO boDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + "setDelete", boDTO);
	}

	@Override
	public Long getTotal(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getTotal", pager);
	}

	@Override
	public int setHitUpdate(BoardDTO boDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int setFileAdd(NoticeFileDTO noFileDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE + "setFileAdd", noFileDTO);
	}
	
	
	
	
	
	/*
	public Long getTotal(Pager pager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + "getTotal", pager);
	}
	
	public List<NoticeDTO> getList(Pager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}
	
	public int setAdd(NoticeDTO boDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE + "setAdd", boDTO);
	}
	
	public NoticeDTO getDetail(NoticeDTO boDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + "getDetail", boDTO);
	}
	
	public int setUpdate(NoticeDTO boDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE + "setUpdate", boDTO);
	}
	
	public int setDelete(NoticeDTO boDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE + "setDelete", boDTO);
	}
	*/
	
	
}
