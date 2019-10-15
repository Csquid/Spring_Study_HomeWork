package com.monkey.coffee.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.monkey.coffee.vo.UserVO;

@Mapper
public interface UserMapper {
	public ArrayList<UserVO> searchUsers();

	public UserVO searchUserID(UserVO vo);

	public UserVO searchUserName(UserVO vo);

	public ArrayList<UserVO> searchUserRoleEquals(String keyword);

	public UserVO userLogin(UserVO vo);

	// �����ϸ� 1�̻�
	// ���н� 0
	public int insertUser(UserVO vo);
}
