package com.monkey.coffee.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.monkey.coffee.vo.UserVO;

@Mapper
public interface UserMapper {
	public UserVO searchUserID(UserVO vo);
	public UserVO userLogin(UserVO vo);
	
	//성공하면 1이상
	//실패시 0
	public int insertUser(UserVO vo);
}
