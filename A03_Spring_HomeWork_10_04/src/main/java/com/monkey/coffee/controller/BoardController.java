package com.monkey.coffee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

/* TODO: 조회기능 구현 */
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
		List<Integer> userHavePost = null;
		HttpSession session = request.getSession();
		UserVO userData = (UserVO) session.getAttribute("userInfo");
		
		List<BoardVO> getBoardObject = service.getBoardListService();
		
		if(userData != null) {
			userHavePost = service.searchIDXs(userData.getId());
		}
		
		model.addAttribute("page", "board");
		model.addAttribute("boardTable", getBoardObject);
		model.addAttribute("userHavePostArray", userHavePost);
		
		return "./index";
	}
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createBoardPage(Model model, HttpServletRequest request) {
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
		logger.info("BoardController /board/view");
	
		BoardVO getObject = service.getBoard(idx);
		
		//게시물의 주인인지 확인 하는 단계
		if(this.searchMasterPost(request, idx)) {
			model.addAttribute("haveUserBoard", "true");
		} else {
			model.addAttribute("haveUserBoard", "false");
		}
		
		model.addAttribute("page", "board_view");
		model.addAttribute("boardContent", getObject);
		
		
		return "./index";
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modifyBoardPage(Model model, HttpServletRequest request, 
			@RequestParam(defaultValue = "0") int idx) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/modify");
		
		BoardVO getObject = service.getBoard(idx);
		logger.info("getData: " + getObject);
		
		if(getObject == null) {
			jsonObject.put("signal", "fail");
		} else {
			jsonObject.put("signal", "true");
		}
		
		model.addAttribute("page", "board_modify");
		model.addAttribute("boardContent", getObject);
		
		return "./index";
	}
	
	@ResponseBody
	@RequestMapping(value="/modify/db", method = RequestMethod.POST)
	public String modifyBoardDB(Model model, HttpServletRequest request, 
			@RequestBody BoardVO vo) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/modify");
		logger.info("board test: " + vo);
		
		int checkResult = -1;
		
		//게시물의 주인인지 확인 하는 단계
		if(this.searchMasterPost(request, vo.getIdx())) {
			
			//만약 주인이라면 고칠수있게 해줌.
			checkResult = service.updateBoard(vo);
			jsonObject.put("signal", "success");	
			
		} else {
			//만약 주인이 아니라면 실패.
			model.addAttribute("haveUserBoard", "false");
			jsonObject.put("signal", "fail");
			jsonObject.put("detail", "permission");
			checkResult = -1;
		}
		
		jsonObject.put("seqNum", vo.getIdx());
	
		return jsonObject.toString();
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String deleteBoard(Model model, HttpServletRequest request, 
			@RequestParam(defaultValue = "0") int idx) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/delete");
		int checkResult = -1;
		
		//게시물의 주인인지 확인 하는 단계
		if(this.searchMasterPost(request,idx)) {
			
			//만약 주인이라면 고칠수있게 해줌.
			checkResult = service.deleteBoard(idx);
			
			if(checkResult > 0) {
				jsonObject.put("signal", "success");	
			} else {
				jsonObject.put("signal", "fail");
			}	
			logger.info("checkResult is true");
			
		} else {
			//만약 주인이 아니라면 실패.
			model.addAttribute("haveUserBoard", "false");
			jsonObject.put("signal", "fail");
			jsonObject.put("detail", "permission");
			logger.info("checkResult is false");
		}
		
		model.addAttribute("page", "board");
		jsonObject.put("seqNum", idx);
		
		return "./index";
	}
	
	@ResponseBody
	@RequestMapping(value="/delete/db", method = RequestMethod.POST)
	public String deleteBoardDB(Model model, HttpServletRequest request, 
			@RequestBody BoardVO vo) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/delete");
		int checkResult = -1;
		
		//게시물의 주인인지 확인 하는 단계
		if(this.searchMasterPost(request, vo.getIdx())) {
			
			//만약 주인이라면 고칠수있게 해줌.
			checkResult = service.deleteBoard(vo.getIdx());
			
			if(checkResult > 0) {
				jsonObject.put("signal", "success");	
			} else {
				jsonObject.put("signal", "fail");
			}	
			logger.info("checkResult is true");
			
		} else {
			//만약 주인이 아니라면 실패.
			model.addAttribute("haveUserBoard", "false");
			jsonObject.put("signal", "fail");
			jsonObject.put("detail", "permission");
			logger.info("checkResult is false");
		}
		
		model.addAttribute("page", "board");
		jsonObject.put("seqNum", vo.getIdx());
		
		return jsonObject.toString();
	}
	
	//게시글 idx를 이용하여 로그인한 유저의 세션 아이디와 대조하여 결과값을 boolean 값으로 리턴해준다.
	private boolean searchMasterPost(HttpServletRequest request, int idx) {
		HttpSession session = request.getSession();
		UserVO userData = (UserVO) session.getAttribute("userInfo");
		BoardVO getEqualsUserBoard = null;
		
		if(userData == null) {
			logger.info("userData is null");
			
			return false;
		} else {
			getEqualsUserBoard = service.searchEqualsUserAndBoardService(idx, userData.getId());
			
			if(getEqualsUserBoard == null) {
				return false;
			} else {
				return true;
			}
		}
	}
}
