package com.monkey.coffee.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.monkey.coffee.vo.UserVO;

@Mapper
public interface UserMapper {
	public UserVO searchUserID(UserVO vo);
	public UserVO userLogin(UserVO vo);
	
	//�����ϸ� 1�̻�
	//���н� 0
	public int insertUser(UserVO vo);
}