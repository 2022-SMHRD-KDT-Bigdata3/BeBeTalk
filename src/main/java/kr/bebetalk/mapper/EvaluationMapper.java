package kr.bebetalk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import kr.bebetalk.entity.Evaluation;
import kr.bebetalk.entity.EvaluationResult;
import kr.bebetalk.entity.Testee;

public interface EvaluationMapper {
	
	// 평가 추가
	@Select("insert into EvaluationTable(EvaluationDate, EvaluationName) values(NOW(), #{evaluationName})")
	public void newEva(String ev);
	
	// 지금 평가하는 애기 정보 가져오기
	public Evaluation getEva(String selectedValue);

	// 이전 결과 불러오기
	public List<Evaluation> evList(Testee tt);

	// 아이 삭제를 위한 테스트 기록 삭제
	@Delete("DELETE FROM EvaluationTable WHERE EvaluationName = #{testKidsNick}")
	public void testDelete(String testKidsNick);
	
	// 검사 결과 업데이트 - 메인
	public void upMain(EvaluationResult evResMain);
	
	// 검사 결과 업데이트 - 서브
	public void upSub(EvaluationResult evResSub);
	

}