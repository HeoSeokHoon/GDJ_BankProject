package com.winter.app.wishlist;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.winter.app.account.AccountDTO;

@Repository
public class WishListDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String nameSpace="com.winter.app.wishlist.WishListDAO.";
	
	public int setAdd(AccountDTO accountDTO)throws Exception {
		return sqlSession.insert(nameSpace+"setAdd",accountDTO);
	}
}
