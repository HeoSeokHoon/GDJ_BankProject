package com.winter.app.board.notice;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.winter.app.board.BoardDAO;
import com.winter.app.board.BoardDTO;
import com.winter.app.board.BoardFileDTO;
import com.winter.app.board.BoardService;
import com.winter.app.util.FileManager;
import com.winter.app.util.Pager;

@Service
public class NoticeService implements BoardService {
	
	@Autowired
	@Qualifier("noticeDAO") //bean의 이름 지정
	private NoticeDAO boardDAO; //boardDAO 타입은 notice와 qna 2개가 있음, 빈의 이름으로 구분
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private ServletContext servletContext;

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.setPerPage(5L);
		pager.makeRow();
		System.out.println(pager.getStartRow());
		System.out.println(pager.getLastRow());
		Long totalCount=boardDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		return boardDAO.getList(pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return boardDAO.getDetail(boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile [] attachs) throws Exception {
		//1. 글을 등록 - 글번호를 알아오기 위해
		int result = boardDAO.setAdd(boardDTO);
		
		//2. 파일을 HDD에 저장
		//2-1 저장할 폴더의 실세 경로 조회
		String path = servletContext.getRealPath("/resources/upload/notice");
		//2-2 HDD에 저장하고 파일명 받아오기
		for(MultipartFile f:attachs) {
			
			if(f.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, f);
		//2-3 DB에 정보 저장하기
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(f.getOriginalFilename());
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = boardDAO.setFileAdd(boardFileDTO);
			System.out.println(path);
		}
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] attachs) throws Exception {
		
		return boardDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		List<BoardFileDTO> files = boardDAO.getFileList(boardDTO);
		String path = servletContext.getRealPath("/resources/upload/notice");
		for(BoardFileDTO b:files) {
			fileManager.fileDelete(path, b.getFileName());
		}
		int result = boardDAO.setDelete(boardDTO);
		
		return result;
	}
	
	
}
