package com.monkey.coffee.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.monkey.coffee.vo.UserVO;

@Mapper
public interface UserMapper {
	public ArrayList<UserVO> searchUsersAll();

	public UserVO searchUserID(UserVO vo);

	public UserVO searchUserName(UserVO vo);

	public ArrayList<UserVO> searchUser(@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	/*
	 * 
	 * mapper.xml에서 해당 매개변수로 값을 집어넣을려면 @Param으로 설정해줘야한다.
	 * TODO: 가이드에 추가할것
	 * 
	 */
	
	public ArrayList<UserVO> searchUserSort(@Param("toSort") String toSort,@Param("formatSort") String formatSort);
	
	public UserVO userLogin(UserVO vo);

	// 성공하면 1이상
	// 실패시 0
	public int insertUser(UserVO vo);
}
