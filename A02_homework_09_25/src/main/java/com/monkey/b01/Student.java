package com.monkey.b01;
import lombok.Data;

@Data
public class Student {
	private int id;
	private String name;
	private int grade;
	private String department;
	
	public Student(int nID, String nName, int nGrade, String nDepartment) {
		this.setId(nID);
		this.setName(nName);
		this.setGrade(nGrade);
		this.setDepartment(nDepartment);
	}
}
