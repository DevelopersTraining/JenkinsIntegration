package com.org.pojo;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "HISTORY_STOCK")
public class History_Stock implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "ITEM_ID")
	private Long itemId;

	@Column(name = "ITEM_NAME")
	private String name;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "QUANTITY")
	private Long quantity;

	@Column(name = "CREATION_DATE")
	private Date creationDate;

	@Column(name = "VENDOR")
	private String vendor;
	
	@Column(name = "FLAG")
	private Integer flag;
	

	public History_Stock() {

	}

	public History_Stock(Long itemId, String name, String description, Long quantity, Date creationDate, String vendor) {
		this.itemId = itemId;
		this.name = name;
		this.description = description;
		this.quantity = quantity;
		this.creationDate = creationDate;
		this.vendor = vendor;
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

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	
}
