package com.winter.app.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String nameSpace="com.winter.app.product.ReplyDAO.";
	
	public int setReply(ReplyDTO replyDTO)throws Exception {
		return sqlSession.insert(nameSpace+"setReply",replyDTO);
	}
	
	public List<ReplyDTO> getList(Map<String, Object> map)throws Exception{
		return sqlSession.selectList(nameSpace+"getList",map);
	}
	
	public Long getTotalCount(ReplyDTO replyDTO)throws Exception{
		return sqlSession.selectOne(nameSpace+"getTotalCount",replyDTO);
	}
	
	public int setDelete(ReplyDTO replyDTO)throws Exception{
		return sqlSession.delete(nameSpace+"setDelete",replyDTO);
	}
	
	public int setUpdate(ReplyDTO replyDTO)throws Exception{
		return sqlSession.update(nameSpace+"setUpdate",replyDTO);
	}
}
