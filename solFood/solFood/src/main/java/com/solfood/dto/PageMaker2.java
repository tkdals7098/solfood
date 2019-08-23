package com.solfood.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
//검색기능 추가 테스트
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
//검색기능 추가 테스트
public class PageMaker2 {

	 private int totalCount;
	  private int startPage;
	  private int endPage;
	  private boolean prev;
	  private boolean next;
	  private int displayPageNum = 10;

	  private Criteria cri;
	  
	  public void setCri(Criteria cri) {
	    this.cri = cri;
	  }

	  public void setTotalCount(int totalCount) {
	    this.totalCount = totalCount;
	    calcData();
	  }
	  
	  private void calcData() {
	    endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
	    startPage = (endPage - displayPageNum) + 1;
	    int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
	    if (endPage > tempEndPage) {
	    	endPage = tempEndPage;
	    }
	    prev = startPage == 1 ? false : true;
	    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	  }
	  
	  public int getTotalCount() {
	    return totalCount;
	  }

	  public int getStartPage() {
	    return startPage;
	  }

	  public int getEndPage() {
	    return endPage;
	  }
	  
	  public boolean isPrev() {
	    return prev;
	  }

	  public boolean isNext() {
	    return next;
	  }

	  public int getDisplayPageNum() {
	    return displayPageNum;
	  }

	  public Criteria getCri() {
	    return cri;
	  }

	  public String makeQuery(int page) {
	    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
	        .queryParam("perPageNum", cri.getPerPageNum()).build();
	    return uriComponents.toUriString();
	  }
//================================검색기능 추가 테스트==============================================================	  
	  public String makeSearch2(int page) {
 	    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
																        .queryParam("perPageNum", cri.getPerPageNum())
																        //.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
																        .queryParam("keyword_p", encoding2(((SearchCriteria) cri).getKeyword())).build();
	    return uriComponents.toUriString();
	    }
 
	    private String encoding2(String keyword) {
	        if (keyword == null || keyword.trim().length() == 0)  {
	        return "";
	        }
	        
	        try {
	        	return URLEncoder.encode(keyword, "UTF-8");
	        	
	        	
	        }catch (UnsupportedEncodingException e) {
	 	        return "";
	 	    }
		}
//================================검색기능 추가 테스트==============================================================		    
}
