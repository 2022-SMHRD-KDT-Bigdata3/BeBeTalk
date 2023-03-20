package kr.bebetalk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.bebetalk.entity.ResultText;

public interface ResultTextMapper {
	
	// 메인 문장 가져오기
	@Select("SELECT * FROM ResultText WHERE TextCategory = 'main' ORDER BY RAND() LIMIT 1;")
	public ResultText getMainText();

	// 솔루션 상 문장 가져오기
	@Select("SELECT * FROM ResultText WHERE TextCategory = 'solHigh' ORDER BY RAND() LIMIT 1;")
	public ResultText getHighText();

	// 솔루션 하 문장 가져오기
	@Select("SELECT * FROM ResultText WHERE TextCategory = 'solLow' ORDER BY RAND() LIMIT 1;")
	public ResultText getLowText();
}