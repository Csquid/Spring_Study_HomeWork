package com.movie.watch.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.watch.vo.Member;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/member/**")
public class MemberLoginController {
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String index(Model model, @RequestBody Member member, HttpServletRequest request) {
		logger.info("회원가입요청");
		model.addAttribute("page", null);
		return "index";
	}

}
