package com.monkey.coffee.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

		return "./index";
	}

	@RequestMapping(value = "/user_table/search", method = RequestMethod.GET)
	public String user_table_search(Model model, HttpServletRequest request) {
		logger.info("AdminPageController /admin/user_table/search");
		
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * ArrayList<UserVO> getObject;
		 * 
		 * getObject = service.searchUsersService();
		 */

		// logger.info("getObject: " + getObject);

		model.addAttribute("page", "admin_user_table_search");
		// model.addAttribute("userInfoTable", getObject);
		return "./index";

		// return "redirect:/admin/user_table/search/role/" + vo.getRole();

	}

	@RequestMapping(value = "/user_table/search/role", method = RequestMethod.POST)
	public String user_table_search_role(Model model, @RequestBody Map<String, String> vo, HttpServletRequest request) {
		logger.info("UserLoginController /user_table/search/role");
		logger.info("Data: " + vo);
		/*
		 * ArrayList<UserVO> getObject;
		 * 
		 * getObject = service.searchUserRoleEquals(vo); HttpSession session =
		 * request.getSession(); JSONObject jsonObject = new JSONObject();
		 * 
		 * if (getObject != null) { jsonObject.put("signal", "success");
		 * jsonObject.put("userInfoTable", getObject);
		 * model.addAttribute("userInfoTable", getObject); session.setAttribute("table",
		 * true); } else { jsonObject.put("signal", "fail"); }
		 * 
		 * return jsonObject.toString();
		 */
		return "redirect:/admin/user_table/search/role/" + vo.get("role");
	}
	
	/*
	@ResponseBody
	@RequestMapping(value = "/user_table/search/role", method = RequestMethod.POST)
	public String user_table_search_role(Model model, @RequestBody UserVO vo, HttpServletRequest request) {
		logger.info("UserLoginController /user_table/search/role");
		vo.getRole();
		/*
		 * ArrayList<UserVO> getObject;
		 * 
		 * getObject = service.searchUserRoleEquals(vo); HttpSession session =
		 * request.getSession(); JSONObject jsonObject = new JSONObject();
		 * 
		 * if (getObject != null) { jsonObject.put("signal", "success");
		 * jsonObject.put("userInfoTable", getObject);
		 * model.addAttribute("userInfoTable", getObject); session.setAttribute("table",
		 * true); } else { jsonObject.put("signal", "fail"); }
		 * 
		 * return jsonObject.toString();
		 
		return "redirect:/admin/user_table/search/role/" + vo.getRole();
	}
	*/
}
