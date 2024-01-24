package com.winter.app.wishlist;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winter.app.account.AccountDTO;
import com.winter.app.member.MemberDTO;

@Controller
@RequestMapping("/wishlist/*")
public class WishListController {

	@Autowired
	private WishListService wsListService;
	
	@GetMapping("add")
	public String setAdd(HttpSession session, AccountDTO accountDTO, Model model) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		accountDTO.setUserName(memberDTO.getUserName());
		int result = wsListService.setAdd(accountDTO);
		
		model.addAttribute("result",result);
		
		return "commons/ajaxResult";
	}
	
}
