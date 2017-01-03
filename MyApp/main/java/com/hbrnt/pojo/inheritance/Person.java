package com.hbrnt.pojo.inheritance;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Person")
@DiscriminatorColumn(name="type", discriminatorType=DiscriminatorType.STRING)
public class Person {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long personId;
	
	@Column
	private String firstName;
	
	@Column
	private String lastName;

	public Long getPersonId() {
		return personId;
	}

	public Person(Long personId, String firstName, String lastName) {
		super();
		this.personId = personId;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public Person() {
		super();
	}
	
	public void setPersonId(Long personId) {
		this.personId = personId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Override
	public String toString() {
		return "Person [personId=" + personId + ", firstName=" + firstName + ", lastName=" + lastName + "]";
	}
	
	

}
