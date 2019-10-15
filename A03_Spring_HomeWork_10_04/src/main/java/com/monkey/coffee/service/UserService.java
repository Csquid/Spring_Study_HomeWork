package com.monkey.coffee.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.monkey.coffee.mapper.UserMapper;
import com.monkey.coffee.vo.UserVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserService {
	
	private UserMapper mapper;
	
	public ArrayList<UserVO> searchUsersService() {
		return mapper.searchUsers();
	}
	public UserVO searchUserIDService(UserVO vo) {
		return mapper.searchUserID(vo);
	}
	public UserVO searchUserNameService(UserVO vo) {
		return mapper.searchUserName(vo);
	}
	public ArrayList<UserVO> searchUserRoleEquals(String keyword) {
		return mapper.searchUserRoleEquals(keyword);
	}
	public UserVO userLoginService(UserVO vo) {
		return mapper.userLogin(vo);
	}
	public int insertUser(UserVO vo) {
		return mapper.insertUser(vo);
	}
}
