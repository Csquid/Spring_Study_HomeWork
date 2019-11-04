package com.monkey.coffee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.monkey.coffee.vo.BoardFileVO;

public interface FileMapper {
	//파일 업로드하기
	public int insertFile(BoardFileVO param);
	public List<BoardFileVO> getFiles(@Param("board_idx")int board_idx);
}
