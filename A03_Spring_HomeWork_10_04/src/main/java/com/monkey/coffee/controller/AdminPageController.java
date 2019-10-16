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
import org.springframework.web.bind.annotation.RequestParam;

import com.monkey.coffee.service.UserService;
import com.monkey.coffee.vo.UserVO;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

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

		model.addAttribute("page", "admin");

		return "./index";
	}

	@RequestMapping(value = "/user_table", method = RequestMethod.GET)
	public String user_table(Model model, HttpServletRequest request) {
		logger.info("AdminPageController /admin/table");

		HttpSession session = request.getSession();
		ArrayList<UserVO> getObject;

		// TODO: db 연동하여 유저 테이블 불러오기.
		getObject = service.searchUsersService();

		model.addAttribute("page", "admin_table");
		model.addAttribute("userInfoTable", getObject);
		model.addAttribute("uri", request.getRequestURI());
		
		return "./index";
	}

	@RequestMapping(value = "/user_table/search", method = RequestMethod.GET)
	public String user_table_search(Model model, HttpServletRequest request,
			@RequestParam(defaultValue="") String keyword) {
		logger.info("AdminPageController /admin/user_table/search");
		
		
		ArrayList<UserVO> getObject = null;

		logger.info("keyword: " + keyword);
		
		if(keyword.equals("") || keyword.equals("all")) {		// 받아온 keyword 값이 비어있거나 all인경우 전부 출력한다.
			getObject = service.searchUsersService();
		} else {												// 아닌 경우
			getObject = service.searchUserRoleEqualsService(keyword);
			
			if(getObject.size() == 0) {
				logger.info("getObject size is zero");
				getObject = null;
			} else {
				logger.info("getObject size isn't zero");
			}
		}

		model.addAttribute("page", "admin_user_table_search");
		model.addAttribute("userInfoTable", getObject);
		model.addAttribute("uri", request.getRequestURI());
		
		return "./index";

	}
	
	@RequestMapping(value = "/user_table/modify", method = RequestMethod.GET)
	public String user_table_modify(Model model, @RequestParam(defaultValue="u_id") String toSort, @RequestParam(defaultValue="desc") String formatSort, HttpServletRequest request) {
		logger.info("AdminPageController /admin/table/modify");

		HttpSession session = request.getSession();
		ArrayList<UserVO> getObject;

		// TODO: db 연동하여 유저 테이블 불러오기.
		getObject = service.searchUserSortService(toSort, formatSort);

		model.addAttribute("page", "admin_user_table_modify");
		model.addAttribute("userInfoTable", getObject);
		model.addAttribute("uri", request.getRequestURI());
		model.addAttribute("img_sort_asc", "<img src=\"/images/sort_asc.svg\" class=\"monkey-image-sort\">");
		model.addAttribute("img_sort_desc", "<img src=\"/images/sort_desc.svg\" class=\"monkey-image-sort\">");
		
		logger.info("data: " + getObject);
		
		
		return "./index";
	}
}
