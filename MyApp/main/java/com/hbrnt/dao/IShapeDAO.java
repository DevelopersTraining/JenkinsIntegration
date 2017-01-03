package com.hbrnt.dao;

import com.hbrnt.pojo.inheritance.Circle;
import com.hbrnt.pojo.inheritance.Rectangle;
import com.hbrnt.pojo.inheritance.Shape;

public interface IShapeDAO 
{
	public void insertCircle(Circle circle);
	public void insertRectangle(Rectangle rectangle);
	public void insertShape(Shape shape);
	public Shape findShape(Long shapeId);
	public Circle findCircle(Long shapeId);
	public Rectangle findRectangle(Long shapeId);
}
