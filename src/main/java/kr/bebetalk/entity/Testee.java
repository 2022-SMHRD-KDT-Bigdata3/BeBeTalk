package kr.bebetalk.entity;

import lombok.Data;

// Lombok API 연결
@Data
public class Testee {
	private String testeeNum; // 피검사자 번호
	private String testeeID; // 보호자 아이디
	private String testKidsNick; // 피검사자 닉네임(아이 애칭)
	private String testeeBirth; // 피검사자 생년
	private String testeeSex; // 피검사자 성별
}
