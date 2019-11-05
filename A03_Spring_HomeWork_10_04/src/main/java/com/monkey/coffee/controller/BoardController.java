//D:\Programming\Spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\A03_Spring_HomeWork_10_04\resources\
package com.monkey.coffee.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.monkey.coffee.service.BoardService;
import com.monkey.coffee.service.CommentService;
import com.monkey.coffee.service.FileService;
import com.monkey.coffee.util.UploadFileUtils;
import com.monkey.coffee.vo.BoardFileVO;
import com.monkey.coffee.vo.BoardVO;
import com.monkey.coffee.vo.CommentVO;
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
	private CommentService commentService;
	private FileService fileService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		logger.info("BoardController /board/index");
		List<Integer> userHavePost = null;
		HttpSession session = request.getSession();
		UserVO userData = (UserVO) session.getAttribute("userInfo");

		Map<Integer, ArrayList<String>> board_cnt = (Map<Integer, ArrayList<String>>) session.getAttribute("board_cnt");

		// board_cnt 세션이 없다면 세션을 추가시켜준다.
		if (board_cnt == null) {
			board_cnt = new HashedMap();

			session.setAttribute("board_cnt", board_cnt);
		}

		List<BoardVO> getBoardObject = service.getBoardListService();

		if (userData != null) {
			userHavePost = service.searchIDXs(userData.getId());
			model.addAttribute("userInfo", userData);
		}

		model.addAttribute("page", "board");
		model.addAttribute("boardTable", getBoardObject);
		model.addAttribute("userHavePostArray", userHavePost);

		return "./index";
	}

	// 파일 업로드 베이스 돌아오기
	@RequestMapping(value = "/board_file", method = RequestMethod.POST)
	public String board_filePOST() {
		return "/floatSection/boardPage/boardCreate";
	}

	// 파일 업로드
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public @ResponseBody List<BoardFileVO> board_file_uploadPOST(Model model, MultipartHttpServletRequest multipartRequest,
			ServletRequest request) throws IOException, Exception {
		// 리스트 객체 선언
		BoardFileVO vo = null;
		List<BoardFileVO> voList = new ArrayList<BoardFileVO>();
		// --
		logger.info("upload");
		System.out.println("upload");

		Iterator<String> itr = multipartRequest.getFileNames();

		String str = new String();

		while (itr.hasNext()) {
			MultipartFile mpf = multipartRequest.getFile(itr.next());

			// 객체 구조화
			vo = new BoardFileVO();

			String originalFilename = mpf.getOriginalFilename();
			System.out.println("originalFilename : " + originalFilename);
			String uploadPath = request.getServletContext().getRealPath("/resources");
			System.out.println("realPath : " + uploadPath);

			// set
			vo.setFile_name_original(originalFilename);
			str = UploadFileUtils.uploadFile(uploadPath, originalFilename, mpf.getBytes(), "/image", vo);

			logger.info("break 2");
			str = str.substring(str.indexOf("image/") - 1);

			vo.setFile_path(str);
			vo.setFile_size(mpf.getSize());

			// 리스트 추가
			voList.add(vo);
		}
		// logger.info(str);
		logger.info("result :===>" + voList);
		return voList;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createBoardPage(Model model, HttpServletRequest request) {
		logger.info("BoardController /board/create");

		model.addAttribute("page", "board_create");

		return "./index";
	}

	@ResponseBody
	@RequestMapping(value = "/create/db", method = RequestMethod.POST)
	//public String createBoardDB(Model model, @RequestBody Map<String, Object> param, HttpServletRequest request) {
	public String createBoardDB(Model model, @RequestBody BoardVO boardVO, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		
		logger.info("BoardController /board/create/db");
		
		// 파일 업로드 vo리스트에관한 로그 찍는 부분
		if (boardVO.getBoardFileVO() != null) {
			boardVO.getBoardFileVO().forEach(value -> logger.info("파일VO 값들 : " + value));
		}
		
		logger.info("data: " + boardVO.getBoardFileVO());
		logger.info("vo: " + boardVO);
		int checkResult = service.insertBoard(boardVO);
		// 마지막 시퀀스 값을 반환 --> 마지막 시퀀스 값이기 때문에 마지막 게시물 번호 + 1이다.
		int seqBoardNum = service.getSeqBoardLastNumberService() - 1;

		logger.info("checkResult: " + checkResult);

		jsonObject.put("seqNum", seqBoardNum);

		// 성공 했을시 checkResult는 양수를 반환
		// 실패 했을시 checkResult는 음수를 반환
		if (checkResult > 0) {
			jsonObject.put("signal", "success");
		} else {
			jsonObject.put("signal", "fail");
		}

		
		return jsonObject.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/comment/create/db", method = RequestMethod.POST)
	public String createBoardCommentDB(Model model, @RequestBody CommentVO vo, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();

		logger.info("BoardController /board/create/db");
		
		int checkResult = commentService.insertCommentService(vo);
		// 마지막 시퀀스 값을 반환 --> 마지막 시퀀스 값이기 때문에 마지막 게시물 번호 + 1이다.

		logger.info("checkResult: " + checkResult);

		jsonObject.put("seqNum", vo.getBoard_idx());

		// 성공 했을시 checkResult는 양수를 반환
		// 실패 했을시 checkResult는 음수를 반환
		if (checkResult > 0) {
			jsonObject.put("signal", "success");
		} else {
			jsonObject.put("signal", "fail");
		}

		return jsonObject.toString();
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String viewBoard(Model model, HttpServletRequest request, @RequestParam(defaultValue = "0") int idx) {
		logger.info("BoardController /board/view");
		// Integer: seq, ArrayList<String>: userid
		HttpSession session = request.getSession();

		UserVO userData = (UserVO) session.getAttribute("userInfo");

		Map<Integer, ArrayList<String>> board_cnt = (Map<Integer, ArrayList<String>>) session.getAttribute("board_cnt");
		BoardVO getObject = service.getBoard(idx);

		List<CommentVO> getCommentObject = commentService.getCommentService(idx);
		List<BoardFileVO> getFileObject = fileService.getFilesService(idx);
		
		ArrayList<String> boardUserSawList = board_cnt.get(idx);
		if (userData != null) {
			if (boardUserSawList == null) { // 이 세션의 해당 idx arrayList가 없는경우.
				boardUserSawList = new ArrayList<String>();
				boardUserSawList.add(userData.getId());

				board_cnt.put(idx, boardUserSawList);

				service.updateBoardHistoryService(idx);
			} else if (boardUserSawList.contains(userData.getId()) == false) { // 중복된 아이디가 없는경우
				boardUserSawList.add(userData.getId());

				service.updateBoardHistoryService(idx);
			}
		}
		
		// 게시물의 주인인지 확인 하는 단계
		if (this.searchMasterPost(request, idx)) {
			model.addAttribute("haveUserBoard", "true");
		} else {
			model.addAttribute("haveUserBoard", "false");
		}

		if (getCommentObject.size() == 0) {
			model.addAttribute("comments", null);
		} else {
			model.addAttribute("comments", getCommentObject);
		}
		
		if(getFileObject.size() == 0) {
			model.addAttribute("files", null);
		} else {
			model.addAttribute("files", getFileObject);
			logger.info("getFileObject Data: " + getFileObject);
		}
		
		
		model.addAttribute("page", "board_view");
		model.addAttribute("boardContent", getObject);

		return "./index";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyBoardPage(Model model, HttpServletRequest request, @RequestParam(defaultValue = "0") int idx) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/modify");

		BoardVO getObject = service.getBoard(idx);
		List<BoardFileVO> getFileObject = fileService.getFilesService(idx);
		
		logger.info("getData: " + getFileObject);

		if (getObject == null) {
			jsonObject.put("signal", "fail");
		} else {
			jsonObject.put("signal", "true");
		}

		model.addAttribute("page", "board_modify");
		model.addAttribute("boardContent", getObject);
		
		if(getFileObject.size() == 0) {
			model.addAttribute("boardFiles", null);
		} else {
			model.addAttribute("boardFiles", getFileObject);
		}
		
		return "./index";
	}

	@ResponseBody
	@RequestMapping(value = "/modify/db", method = RequestMethod.POST)
	public String modifyBoardDB(Model model, HttpServletRequest request, @RequestBody BoardVO vo) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/modify");
		logger.info("board test: " + vo);

		int checkResult = -1;

		// 게시물의 주인인지 확인 하는 단계
		if (this.searchMasterPost(request, vo.getBoard_idx())) {

			// 만약 주인이라면 고칠수있게 해줌.
			checkResult = service.updateBoardService(vo);
			jsonObject.put("signal", "success");

		} else {
			// 만약 주인이 아니라면 실패.
			model.addAttribute("haveUserBoard", "false");
			jsonObject.put("signal", "fail");
			jsonObject.put("detail", "permission");
			checkResult = -1;
		}

		jsonObject.put("seqNum", vo.getBoard_idx());

		return jsonObject.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/commnet/modify/db", method = RequestMethod.POST)
	public String modifyCommnetDB(Model model, HttpServletRequest request, @RequestBody CommentVO vo) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/comment/modify/db");
		logger.info("board test: " + vo);

		if (commentService.updateCommentService(vo) > 0) {
			jsonObject.put("signal", "success");
		} else {
			jsonObject.put("signal", "fail");
		}

		jsonObject.put("seqNum", vo.getBoard_idx());

		return jsonObject.toString();
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteBoard(Model model, HttpServletRequest request, @RequestParam(defaultValue = "0") int idx) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/delete");
		int checkResult = -1;

		// 게시물의 주인인지 확인 하는 단계
		if (this.searchMasterPost(request, idx)) {

			// 만약 주인이라면 고칠수있게 해줌.
			checkResult = service.deleteBoard(idx);

			if (checkResult > 0) {
				jsonObject.put("signal", "success");
			} else {
				jsonObject.put("signal", "fail");
			}
			logger.info("checkResult is true");

		} else {
			// 만약 주인이 아니라면 실패.
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
	@RequestMapping(value = "/delete/db", method = RequestMethod.POST)
	public String deleteBoardDB(Model model, HttpServletRequest request, @RequestBody BoardVO vo) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/delete");
		int checkResult = -1;

		// 게시물의 주인인지 확인 하는 단계
		if (this.searchMasterPost(request, vo.getBoard_idx())) {

			// 만약 주인이라면 삭제할수있게 해줌.
			checkResult = service.deleteBoard(vo.getBoard_idx());

			if (checkResult > 0) {
				jsonObject.put("signal", "success");
			} else {
				jsonObject.put("signal", "fail");
			}
			logger.info("checkResult is true");

		} else {
			// 만약 주인이 아니라면 실패.
			model.addAttribute("haveUserBoard", "false");
			jsonObject.put("signal", "fail");
			jsonObject.put("detail", "permission");
			logger.info("checkResult is false");
		}

		model.addAttribute("page", "board");
		jsonObject.put("seqNum", vo.getBoard_idx());

		return jsonObject.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/comment/delete/db", method = RequestMethod.POST)
	public String deleteCommentDB(Model model, HttpServletRequest request, @RequestBody CommentVO vo) {
		JSONObject jsonObject = new JSONObject();
		logger.info("BoardController /board/comment/modify/db");
		logger.info("board test: " + vo);

		if (commentService.deleteCommentService(vo.getComment_idx()) > 0) {
			jsonObject.put("signal", "success");
		} else {
			jsonObject.put("signal", "fail");
		}

		jsonObject.put("seqNum", vo.getBoard_idx());

		return jsonObject.toString();
	}

	@RequestMapping(value = "/session/delete/board_cnt", method = RequestMethod.GET)
	public String deleteSessionBoardCnt(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.removeAttribute("board_cnt");
		return null;
	}

	// 게시글 idx를 이용하여 로그인한 유저의 세션 아이디와 대조하여 결과값을 boolean 값으로 리턴해준다.
	private boolean searchMasterPost(HttpServletRequest request, int idx) {
		HttpSession session = request.getSession();
		UserVO userData = (UserVO) session.getAttribute("userInfo");
		BoardVO getEqualsUserBoard = null;

		if (userData == null) {
			logger.info("userData is null");

			return false;
		} else {
			getEqualsUserBoard = service.searchEqualsUserAndBoardService(idx, userData.getId());

			if (getEqualsUserBoard == null) {
				return false;
			} else {
				return true;
			}
		}
	}
}
