package com.hbrnt.pojo.inheritance;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Inheritance(strategy=InheritanceType.JOINED)
@Table(name="Shape")
public class Shape 
{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long id;
	
	@Column
	@Enumerated(EnumType.STRING)
	ShapeColor color;
	
	@Column
	Boolean filled;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ShapeColor getColor() {
		return color;
	}

	public void setColor(ShapeColor color) {
		this.color = color;
	}

	public Boolean getFilled() {
		return filled;
	}

	public void setFilled(Boolean filled) {
		this.filled = filled;
	}

	@Override
	public String toString() {
		return "Shape [id=" + id + ", color=" + color + ", filled=" + filled + "]";
	}
	
	
}
