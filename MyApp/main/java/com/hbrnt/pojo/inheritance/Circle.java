package com.hbrnt.pojo.inheritance;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Circle")
@PrimaryKeyJoinColumn(name="id")
public class Circle extends Shape 
{
	@Column
	double radious;

	public double getRadious() {
		return radious;
	}

	public void setRadious(double radious) {
		this.radious = radious;
	}

	@Override
	public String toString() {
		return "Circle [radious=" + radious + ", id=" + id + ", color=" + color + ", filled=" + filled + "]";
	}
	
	
}
