package com.monkey.coffee.controller;

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

import com.monkey.coffee.service.UserService;
import com.monkey.coffee.vo.UserVO;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/user/**")
public class UserLoginController {
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	private UserService service;
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String index(Model model, @RequestBody UserVO vo, HttpServletRequest request) {
		logger.info("UserrLoginController /user/login");
		logger.info("get Data: " + vo);
		
		HttpSession session = request.getSession();
		
		UserVO object =  service.userLoginService(vo);
		JSONObject jsonObject = new JSONObject();
		
		if(object != null) {
			jsonObject.put("id", object.getId());
			jsonObject.put("signal", "success");
			
			session.setAttribute("member", object);
			jsonObject.put("sessionName", session.getAttribute("member"));
			
			return jsonObject.toString();
		} else {
			jsonObject.put("signal", "fail");
			
			return jsonObject.toString();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/id", method = RequestMethod.POST)
	public String checkUser(Model model, @RequestBody UserVO vo, HttpServletRequest request) {
		logger.info("UserrLoginController /user/id");
		
		UserVO object =  service.searchUserIDService(vo);
		JSONObject jsonObject = new JSONObject();
		
		if(object != null) {
			jsonObject.put("id", object.getId());
			
			object = service.userLoginService(vo);
			
			if(object != null) {
				jsonObject.put("name", object.getName());
				jsonObject.put("signal", "success");
				
				return jsonObject.toString();
			} else {
				jsonObject.put("detail", "Wrong Password");
				jsonObject.put("signal", "fail");
				
				return jsonObject.toString();
			}
			//model.addAttribute("uid", object.getId());			
			//return "user/login";
		} else {
			jsonObject.put("detail", "Wrong ID or Empty Account");
			jsonObject.put("signal", "fail");
			
			return jsonObject.toString();
		}
		
	}
}
