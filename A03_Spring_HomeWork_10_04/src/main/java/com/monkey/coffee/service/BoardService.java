package com.monkey.coffee.service;

import java.util.List;

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
	
	public int insertBoard(BoardVO param) {
		return mapper.insertBoard(param);
	}
}
