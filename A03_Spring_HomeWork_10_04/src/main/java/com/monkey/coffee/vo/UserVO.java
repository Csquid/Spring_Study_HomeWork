package com.monkey.coffee.vo;

import lombok.Data;

@Data
public class UserVO {
	private int member_idx;
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String address;
	private String role;
}
