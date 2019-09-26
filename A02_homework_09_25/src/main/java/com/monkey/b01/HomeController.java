package com.monkey.b01;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		String nPage = request.getParameter("page");
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		model.addAttribute("page", nPage);
		
		return "index";
	}
	
	/*
	@RequestMapping(value = "floatSection/sub1_Tab", method = RequestMethod.GET)
	public String sub1(Model model) {
		logger.info("sub1");
		model.addAttribute("page", "sub1_Tab");
		
		//return "redirect:/";
		return "floatSection/sub1_Tab";
	}
	
	@RequestMapping(value = "floatSection/sub2_Tab", method = RequestMethod.GET)
	public String sub2(Model model) {
		logger.info("sub2");
		model.addAttribute("page", "sub2_Tab");
		
		//return "redirect:/";
		return "index";
	}
	
	@RequestMapping(value = "floatSection/sub3_Tab", method = RequestMethod.GET)
	public String sub3(Model model) {
		logger.info("sub1");
		model.addAttribute("page", "sub3_Tab");
		
		//return "redirect:/";
		return "floatSection/sub3_Tab";
	}
	*/

	
	@RequestMapping(value = "sub1_Tab", method = RequestMethod.GET)
	public String sub1(Model model) {
		logger.info("sub1");
		model.addAttribute("page", "sub1_Tab");
		
		//return "redirect:/";
		return "index";
	}
	
	
	@RequestMapping(value = "sub2_Tab", method = RequestMethod.GET)
	public String sub2(Model model) {
		logger.info("sub2");
		model.addAttribute("page", "sub2_Tab");
		
		return "index";
	}
	
	@RequestMapping(value = "sub3_Tab", method = RequestMethod.GET)
	public String sub3(Model model) {
		logger.info("sub3");
		model.addAttribute("page", "sub3_Tab");
		
		return "index";
	}
	
	
}
