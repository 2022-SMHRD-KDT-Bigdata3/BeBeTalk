package kr.bebetalk.entity;

import java.util.Date;

import lombok.Data;

// Lombok API 연결
@Data
public class Evaluation {
	private String evaluationNum; // 평가 번호
	private Date evaluationDate; // 평가 날짜
	private String evaluationName; // 피검사자 닉네임(아이 애칭)
	private String evaluationResult; // 평가 결과
}
