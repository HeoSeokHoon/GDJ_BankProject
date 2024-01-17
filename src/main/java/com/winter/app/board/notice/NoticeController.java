package com.winter.app.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.winter.app.board.BoardDTO;
import com.winter.app.board.BoardService;
import com.winter.app.board.qna.QnaDTO;
import com.winter.app.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	private BoardService boardService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}
	
	@ModelAttribute("bbs")
	public Integer getKind() {
		return 0;
	}
	
	//list
	//@RequestMapping(value = "list", method = RequestMethod.GET)
	@GetMapping("list")
	public String getList(Pager pager, Model model) throws Exception{
		
		List<BoardDTO> ar = boardService.getList(pager);
		System.out.println(ar.size());
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		return "board/list";
	}
	
	@GetMapping("detail")
	public String getDetail(BoardDTO boardDTO, Model model)throws Exception{
		boardDTO = boardService.getDetail(boardDTO);
		model.addAttribute("boardDTO",boardDTO);
		return "board/detail";
	}
	
	@GetMapping("add")
	public String setAdd() throws Exception {
		return "board/add";
	}
	
	@PostMapping("add")
	public String setAdd(BoardDTO boardDTO, MultipartFile [] attachs) throws Exception {
		int result = boardService.setAdd(boardDTO, attachs);
		return "redirect:./list";
	}
	
	@PostMapping("delete")
	public String setDelete(QnaDTO boardDTO)throws Exception {
		int result = boardService.setDelete(boardDTO);
		return "redirect:./list";
	}
	
	@GetMapping("update")
	public String setUpdate(BoardDTO boardDTO, Model model)throws Exception{
		boardDTO = boardService.getDetail(boardDTO);
		model.addAttribute("boardDTO", boardDTO);
		
		return "board/update";
	}
	
	@PostMapping("update")
	public String setUpdate(BoardDTO boardDTO, MultipartFile[]attachs)throws Exception{
		int result = boardService.setUpdate(boardDTO, attachs);
		
		return "redirect:./detail?boardNum="+boardDTO.getBoardNum();
	}
}
