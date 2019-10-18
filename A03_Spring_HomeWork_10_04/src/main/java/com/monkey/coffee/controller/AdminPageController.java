package com.monkey.coffee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monkey.coffee.service.UserService;
import com.monkey.coffee.vo.UserVO;
import com.sun.org.apache.xpath.internal.compiler.Keywords;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/admin/**")
public class AdminPageController {
	private static final Logger logger = LoggerFactory.getLogger(AdminPageController.class);
	
	//���� �ְ� HashMap�� ������ LinkedHashMap�� ���� �ȴ�.
	/*
	 * TODO: LinkedHashMap: ������ �ؽ��ʿ��� ���������� ����ִ� �迭�� ������ �ؽ����� ������ ���� ������ ���̺귯����
	 * 		 HashMap ���� ������ �ϱ� ��
	 * 		 HashMap�� LinkedHashMap ���� ������ ������ �ϱ� �� 
	 */
	Map<String, String> userTableSortMap = new LinkedHashMap<String, String>();
	
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

		// TODO: db �����Ͽ� ���� ���̺� �ҷ�����.
		getObject = service.searchUsersAllService();

		model.addAttribute("page", "admin_table");
		model.addAttribute("userInfoTable", getObject);
		model.addAttribute("uri", request.getRequestURI());

		return "./index";
	}

	@RequestMapping(value = "/user_table/search", method = RequestMethod.GET)
	public String user_table_search(Model model, HttpServletRequest request,
			@RequestParam(defaultValue="role") String searchType,  @RequestParam(defaultValue = "all") String keyword) {
		logger.info("AdminPageController /admin/user_table/search");
		
		ArrayList<UserVO> getObject = null;
		
		Map<String, String[]> mapKeyword = new LinkedHashMap<String, String[]>();
		
		mapKeyword.put("role", 
				new String[] {"iron", "bronze", "silver", "gold", "platinum", "diamond", "staff", "admin"});
		mapKeyword.put("gender",
				new String[]  {"man", "woman"});
		mapKeyword.put("address",
				new String[] {"seoul", "busan", "daegu", "incheon", "gwangju", "daejeon", "ulsan"});
		
		logger.info("keyword: " + keyword);

		if (keyword.equals("") || keyword.equals("all")) { // �޾ƿ� keyword ���� ����ְų� all�ΰ�� ���� ����Ѵ�.
			getObject = service.searchUsersAllService();
		} else { // �ƴ� ���
			getObject = service.searchUsersService(searchType, keyword);

			if (getObject.size() == 0) {
				logger.info("getObject size is zero");
				getObject = null;
			} else {
				logger.info("getObject size isn't zero");
			}
		}
		
		String[] keywordStringArr = null;
		
		switch(searchType) {
		case "role":
			keywordStringArr = mapKeyword.get("role");
			break;
		case "gender":
			keywordStringArr = mapKeyword.get("gender");
			break;
		case "address":
			keywordStringArr = mapKeyword.get("address");
			break;
		default:
			keywordStringArr = mapKeyword.get("role");
				break;
		}

		model.addAttribute("keywords", keywordStringArr);
		model.addAttribute("page", "admin_user_table_search");
		model.addAttribute("userInfoTable", getObject);
		model.addAttribute("uri", request.getRequestURI());
		return "./index";
	}

	@RequestMapping(value = "/user_table/modify", method = RequestMethod.GET)
	public String user_table_modify(Model model, @RequestParam(defaultValue = "u_id") String toSort,
			HttpServletRequest request) {
		logger.info("AdminPageController /admin/table/modify");

		HttpSession session = request.getSession();
		ArrayList<UserVO> getObject;

		String[] tableColumnData = { "u_id", "id", "name", "gender", "address", "role" };

		for (int i = 0; i < tableColumnData.length; i++) {
			// ���� �ؽ��� Ű�� ���������ʴٸ� desc�� �ʱ�ȭ (init �ۿ�)
			// HashMap.containsKey(key) : key�� �ִ��� �˻��ϸ� return boolean
			if (userTableSortMap.containsKey(tableColumnData[i]) == false) {
				userTableSortMap.put(tableColumnData[i], "asc");
			}
		}

		// TODO: db �����Ͽ� ���� ���̺� �ҷ�����.
		getObject = service.searchUserSortService(toSort, userTableSortMap.get(toSort));

		if (userTableSortMap.get(toSort).equals("asc")) {
			userTableSortMap.put(toSort, "desc");
		} else {
			userTableSortMap.put(toSort, "asc");
		}
		
		model.addAttribute("page", "admin_user_table_modify");
		model.addAttribute("userInfoTable", getObject);
		model.addAttribute("uri", request.getRequestURI());
		model.addAttribute("tableColumnData", userTableSortMap);
		model.addAttribute("img_sort_asc", "<img src=\"/images/sort_asc.svg\" class=\"monkey-image-sort\">");
		model.addAttribute("img_sort_desc", "<img src=\"/images/sort_desc.svg\" class=\"monkey-image-sort\">");

		/*
		 * uid id name gender address role
		 * 
		 */
		logger.info("data: " + getObject);

		return "./index";
	}
}
