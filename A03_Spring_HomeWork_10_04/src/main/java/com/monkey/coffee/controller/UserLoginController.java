package com.monkey.coffee.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils.Null;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		logger.info("UserLoginController /user/login");
		
		HttpSession session = request.getSession();
		
		UserVO object = service.searchUserIDService(vo);
		JSONObject jsonObject = new JSONObject();

		// service.searchUserIDService(vo); 를 통하여 id가 존재하는지 체크
		if (object != null) {
			jsonObject.put("id", object.getId());

			object = service.userLoginService(vo);
			
			//service.userLoginService(vo); 을 통해 로그인 가능 여부를 체크함
			if (object != null) {
				jsonObject.put("name", object.getName());
				jsonObject.put("signal", "success");
				
				session.setAttribute("userInfo", object);
				jsonObject.put("userInfo", session.getAttribute("userInfo"));
				return jsonObject.toString();
			} else {
				jsonObject.put("detail", "Wrong Password");
				jsonObject.put("signal", "fail");

				return jsonObject.toString();
			}
		} else {
			jsonObject.put("detail", "Wrong ID or Empty Account");
			jsonObject.put("signal", "fail");

			return jsonObject.toString();
		}
	}
	
	
	@GetMapping(value = "/logout")
	public String logoutUser(Model model, HttpServletRequest request) {
		logger.info("########################  @GetMapping value /logout ########################");
		HttpSession session = request.getSession();
		
		//세션 삭제
		session.invalidate();
		
		return "./index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(Model model, @RequestBody UserVO vo, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		logger.info("UserLoginController /user/register");
		
		/*
		 *	TODO: 유효성 검사. 
		 * 	null이 아닌경우: 데이터 중복 O
		 * 	null인 경우: 데이터 중복 X
		 */
		
		//아이디 검색
		UserVO checkOverlapID = service.searchUserIDService(vo);
		//닉네임 검색
		UserVO checkOverlapName = service.searchUserNameService(vo);
		
		jsonObject.put("overlap_id", false);
		jsonObject.put("overlap_name", false);
		
		//만약 id, name 데이터 검색에서 데이터가 존재: 데이터가 중복된다. 
		if(checkOverlapID != null || checkOverlapName != null) {
			jsonObject.put("signal", "fail");
			jsonObject.put("overlap", true);
			if(checkOverlapID != null) {
				jsonObject.put("overlap_id", true);
			}
			if(checkOverlapName != null) {
				jsonObject.put("overlap_name", true);
			}
			
			return jsonObject.toString();
		} else {
			jsonObject.put("overlap", false);
		}
		
		int checkResult = service.insertUser(vo);
		
		logger.info("checkResult: " + checkResult);
		
		//회원가입이 되었을때 checkResult는 양수를 반환
		//회원가입이 되지 않았을때 checkResult는 음수를 반환
		if(checkResult > 0) {						//register success
			
			jsonObject.put("signal", "success");	
		} else {									//register fail
			jsonObject.put("signal", "fail");
		}
		
		return jsonObject.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/register/overlap/id", method = RequestMethod.POST)
	public String registerOverlapID(Model model, @RequestBody UserVO vo, HttpServletRequest request) {
		logger.info("UserLoginController register/overlap/id");
		
		UserVO object = service.searchUserIDService(vo);
		JSONObject jsonObject = new JSONObject();
		
		if(object != null) {
			jsonObject.put("signal", "success");	
		} else {	
			jsonObject.put("signal", "fail");
		}
		
		return jsonObject.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/register/overlap/name", method = RequestMethod.POST)
	public String registerOverlapName(Model model, @RequestBody UserVO vo, HttpServletRequest request) {
		logger.info("UserLoginController register/overlap/name");
		
		UserVO object = service.searchUserNameService(vo);
		JSONObject jsonObject = new JSONObject();
		
		if(object != null) {
			jsonObject.put("signal", "success");	
		} else {	
			jsonObject.put("signal", "fail");
		}
		
		return jsonObject.toString();
	}
}
