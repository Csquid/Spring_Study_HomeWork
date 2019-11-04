package com.monkey.coffee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.monkey.coffee.mapper.FileMapper;
import com.monkey.coffee.vo.BoardFileVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class FileService {
	FileMapper mapper;
	
	public List<BoardFileVO> getFilesService(int board_idx) {
		return mapper.getFiles(board_idx);
	}
}
