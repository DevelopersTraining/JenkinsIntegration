package com.hbrnt.pojo.inheritance;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="Person")
@DiscriminatorValue("PRSN")
public class Owner extends Person 
{
	
}
