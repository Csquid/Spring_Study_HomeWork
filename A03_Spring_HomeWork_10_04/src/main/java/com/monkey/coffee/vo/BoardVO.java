package com.monkey.coffee.vo;

import lombok.Data;

@Data	
public class BoardVO {
	private int idx;
	private String title;
	private String contents;
	private String history_count;
	private String creation_date;
	private String creation_userid;
	private int recommend_count;
	private String update_last_date;
}
