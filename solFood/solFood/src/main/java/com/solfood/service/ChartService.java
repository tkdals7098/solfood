package com.solfood.service;
import java.util.List;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

public interface ChartService {
	public List<TotalVO> chart_mostSelllingProducts_201907() throws Exception;
	public List<TotalVO> chart_sellingProductsByCategory_201907() throws Exception;
	public List<TotalVO> chart_mostLikedProducts() throws Exception;
	public List<TotalVO> chart_searchKeyword() throws Exception;
	
}
