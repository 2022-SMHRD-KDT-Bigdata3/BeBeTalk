package kr.bebetalk.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

// Lombok API 연결
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {
	private String userID; // 유저 아이디
	private String userPassword; // 유저 비밀번호
	private String userName; // 유저 이름
	private String userEmail; // 유저 이메일	
}
