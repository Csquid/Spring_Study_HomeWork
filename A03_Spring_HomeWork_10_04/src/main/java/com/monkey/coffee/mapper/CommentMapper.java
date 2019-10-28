package com.monkey.coffee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.monkey.coffee.vo.CommentVO;

@Mapper
public interface CommentMapper {
	public List<CommentVO> getComment(@Param("board_idx")int board_idx);
	public int insertComment(CommentVO param);
}
