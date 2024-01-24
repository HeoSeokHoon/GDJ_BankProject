package com.winter.app.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.winter.app.board.BoardFileDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String nameSpace = "com.winter.app.member.MemberDAO.";
	
	public int setUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(nameSpace+"setUpdate",memberDTO);
	}
	
	public int setMember(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(nameSpace+"setMember",memberDTO);
	}
	
	public int setFileAdd(MemberFileDTO FileDTO)throws Exception {
		return sqlSession.insert(nameSpace+"setFileAdd", FileDTO);
	}
	
	public MemberDTO getDetail(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(nameSpace+"getDetail",memberDTO);
	}
	
}
