package kr.bebetalk.mapper;

import java.util.List;


import kr.bebetalk.entity.Board;

public interface BoardMapper {
	// Connection - DB 연결을 여기서 하지 않음! 
	//				root-context.xml 에서 DB연결 실행
	// CRUD Logic
	public List<Board> boardList(); // SQL연결 : SQL Mapper File
		// 추상메서드 
		//JDBC ,Mybatis 없음!

	public void datainsert(Board vo);

}