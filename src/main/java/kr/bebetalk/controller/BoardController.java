package kr.bebetalk.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
	
}
