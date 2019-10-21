package com.monkey.coffee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.monkey.coffee.controller.AdminPageController;
import com.monkey.coffee.mapper.UserMapper;
import com.monkey.coffee.vo.UserVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	private UserMapper mapper;
	
	public ArrayList<UserVO> searchUsersAllService() {
		return mapper.searchUsersAll();
	}
	public UserVO searchUserIDService(UserVO vo) {
		return mapper.searchUserID(vo);
	}
	public UserVO searchUserNameService(UserVO vo) {
		return mapper.searchUserName(vo);
	}
	public ArrayList<UserVO> searchUsersService(String searchType, String keyword) {
		return mapper.searchUser(searchType, keyword);
	}
	public ArrayList<UserVO> searchUserSortService(String toSort, String formatSort) {
		return mapper.searchUserSort(toSort, formatSort);
	}
	public UserVO userLoginService(UserVO vo) {
		return mapper.userLogin(vo);
	}
	public int insertUser(UserVO vo) {
		return mapper.insertUser(vo);
	}
}
