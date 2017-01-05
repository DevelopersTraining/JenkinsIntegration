package com.org.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "STOCK")
public class Stock implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ITEM_ID")
    private Long itemId;

	@Column(name="ITEM_NAME")
    private String name;
	
    @Column(name="DESCRIPTION")
    private String description;
    
    @Column(name="QUANTITY")
    private Long quantity;

   
    public Stock(){
    	
    }

	public Stock(Long itemId, String name, String description, Long quantity) {
        this.itemId = itemId;
        this.name = name;
        this.description = description;
        this.quantity = quantity;
    }
	
    
	@Override
	public String toString() {
		return "Stock [itemid=" + itemId + ", Name=" + name + ", Description=" + description + ", quantity=" + quantity
				+ "]";
	}


	public Long getItemId() {
		return itemId;
	}


	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Long getQuantity() {
		return quantity;
	}


	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	
}
