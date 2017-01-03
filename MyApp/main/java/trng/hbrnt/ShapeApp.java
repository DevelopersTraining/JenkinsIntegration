package trng.hbrnt;

import java.util.Scanner;

import com.hbrnt.dao.CustomException;
import com.hbrnt.dao.IShapeDAO;
import com.hbrnt.dao.ShapeDao;
import com.hbrnt.pojo.inheritance.Circle;
import com.hbrnt.pojo.inheritance.Rectangle;
import com.hbrnt.pojo.inheritance.ShapeColor;

public class ShapeApp 
{
	IShapeDAO shapeDAO;  
	static Scanner scanner;
	
	public ShapeApp() 
	{
		shapeDAO = new ShapeDao();
		scanner = new Scanner(System.in);
	}
	
    public static void main( String[] args ) throws CustomException 
    {
    	oneTablePerSubclass();
    }
    
	private static void oneTablePerSubclass() 
    {
    	ShapeApp shapeApp = new ShapeApp();
    	shapeApp.insertCircle();
    	shapeApp.displayCircle();
    	
    	shapeApp.insertRectangle();
    	shapeApp.displayRectangle();
	}

	private void displayCircle() 
    {
    	System.out.println(shapeDAO.findCircle(1l));
	}

	private void displayShape() {
    	System.out.println(shapeDAO.findShape(1l));
    }

	private void displayRectangle() {
    	System.out.println(shapeDAO.findRectangle(2l));
    }
	
	private void insertCircle()
    {
    	Circle circle = new Circle();
    	
    	circle.setFilled(true);
    	circle.setColor(ShapeColor.R);
    	circle.setRadious(2.5);
    	
    	shapeDAO.insertCircle(circle);
    }
	
	private void insertRectangle()
    {
		Rectangle rectangle = new Rectangle();
    	
//		rectangle.setId(1l);
		rectangle.setFilled(true);
		rectangle.setColor(ShapeColor.B);
		rectangle.setWidth(20);
		rectangle.setLength(10);
    	
    	shapeDAO.insertRectangle(rectangle);
    }
}
