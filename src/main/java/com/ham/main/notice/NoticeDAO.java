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
