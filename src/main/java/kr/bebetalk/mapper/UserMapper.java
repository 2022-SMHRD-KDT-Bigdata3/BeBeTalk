package kr.bebetalk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.bebetalk.entity.User;

public interface UserMapper {
	
	// 로그인
	@Select("select * from UserTable where UserID=#{userID} and UserPassword=#{userPassword}")
	public User loginCheck(User vo);
	
	// 회원가입
	@Insert("insert into UserTable(UserID, UserPassword, UserName, UserEmail) values(#{userID}, #{userPassword}, #{userName}, #{userEmail})")
	public void join(User vo);
		
}
