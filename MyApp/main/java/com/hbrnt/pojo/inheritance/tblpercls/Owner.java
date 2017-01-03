package com.hbrnt.pojo.inheritance.tblpercls;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="Person")
@DiscriminatorValue("OWNR")
public class Owner extends Person 
{
	
}
