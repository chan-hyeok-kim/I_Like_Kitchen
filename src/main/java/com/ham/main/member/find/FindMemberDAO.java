package com.ham.main.member.find;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.member.MemberDTO;

@Repository
public class FindMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO getMemberId(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("com.ham.main.member.find.FindMemberDAO.getMemberId", memberDTO);
	}
	
	public MemberDTO findMemberByIdAndEmail(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("com.ham.main.member.find.FindMemberDAO.findMemberByIdAndEmail", memberDTO);
	}
	
	public int setUpdatePassword(MemberDTO memberDTO) throws Exception {
		return sqlSession.update("com.ham.main.member.find.FindMemberDAO.setUpdatePassword", memberDTO);
	}
}
