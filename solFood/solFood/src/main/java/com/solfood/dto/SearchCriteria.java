package com.solfood.dto;

public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword;
	private String board_category;
	
	public String getSearchType() {
		return searchType;
		
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getBoard_category() {
		return board_category;
	}
	
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return super.toString() + " SearchCriteria "
								+ " [searchType=" + searchType + ", keyword="
								+   keyword + "]";
	}
}
