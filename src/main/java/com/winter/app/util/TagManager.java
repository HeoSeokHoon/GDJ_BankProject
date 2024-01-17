package com.winter.app.util;

import org.springframework.stereotype.Component;

import com.winter.app.board.BoardDTO;

@Component
public class TagManager {
	
	public BoardDTO tagManager(BoardDTO boardDTO) throws Exception{
		String head = boardDTO.getBoardHead();
		String writer = boardDTO.getBoardWriter();
		
		boardDTO.setBoardHead(head.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		boardDTO.setBoardWriter(writer.replaceAll(">", "&gt").replaceAll("<", "&lt"));
		System.out.println(head);
		return boardDTO;
	}
}
