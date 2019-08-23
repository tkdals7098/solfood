package com.solfood.dto;

import java.sql.Date;

public class MemberVO {
 
	private String account_user;
	private String account_password;
	private String account_name;
	private Date account_date;
	private String account_tel;
	private String account_address;
	private int account_grade;
	private int account_age;
	private String account_gender;
	private String account_email;
	private String account_email1;
	private String account_email2;
	private int RNUM;

	
	@Override
	public String toString() {
		return "MemberVO [account_user=" + account_user + ", account_password=" + account_password + ", account_name="
				+ account_name + ", account_date=" + account_date + ", account_tel=" + account_tel
				+ ", account_address=" + account_address + ", account_grade=" + account_grade + ", account_age="
				+ account_age + ", account_gender=" + account_gender + ", account_email=" + account_email
				+ ", account_email1=" + account_email1 + ", account_email2=" + account_email2 + ", RNUM=" + RNUM + "]";
	}
	
	public int getRNUM() {
		return RNUM;
	}
	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}
	public String getAccount_email1() {
		return account_email1;
	}
	public void setAccount_email1(String account_email1) {
		this.account_email1 = account_email1;
	}
	public String getAccount_email2() {
		return account_email2;
	}
	public void setAccount_email2(String account_email2) {
		this.account_email2 = account_email2;
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
	public Date getAccount_date() {
		return account_date;
	}
	public void setAccount_date(Date account_date) {
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
	
	
	
}
