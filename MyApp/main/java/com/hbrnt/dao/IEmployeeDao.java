package com.hbrnt.dao;

import com.hbrnt.pojo.inheritance.tblpercls.Employee;
import com.hbrnt.pojo.inheritance.tblpercls.Owner;
import com.hbrnt.pojo.inheritance.tblpercls.Person;

public interface IEmployeeDao {
	public Person findPerson(Long personId);
	
	public void insertPerson(Person person);
	
	public Employee findEmployee(Long personId);
	
	public void insertEmployee(Employee employee);
	
	public Owner findOwner(Long personId);
	
	public void insertOwner(Owner owner);

}
