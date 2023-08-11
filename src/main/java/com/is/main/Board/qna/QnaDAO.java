package com.is.main.Board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.is.main.Board.BoardDAO;
import com.is.main.Board.BoardDTO;
import com.is.main.util.Pager;
@Repository
public class QnaDAO implements BoardDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE="com.is.main.Board.qna.QnaDAO."; 
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+"getDetail", boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(NAMESPACE+"setAdd", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public Long getTotal(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+"getTotal", pager);
	}

	@Override
	public int setHitUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int setFileAdd(QnaFileDTO qnaFileDTO)throws Exception{
		return session.insert(NAMESPACE+"setFileAdd", qnaFileDTO);
	}
	
	public int setReplyAdd(QnaDTO qnaDTO)throws Exception{
		System.out.println("setReplyAdd");
		return session.insert(NAMESPACE+"setReplyAdd", qnaDTO);
	}
	
	public int setStepUpdate(QnaDTO qnaDTO)throws Exception{
		return session.update(NAMESPACE +"setStepUpdate", qnaDTO);
	}

	
	
}