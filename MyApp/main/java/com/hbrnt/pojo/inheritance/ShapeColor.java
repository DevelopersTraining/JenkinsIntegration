package com.hbrnt.pojo.inheritance;

public enum ShapeColor 
{
	R("Red"), G("Green"), B("Blue"), Y("Yellow"), O("Orenge");
	
	String code;
	
	ShapeColor(String code) 
	{
		this.code = code;
	}
}
