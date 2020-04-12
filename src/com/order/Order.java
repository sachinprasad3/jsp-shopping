package com.order;

import java.sql.Timestamp;
import java.util.Date;

public class Order {
	private int id, productId,userId;
	private String deliveryAddress,deliveryMobileNo;
	//Timestamp orderDate;
	
	private String productName;
	private String productPrice;
	
	private Date orderDate;

	
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getDeliveryMobileNo() {
		return deliveryMobileNo;
	}
	public void setDeliveryMobileNo(String deliveryMobileNo) {
		this.deliveryMobileNo = deliveryMobileNo;
	}
	
	/* public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	} */
	
}
