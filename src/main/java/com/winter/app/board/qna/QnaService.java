package com.winter.app.board.qna;

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
import com.winter.app.util.TagManager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	@Qualifier("qnaDAO")
	private QnaDAO boardDAO;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private TagManager tg;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		List<BoardDTO> ar = boardDAO.getList(pager);
		for(BoardDTO boardDTO:ar) {
			boardDTO = tg.tagManager(boardDTO);
		}
		Long totalCount=boardDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		return ar;
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return boardDAO.getDetail(boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] attachs) throws Exception {
		boardDTO = tg.tagManager(boardDTO);
		int result = boardDAO.setAdd(boardDTO);
		
		String path = servletContext.getRealPath("/resources/upload/qna");
		for(MultipartFile f:attachs) {
			if(f.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, f);
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(f.getOriginalFilename());
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = boardDAO.setFileAdd(boardFileDTO);
		}
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] attachs) throws Exception {
		boardDTO = tg.tagManager(boardDTO);
		int result = boardDAO.setUpdate(boardDTO);
		return result;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		//1. file을 삭제
		List<BoardFileDTO> files = boardDAO.getFileList(boardDTO);
		String path = servletContext.getRealPath("/resources/upload/qna");
		for(BoardFileDTO b:files) {
			fileManager.fileDelete(path, b.getFileName());
		}
		//2. file table의 정보 삭제
		int result = boardDAO.setFileDelete(boardDTO);
		//3. qna 정보를 수정
		
		result = boardDAO.setDelete(boardDTO);
		return result;
	}
	
	//reply
	public int setReply(QnaDTO qnaDTO)throws Exception{
		//boardNum : 부모의 글번호
		//boardTitle : 답글제목
		//boardWriter : 답글작성자
		//boardContents : 답글내용
		
		//1. 부모의 정보 조회(REF, STEP, DEPTH)
		QnaDTO parent = (QnaDTO)boardDAO.getDetail(qnaDTO);
		
		//2. 답글 정보 저장(REF, STEP, DEPTH)
		qnaDTO.setBoardRef(parent.getBoardRef());
		qnaDTO.setBoardStep(parent.getBoardStep()+1);
		qnaDTO.setBoardDepth(parent.getBoardDepth()+1);

		//3. step을 업데이트
		int result = boardDAO.setReplyUpdate(qnaDTO); 
				
		//4. DB에 답글을 저장
		result = boardDAO.setReplyAdd(qnaDTO);
		return result;
	}

}
