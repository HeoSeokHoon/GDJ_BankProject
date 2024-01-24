package com.winter.app.wishlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.account.AccountDTO;

@Service
public class WishListService {

	@Autowired
	private WishListDAO wsListDAO;
	
	public int setAdd(AccountDTO accountDTO)throws Exception{
		return wsListDAO.setAdd(accountDTO);
	}
}
