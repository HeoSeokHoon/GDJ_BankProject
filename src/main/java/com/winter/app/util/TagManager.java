package com.winter.app.util;

import org.springframework.stereotype.Component;

import com.winter.app.board.BoardDTO;
import com.winter.app.member.MemberDTO;

@Component
public class TagManager {
	
	public BoardDTO tagManager(BoardDTO boardDTO) throws Exception{
		String head = boardDTO.getBoardHead();
		String writer = boardDTO.getBoardWriter();
		
		boardDTO.setBoardHead(head.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		boardDTO.setBoardWriter(writer.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		return boardDTO;
	}
	
	public MemberDTO tagManager(MemberDTO memberDTO) throws Exception{
		String userName = memberDTO.getUserName();
		String password = memberDTO.getPassword();
		String name = memberDTO.getName();
		String phone = memberDTO.getPhone();
		String email = memberDTO.getEmail();
		String address = memberDTO.getAddress();
		
		memberDTO.setUserName(userName.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		if(password!=null) {
			memberDTO.setPassword(password.replaceAll(">", "&gt").replaceAll("<", "&lt"));			
		}
		memberDTO.setName(name.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		memberDTO.setPhone(phone.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		memberDTO.setEmail(email.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		memberDTO.setAddress(address.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		
		return memberDTO;
	}
}
