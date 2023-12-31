package com.ham.main.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.util.Pager;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ham.main.notice.NoticeDAO.";
	
	
	public Long getTotal() {
		
		return sqlSession.selectOne(NAMESPACE + "getTotal");
	}
	
	public List<NoticeDTO> getList(Pager pager) throws Exception{
		
		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}
	
	public NoticeDTO getDetail(NoticeDTO noDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE + "getDetail", noDTO);
	}
	
	public int setAdd(NoticeDTO noDTO) {
		
		return sqlSession.insert(NAMESPACE + "setAdd", noDTO);
	}
	
	public int setUpdate(NoticeDTO noDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE + "setUpdate", noDTO);
	}
	
	public int setDelete(NoticeDTO noDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE + "setDelete", noDTO);
	}
	
	// file(파일)
	public int setFileAdd(NoticeFileDTO noFileDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE + "setFileAdd", noFileDTO);
	}
	
	public NoticeFileDTO getFileDetail(NoticeFileDTO noFileDTO) {
		
		return sqlSession.selectOne(NAMESPACE + "getFileDetail", noFileDTO);
	}
	
	public int setFileDelete(NoticeFileDTO noFileDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE + "setFileDelete", noFileDTO);
	}
	
}
