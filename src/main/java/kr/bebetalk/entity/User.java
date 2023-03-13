package kr.bebetalk.entity;

import lombok.Data;

// Lombol API 연결
@Data
public class User {
	private String UserID; // 유저 아이디
	private String UserPassword; // 유저 비밀번호
	private String UserName; // 유저 이름
	private String UserEmail; // 유저 이메일	
}
