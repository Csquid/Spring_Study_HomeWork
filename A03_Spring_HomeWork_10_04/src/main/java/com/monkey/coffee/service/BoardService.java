package com.monkey.coffee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monkey.coffee.mapper.BoardMapper;
import com.monkey.coffee.mapper.FileMapper;
import com.monkey.coffee.vo.BoardVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardService {
	private BoardMapper mapper;
	private FileMapper fileMapper;
	
	public List<BoardVO> getBoardListService() {
		return mapper.getBoardList();
	}
	
	public BoardVO getBoard(int board_idx) {
		return mapper.getBoard(board_idx);
	}
	@Transactional
	public int insertBoard(BoardVO param) {
		int signal = mapper.insertBoard(param);

		// 시퀀스 키 값 반납i 
		int returnBno = param.getBoard_idx(); 

		System.out.println("반환 되는 값은 : " + returnBno);

		param.getBoardFileVO().forEach(upload -> {
			upload.setBoard_idx(returnBno);
			fileMapper.insertFile(upload);
		});

		return signal;
	}
	public List<Integer> searchIDXs(String userID) {
		return mapper.searchIDXs(userID);
	}
	
	public BoardVO searchEqualsUserAndBoardService(int board_idx, String userID) {
		return mapper.searchEqualsUserAndBoard(board_idx, userID);
	}
	
	public int getSeqBoardLastNumberService() {
		return mapper.getSeqBoardLastNumber();
	}
	
	public int updateBoardHistoryService(int board_idx) {
		return mapper.updateBoardHistory(board_idx);
	}
	public int updateBoardService(BoardVO param) {
		return mapper.updateBoard(param);
	}
	
	public int deleteBoard(int param) {
		return mapper.deleteBoard(param);
	}
}
