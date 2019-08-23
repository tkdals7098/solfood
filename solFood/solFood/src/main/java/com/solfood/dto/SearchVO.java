package com.solfood.dto;

import java.util.Date;

public class SearchVO {

	private int search_num;
	private String account_user;
	private String search_keyword;
	private Date search_date;
	
	public int getSearch_num() {
		return search_num;
	}
	public void setSearch_num(int search_num) {
		this.search_num = search_num;
	}
	public String getAccount_user() {
		return account_user;
	}
	public void setAccount_user(String account_user) {
		this.account_user = account_user;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	public Date getSearch_date() {
		return search_date;
	}
	public void setSearch_date(Date search_date) {
		this.search_date = search_date;
	}
	
	@Override
	public String toString() {
		return "SearchVO [search_num=" + search_num + ", account_user=" + account_user + ", search_keyword="
				+ search_keyword + ", search_date=" + search_date + "]";
	}
	
	
}
