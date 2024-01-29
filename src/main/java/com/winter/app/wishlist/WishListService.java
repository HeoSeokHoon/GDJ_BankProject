package com.winter.app.wishlist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winter.app.account.AccountDTO;
import com.winter.app.member.MemberDTO;
import com.winter.app.product.ProductDAO;
import com.winter.app.product.ProductDTO;
import com.winter.app.util.Pager;

@Service
public class WishListService {

	@Autowired
	private WishListDAO wsListDAO;
	
	public int setAdd(AccountDTO accountDTO)throws Exception{
		return wsListDAO.setAdd(accountDTO);
	}
	
	public List<ProductDTO> getList(MemberDTO memberDTO, Pager pager)throws Exception {
		pager.setSearch(memberDTO.getUserName());
		pager.makeRow();
		Long totalCount = wsListDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		
		return wsListDAO.getList(pager);
	}
	
	public int setDelete(Long[] productNum, MemberDTO memberDTO)throws Exception{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("nums", productNum);
			map.put("member", memberDTO);
		return wsListDAO.setDelete(map);
	}
}
