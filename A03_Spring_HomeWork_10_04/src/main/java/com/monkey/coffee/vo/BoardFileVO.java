package com.monkey.coffee.vo;

import lombok.Data;

@Data
public class BoardFileVO {
	private int file_idx;
	private int board_idx;
	private String file_name_original;
	private String file_name_stored;
	private String file_path;
	private long   file_size; 
	private String creation_date;
}
