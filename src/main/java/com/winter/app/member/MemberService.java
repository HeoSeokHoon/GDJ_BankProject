package com.winter.app.member;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.winter.app.board.BoardFileDTO;
import com.winter.app.util.FileManager;
import com.winter.app.util.TagManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private TagManager tg;
	
	@Autowired
	private FileManager fileManager;
	
	public MemberDTO getDetail(MemberDTO memberDTO) throws Exception{
		return memberDAO.getDetail(memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO) throws Exception {
		memberDTO = tg.tagManager(memberDTO);
		int result = memberDAO.setUpdate(memberDTO);
		return result;
	}
	
	public int setMember(MemberDTO memberDTO, MultipartFile file) throws Exception{
		memberDTO = tg.tagManager(memberDTO);
		int result = memberDAO.setMember(memberDTO);
		
		String path = servletContext.getRealPath("/resources/upload/member");
		if(file!=null) {
			String fileName = fileManager.fileSave(path, file);
			MemberFileDTO FileDTO = new MemberFileDTO();
			FileDTO.setFileName(fileName);
			FileDTO.setOriName(file.getOriginalFilename());
			FileDTO.setUserName(memberDTO.getUserName());
			result = memberDAO.setFileAdd(FileDTO);
			System.out.println("path:"+path);
		}
		
		
		return result;
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO)throws Exception{
		MemberDTO m = memberDAO.getDetail(memberDTO);
		if(m!=null) {
			if(m.getPassword().equals(memberDTO.getPassword())) {
				return memberDTO;
			}else {
				m=null;
			}
		}
		
		return m;
	}
}
