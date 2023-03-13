package kr.bebetalk.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.entity.Board;
import kr.bebetalk.mapper.BoardMapper;



@Controller  //POJO로 인식하기위해서 anotation을 붙여준다! 
public class BoardController {
	
	
	
	
	@Autowired //메모리에 만들어진 객체들중 자동으로 연결시키는 anotation
	private BoardMapper mapper;
	
	//!!!!!!게시글 전체 불러오기
		// /boardList.do --> Method
		@RequestMapping("/boardList.do")
		public String boardList(HttpServletRequest request) { // 메소드명은 자유! flexible
			// DB연동 --> 게시판 전체리스트가져오기
			
			System.out.println("1");
			List<Board> list = mapper.boardList();
			System.out.println("2");
			
			request.setAttribute("list", list);
			// 객체바인딩
			return "boardList"; // /WEB-INF/view/boardList.jsp
		}
		
		
		
		//!!!!!게시물등록
		//post방식으로 보낸 걸 받아주는 매핑
		@PostMapping("/dataInsert.do")
		public String register(Board vo) { //파라미터수집(VO
		//spring 은 vo를 보고 알아서 파라미터가 수집이 된다 	
			mapper.datainsert(vo); //저장성공
			System.out.println("!성공!");
			// 다시 /boardList.do 페이지로 이동해줘야함
			return "redirect:/boardList.do";
			// redirect: 가 있기 때문에 jsp로 가지 않는다
		}
		
		
		
		// 나중에 index 만들면 지워야함 // 
		@RequestMapping("/main.do")
		public String main() {
			return "main";
		}
		
		@RequestMapping("/join.do")
		public String join() {
			return "join";
		}
		
		@RequestMapping("/login.do")
		public String login() {
			return "login";
		}
		
		// 나중에 index 만들면 지워야함 // 
	
}
