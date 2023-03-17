package kr.bebetalk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.entity.User;
import kr.bebetalk.mapper.UserMapper;

@Controller
public class LoginController {
	
	@Autowired
	private UserMapper mapper;
	
	@GetMapping("/main.do")
	public String main() {
		return "main/main"; // login.jsp로 연결
	}
	
	@GetMapping("/login.do")
	public String BeforeLogin() {
		return "main/login"; // login.jsp로 연결
	}
	
	@PostMapping("/login.do")
	public String login(User vo, HttpSession session) { // UserID, UserPassword 받아주기
		User uvo = mapper.loginCheck(vo);
		if(uvo != null) { // 로그인 성공했을 시에만 로그인 정보 session에 저장
			session.setAttribute("uvo", uvo);
			System.out.println("로그인 완료");
			return "redirect:/main.do";
		}else {
			return "redirect:/login.do";
		}
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "main/join"; // join.jsp로 연결
	}
	
//	@PostMapping("/checkId.do")
//	public String 
	
	@PostMapping("/join.do")
	public String join(User vo) {
		System.out.println("id : " + vo.getUserID());
		System.out.println("pw : " + vo.getUserPassword());
		System.out.println("name : " + vo.getUserName());
		System.out.println("email : " + vo.getUserEmail());
		
		mapper.join(vo);
		
		System.out.println("회원가입 성공");
		
		return "main/login";
	}
	
	@PostMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
}
