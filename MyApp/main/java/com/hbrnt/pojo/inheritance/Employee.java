package com.hbrnt.pojo.inheritance;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hbrnt.pojo.Address;

@Entity
@Table(name = "Person")
@DiscriminatorValue("EMP")
public class Employee extends Person {

	@Column
	private float salary;

	@Column
	private Date joinDate;

	@Embedded
	private Address address;

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "Employee [salary=" + salary + ", joinDate=" + joinDate + ", address=" + address + ", getPersonId()="
				+ getPersonId() + ", getFirstName()=" + getFirstName() + ", getLastName()=" + getLastName() + "]";
	}

}
