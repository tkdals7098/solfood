/*
 * 	CART, PRODUCT, ACCOUNT 의 컬럼이 모두 들어있는 VO,
 */

package com.solfood.dto;

import java.sql.Date;

public class TotalVO {
	// PRODUCT
	private int 	product_id;
    private String	product_name;
    private String 	product_category1;
    private String 	product_category2;
    private int 	product_price;
    private int 	product_discountrate;
    private int 	product_count;
    private String 	product_image;
    private String 	product_package;
    private int 	product_ea;
    private String 	product_content;
    private Date 	product_date;
    private int 	product_event;
    
    // ACCOUNT 
    private String account_user;
	private String account_password;
	private String account_name;
	private String account_date;
	private String account_tel;
	private String account_address;
	private int account_grade;
	private int account_age;
	private String account_gender;
	private String account_email;
	
	// CART
	private int 	cart_id;
	private String 	cart_date;
	private int		cart_count;
	
	// BUY
	private int 	buy_id;
	private String 	buy_date;
	private int 	buy_count;
	private String	buy_delivery;
	
	
	// RECIPE
	private int 	recipe_id;
	private String 	recipe_image;
	private String	recipe_content;
	private String	recipe_name;
	private String	recipe_keyword;
	private String	recipe_tag;
	private Date	recipe_date;
		
	// RELATE : Reciepe & Product
	private int no;

	
	// HEART
	private int 	heart_num;
	
	//Search
	private int search_count;
	private String search_keyword;
	private String search_date;
	private int keyword_count;
	
	// GETTERS AND SETTERS
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
	public String getAccount_user() {
		return account_user;
	}
	public void setAccount_user(String account_user) {
		this.account_user = account_user;
	}
	public String getAccount_password() {
		return account_password;
	}
	public void setAccount_password(String account_password) {
		this.account_password = account_password;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getAccount_date() {
		return account_date;
	}
	public void setAccount_date(String account_date) {
		this.account_date = account_date;
	}
	public String getAccount_tel() {
		return account_tel;
	}
	public void setAccount_tel(String account_tel) {
		this.account_tel = account_tel;
	}
	public String getAccount_address() {
		return account_address;
	}
	public void setAccount_address(String account_address) {
		this.account_address = account_address;
	}
	public int getAccount_grade() {
		return account_grade;
	}
	public void setAccount_grade(int account_grade) {
		this.account_grade = account_grade;
	}
	public int getAccount_age() {
		return account_age;
	}
	public void setAccount_age(int account_age) {
		this.account_age = account_age;
	}
	public String getAccount_gender() {
		return account_gender;
	}
	public void setAccount_gender(String account_gender) {
		this.account_gender = account_gender;
	}
	public String getAccount_email() {
		return account_email;
	}
	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getCart_date() {
		return cart_date;
	}
	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getRecipe_image() {
		return recipe_image;
	}
	public void setRecipe_image(String recipe_image) {
		this.recipe_image = recipe_image;
	}
	public String getRecipe_content() {
		return recipe_content;
	}
	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_keyword() {
		return recipe_keyword;
	}
	public void setRecipe_keyword(String recipe_keyword) {
		this.recipe_keyword = recipe_keyword;
	}
	public Date getRecipe_date() {
		return recipe_date;
	}
	public void setRecipe_date(Date recipe_date) {
		this.recipe_date = recipe_date;
	}
	public int getHeart_num() {
		return heart_num;
	}
	public void setHeart_num(int heart_num) {
		this.heart_num = heart_num;
	}
	public int getProduct_event() {
		return product_event;
	}
	public void setProduct_event(int product_event) {
		this.product_event = product_event;
	}
	public String getBuy_delivery() {
		return buy_delivery;
	}
	public void setBuy_delivery(String buy_delivery) {
		this.buy_delivery = buy_delivery;
	}
	public String getRecipe_tag() {
		return recipe_tag;
	}
	public void setRecipe_tag(String recipe_tag) {
		this.recipe_tag = recipe_tag;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	public int getSearch_count() {
		return search_count;
	}
	public void setSearch_count(int search_count) {
		this.search_count = search_count;
	}
	public String getSearch_date() {
		return search_date;
	}
	public void setSearch_date(String search_date) {
		this.search_date = search_date;
	}
	public int getKeyword_count() {
		return keyword_count;
	}
	public void setKeyword_count(int keyword_count) {
		this.keyword_count = keyword_count;
	}
	
}
