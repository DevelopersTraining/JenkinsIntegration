package trng.hbrnt;

import java.util.Date;
import java.util.Scanner;

import com.hbrnt.dao.CustomException;
import com.hbrnt.dao.EmployeeDao;
import com.hbrnt.dao.IEmployeeDao;
import com.hbrnt.pojo.inheritance.tblpercls.Employee;
import com.hbrnt.pojo.inheritance.tblpercls.Owner;
import com.hbrnt.pojo.inheritance.tblpercls.Person;

public class EmployeeApp 
{
	IEmployeeDao employeeDao;  
	static Scanner scanner;
	
	public EmployeeApp() 
	{
		employeeDao = new EmployeeDao();
		scanner = new Scanner(System.in);
	}
	
    public static void main( String[] args ) throws CustomException 
    {
    	oneTablePerClassHierarchy();
    }
    
    private static void oneTablePerClassHierarchy() 
    {
    	EmployeeApp employeeApp = new EmployeeApp();
    	
    	employeeApp.insertPerson();
    	employeeApp.displayPerson();
    	
    	employeeApp.insertEmployee();
    	employeeApp.displayEmployee();
    	
    	employeeApp.insertOwner();
    	employeeApp.displayOwner();
	}

	private void displayOwner() {
    	System.out.println(employeeDao.findOwner(3l));
    }

	private void insertOwner() {
		Owner owner = new Owner();
    	
		owner.setFirstName("Manohar");    	
		owner.setLastName("Reddy");
    	
		employeeDao.insertOwner(owner);
    }

	private void displayEmployee() {
    	System.out.println(employeeDao.findEmployee(2l));
    }
	
	private void displayPerson() {
    	System.out.println(employeeDao.findPerson(2l));
    }
	
	private void insertEmployee()
    {
		Employee employee = new Employee();
    	
		employee.setJoinDate(new Date());
		employee.setFirstName("Manohar");    	
		employee.setLastName("Reddy");
		employee.setSalary(2000);
    	
		employeeDao.insertEmployee(employee);
    }
	
	private void insertPerson()
    {
		Person person = new Person();
    	
		person.setFirstName("Manohar");    	
		person.setLastName("Reddy");
    	
		employeeDao.insertPerson(person);
    }
}
