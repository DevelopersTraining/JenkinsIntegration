package com.hbrnt.pojo;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="Student_Hobbies")
@IdClass(StudentHobbyId.class)
public class StudentHobbies {
	@Id
	@GeneratedValue(generator="gen")
	@GenericGenerator(name = "gen", strategy = "foreign", parameters = @Parameter(name = "property", value = "student"))
	private long studentId;
	
	@Id
	private long hobbyId;
	
	@Column
	private String hobbyDesc;

	
//	@EmbeddedId
//	private StudentHobbyId hobbyIds;
	
	
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

	public String getHobbyDesc() {
		return hobbyDesc;
	}

	public void setHobbyDesc(String hobbyDesc) {
		this.hobbyDesc = hobbyDesc;
	}
	
	
	

	
}
