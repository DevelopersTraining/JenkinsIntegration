package com.hbrnt.pojo.inheritance;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Rectangle")
@PrimaryKeyJoinColumn(name="id")
public class Rectangle extends Shape
{
	@Column
	private Integer length;
	
	@Column
	private Integer width;

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	@Override
	public String toString() {
		return "Rectangle [length=" + length + ", width=" + width + ", id=" + id + ", color=" + color + ", filled="
				+ filled + "]";
	}
}
