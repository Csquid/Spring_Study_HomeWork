package com.monkey.coffee.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monkey.coffee.service.UserService;
import com.monkey.coffee.vo.UserVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/admin/**")
public class AdminPageController {
	private static final Logger logger = LoggerFactory.getLogger(AdminPageController.class);

	private UserService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		logger.info("AdminPageController /admin/index");
		
		HttpSession session = request.getSession();
		
		if(this.checkSessionUserRole(session) == true) {	
			model.addAttribute("page", "admin");
			
			return "./index";
		} else {
			model.addAttribute("page", "home");
			model.addAttribute("error", "������ �����ϴ�.");
			return "./index";
		}
		
		
	}
	
	@RequestMapping(value = "/user_table", method = RequestMethod.GET)
	public String user_table(Model model, HttpServletRequest request) {
		logger.info("AdminPageController /admin/table");
		
		HttpSession session = request.getSession();
		ArrayList<UserVO> getObject;
		
		//TODO: db �����Ͽ� ���� ���̺� �ҷ�����.
		if(this.checkSessionUserRole(session) == true) {
			getObject = service.searchUsersService();
			
			logger.info("getObject: " + getObject);
			
			model.addAttribute("page", "admin_table");
			model.addAttribute("userInfoTable", getObject);
			
			return "./index";
		} else {
			model.addAttribute("page", "home");
			model.addAttribute("error", "������ �����ϴ�.");
			return "./index";
		}
	}
	
	private boolean checkSessionUserRole(HttpSession nSession) {
		/*
		logger.info("AdminPageController checkSessionUserRole Function");
		logger.info("session: " + nSession.getAttribute("userInfo"));
		*/
		
		//������ �̿��Ͽ� ����ȯ�� ����� session �ȿ� �ִ� user session �� �����´�.
		UserVO userObject = (UserVO)nSession.getAttribute("userInfo");
		
		if(userObject == null) {
			return false;
		}
		
		if(userObject.getRole().equals("admin") == false) {
			return false;
		} else {
			return true;	
		}
		
	}
}
