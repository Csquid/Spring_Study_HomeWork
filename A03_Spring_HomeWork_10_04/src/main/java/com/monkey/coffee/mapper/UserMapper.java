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
	 * mapper.xml���� �ش� �Ű������� ���� ����������� @Param���� ����������Ѵ�.
	 * TODO: ���̵忡 �߰��Ұ�
	 * 
	 */
	
	public ArrayList<UserVO> searchUserSort(@Param("toSort") String toSort,@Param("formatSort") String formatSort);
	
	public UserVO userLogin(UserVO vo);

	// �����ϸ� 1�̻�
	// ���н� 0
	public int insertUser(UserVO vo);
}
