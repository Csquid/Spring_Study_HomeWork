package com.monkey.coffee;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "index";
	}
	
	@RequestMapping(value = "/sub1_Tab", method = RequestMethod.GET)
	public String sub1(Model model) {
		logger.info("sub1");
		model.addAttribute("page", "sub1_Tab");
		
		return "index";
	}
	
	
	@RequestMapping(value = "/sub2_Tab", method = RequestMethod.GET)
	public String sub2(Model model) {
		logger.info("sub2");
		model.addAttribute("page", "sub2_Tab");
		
		return "index";
	}
	
	@RequestMapping(value = "/sub3_Tab", method = RequestMethod.GET)
	public String sub3(Model model) {
		logger.info("sub3");
		model.addAttribute("page", "sub3_Tab");
		
		return "index";
	}
}
