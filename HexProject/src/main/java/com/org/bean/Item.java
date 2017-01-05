package com.org.bean;

import javax.persistence.Column;

public class Item {

	private Long itemId;
	private String name;
	private String description;
	private Long quantity;

	public Item() {
	};

	public Item(Long itemid2, String name2, String description2, Long quantity2) {
		this.itemId = itemid2;
		this.name = name2;
		this.description = description2;
		this.quantity = quantity2;
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
