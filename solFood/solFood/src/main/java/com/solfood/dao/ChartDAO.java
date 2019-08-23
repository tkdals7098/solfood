package com.solfood.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public interface ChartDAO {
	// 2019년 7월 최다 판매 제품
	public List<TotalVO> chart_mostSelllingProducts_201907() throws Exception;
	
	// 2019년 7월 최다 판매 카테고리
	public List<TotalVO> chart_sellingProductsByCategory_201907() throws Exception;
	
	// 찜한 상품
	public List<TotalVO> chart_mostLikedProducts() throws Exception;
	
	//인기검색어
	public List<TotalVO> chart_searchKeyword() throws Exception;
}






