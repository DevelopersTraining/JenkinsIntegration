package com.hbrnt.pojo;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class StudentHobbyId implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	long studentId;
	long hobbyId;
	public long getStudentId() {
		return studentId;
	}
	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}
	public long getHobbyId() {
		return hobbyId;
	}
	public void setHobbyId(long hobbyId) {
		this.hobbyId = hobbyId;
	}
}
