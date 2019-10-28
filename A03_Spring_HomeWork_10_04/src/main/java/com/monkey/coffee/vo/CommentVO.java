package com.monkey.coffee.vo;

import lombok.Data;

@Data
public class CommentVO {
	int comment_idx;
	int board_idx;
	String content;
	String writer;
	int recommend_count;
	String creation_date;
}
