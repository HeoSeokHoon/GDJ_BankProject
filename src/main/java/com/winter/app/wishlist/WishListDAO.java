package com.winter.app.wishlist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.winter.app.account.AccountDTO;
import com.winter.app.member.MemberDTO;
import com.winter.app.product.ProductDTO;
import com.winter.app.util.Pager;

@Repository
public class WishListDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String nameSpace="com.winter.app.wishlist.WishListDAO.";
	
	public int setAdd(AccountDTO accountDTO)throws Exception {
		return sqlSession.insert(nameSpace+"setAdd",accountDTO);
	}
	
	public List<ProductDTO> getList(Pager pager)throws Exception {
		return sqlSession.selectList(nameSpace+"getList", pager);
	}
	
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(nameSpace+"getTotalCount", pager);
	}
	
	public int setDelete(Map<String, Object> map)throws Exception {
		return sqlSession.delete(nameSpace+"setDelete",map);
	}
}
