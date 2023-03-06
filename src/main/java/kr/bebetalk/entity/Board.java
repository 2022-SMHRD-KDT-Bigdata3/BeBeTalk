package kr.bebetalk.entity;

import java.util.Date;

import lombok.Data;

// Lombol API 연결
@Data
public class Board {

	
	private int idx; //번호
	private String title; //제목
	private String content; //내용
	private String writer; //작성자
	private Date indate; //작성일
	private int count; //조회수
	
	
}
