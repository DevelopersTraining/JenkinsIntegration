package com.hbrnt.pojo.inheritance;

enum ShapeType 
{
	CIRCLE("CER"), RECTANGLE("RECT"), SQUARE("SQR");
	
	String name;
	
	ShapeType(String name) {
		this.name = name;
	}
}
