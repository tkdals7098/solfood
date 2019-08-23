package com.solfood.dto;
import java.sql.Date;

public class ProductVO {
    private int product_id;
    private String product_name;
    private String product_category1;
    private String product_category2;
    private int product_price;
    private int product_discountrate;
    private int product_count;
    private String product_image;
    private String product_package;
    private int product_ea;
    private String product_content;
    private Date product_date;
    
	/* productImg table */
    private int image_no;
    
    
    
    
	// Getter/Setter
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_category1() {
		return product_category1;
	}
	public void setProduct_category1(String product_category1) {
		this.product_category1 = product_category1;
	}
	public String getProduct_category2() {
		return product_category2;
	}
	public void setProduct_category2(String product_category2) {
		this.product_category2 = product_category2;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_discountrate() {
		return product_discountrate;
	}
	public void setProduct_discountrate(int product_discountrate) {
		this.product_discountrate = product_discountrate;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_package() {
		return product_package;
	}
	public void setProduct_package(String product_package) {
		this.product_package = product_package;
	}
	public int getProduct_ea() {
		return product_ea;
	}
	public void setProduct_ea(int product_ea) {
		this.product_ea = product_ea;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
    
    
	
	
	
}
