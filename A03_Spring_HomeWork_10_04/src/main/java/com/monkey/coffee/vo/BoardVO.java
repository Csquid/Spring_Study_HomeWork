package com.monkey.coffee.vo;

import java.util.List;

import lombok.Data;

@Data	
public class BoardVO {
	private int board_idx;
	private String title;
	private String content;
	private String history_count;
	private String creation_date;
	private String writer;
	private int recommend_count;
	private String update_last_date;
	
	private List<BoardFileVO> boardFileVO;
}
