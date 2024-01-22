package com.winter.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("update")
	public void setUpdate (HttpSession session, Model model) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = memberService.getDetail(memberDTO);
		model.addAttribute("member",memberDTO);
	}
	
	@PostMapping("update")
	public String setUpdate (MemberDTO memberDTO, HttpSession session) throws Exception{
		//DB업데이트 후 myPage로 이동
		MemberDTO mDto = (MemberDTO)session.getAttribute("member");
		memberDTO.setUserName(mDto.getUserName());
		int result = memberService.setUpdate(memberDTO);
		
		return "redirect:./mypage";
	}
	
	@GetMapping("mypage")
	public String getMypage(HttpSession session, Model model)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = memberService.getDetail(memberDTO);
		model.addAttribute("member",memberDTO);
		
		return "member/mypage";
	}
	
	@GetMapping("login")
	public String getLogin() throws Exception{
		return "member/login";
	}
	
	@PostMapping("login")
	public String getLogin(MemberDTO memberDTO, HttpSession session, Model model) throws Exception{
		memberDTO = memberService.getLogin(memberDTO);
		if(memberDTO == null) {
			model.addAttribute("msg","ID 또는 PASSWORD를 확인하세요");
			return "member/login";
		}
		session.setAttribute("member", memberDTO);

		return "redirect:../";
	}
	
	@GetMapping("logout")
	public String getLogout(HttpSession session) throws Exception {
		//1. session.setAttribute("member", null);
		//2. session.removeAttribute("member");
		//3. session.removeValue("member"); < 비권장
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("agreement")
	public void setAgreement() throws Exception{
		
	}
	
	@GetMapping("signup")
	public String singUp() throws Exception{
		return "member/signup";
	}
	
	@PostMapping("signup")
	public String signUp(MemberDTO memberDTO, MultipartFile file, Model model) throws Exception{
		int result = memberService.setMember(memberDTO, file);
		String msg="회원가입 실패";
		if(result>0) {
			msg="회원가입 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("path","/");
		
		return "commons/result";
	}
}
