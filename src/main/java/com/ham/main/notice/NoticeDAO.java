package com.ham.main.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSession sqlSession;
	private final String NAMESPACE = "com.ham.main.notice.NoticeDAO.";
	
	
	public List<NoticeDTO> getList() throws Exception{
		
		return sqlSession.selectList(NAMESPACE + "getList");
	}
	
	public NoticeDTO getDetail(NoticeDTO noDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE + "getDetail", noDTO);
	}
	
}
