package com.solfood.service;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.solfood.dao.BuyDAO;
import com.solfood.dao.CartDAO;
import com.solfood.dao.ChartDAO;
import com.solfood.dao.RecentDAO;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Service
public class ChartServiceImpl implements ChartService{
	@Inject
	private ChartDAO dao;

	@Override
	public List<TotalVO> chart_mostSelllingProducts_201907() throws Exception {
		return dao.chart_mostSelllingProducts_201907();
	}

	@Override
	public List<TotalVO> chart_sellingProductsByCategory_201907() throws Exception {
		return dao.chart_sellingProductsByCategory_201907();
	}

	@Override
	public List<TotalVO> chart_mostLikedProducts() throws Exception {
		return dao.chart_mostLikedProducts();
	}
	
	@Override
	public List<TotalVO> chart_searchKeyword() throws Exception {
		return dao.chart_searchKeyword();
	}
	
}
