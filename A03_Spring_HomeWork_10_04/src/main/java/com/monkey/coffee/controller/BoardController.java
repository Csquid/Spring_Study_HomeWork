package com.monkey.coffee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monkey.coffee.service.BoardService;
import com.monkey.coffee.vo.BoardVO;
import com.monkey.coffee.vo.UserVO;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/board/**")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	private static final String defaultValue = null;

	private BoardService service;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		logger.info("BoardController /board/index");
		
		List<BoardVO> getBoardObject = service.getBoardListService();
		logger.info(getBoardObject.toString());
		
		model.addAttribute("page", "board");
		model.addAttribute("boardTable", getBoardObject);
		
		return "./index";
	}
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createBoard(Model model, HttpServletRequest request) {
		logger.info("BoardController /board/create");
		
		model.addAttribute("page", "board_create");
		
		return "./index";
	}
	
	@ResponseBody
	@RequestMapping(value="/create/db", method = RequestMethod.POST)
	public String createBoardDB(Model model, @RequestBody BoardVO vo, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		
		logger.info("BoardController /board/create/db");
		
		int checkResult = service.insertBoard(vo);
		int seqBoardNum = service.getSeqBoardLastNumberService();
		
		logger.info("checkResult: " + checkResult);
		
		jsonObject.put("seqNum", seqBoardNum);
		//성공 했을시 checkResult는 양수를 반환
		//실패 했을시 checkResult는 음수를 반환
		if(checkResult > 0) {
			jsonObject.put("signal", "success");	
		} else {									
			jsonObject.put("signal", "fail");
		}

		return jsonObject.toString();
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String viewBoard(Model model, HttpServletRequest request, 
			@RequestParam(defaultValue = "0" ) int idx) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/view");
		
		BoardVO getObject = service.getBoard(idx);
		logger.info("getData: " + getObject);
		
		if(getObject == null) {
			jsonObject.put("signal", "fail");
		} else {
			jsonObject.put("signal", "true");
		}
		
		model.addAttribute("page", "board_view");
		model.addAttribute("boardContent", getObject);
		
		return "./index";
	}
}
