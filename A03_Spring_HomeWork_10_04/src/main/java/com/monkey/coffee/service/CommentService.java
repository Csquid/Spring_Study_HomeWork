package com.monkey.coffee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.monkey.coffee.mapper.CommentMapper;
import com.monkey.coffee.vo.CommentVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommentService {
	private CommentMapper mapper;
	
	public List<CommentVO> getCommentService(int board_idx) {
		return mapper.getComment(board_idx);
	}
	
	public int insertCommentService(CommentVO param) {
		return mapper.insertComment(param);
	}
	
	public int updateCommentService(CommentVO param) {
		return mapper.updateComment(param);
	}
	
	public int deleteCommentService(int param) {
		return mapper.deleteComment(param);
	}
}
