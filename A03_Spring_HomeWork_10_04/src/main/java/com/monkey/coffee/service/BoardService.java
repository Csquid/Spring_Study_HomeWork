package com.monkey.coffee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.monkey.coffee.mapper.BoardMapper;
import com.monkey.coffee.vo.BoardVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardService {
	private BoardMapper mapper;
	
	public List<BoardVO> getBoardListService() {
		return mapper.getBoardList();
	}
	
	public BoardVO getBoard(int idx) {
		return mapper.getBoard(idx);
	}
	
	public List<Integer> searchIDXs(String userID) {
		return mapper.searchIDXs(userID);
	}
	
	public BoardVO searchEqualsUserAndBoardService(int idx, String userID) {
		return mapper.searchEqualsUserAndBoard(idx, userID);
	}
	
	public int getSeqBoardLastNumberService() {
		return mapper.getSeqBoardLastNumber();
	}
	
	public int insertBoard(BoardVO param) {
		return mapper.insertBoard(param);
	}
	
	public int updateBoard(BoardVO param) {
		return mapper.updateBoard(param);
	}
	
	public int deleteBoard(int param) {
		return mapper.deleteBoard(param);
	}
}
