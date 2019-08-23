package com.solfood.controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.solfood.dto.MemberVO;
import com.solfood.dto.TotalVO;
import com.solfood.service.ChartService;
import com.solfood.service.MemberService;
import com.solfood.service.RecentService;
 
@Controller
@RequestMapping("/chart/")
public class ChartController {
	@Inject
	ChartService chartService;
	
	//차트
	@RequestMapping("/chart.do")
	public String Chart() {
		
		
		return "chart/chart";
	}
	
	// 2019년 최다 판매 상품 
	@ResponseBody
	@RequestMapping(value="/chart_mostSelllingProducts_201907", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> chart_mostSelllingProducts_201907(Model model) throws Exception{
		List<TotalVO> productList= chartService.chart_mostSelllingProducts_201907();
		model.addAttribute("productList", productList);
				
		return productList;
	}
	
	//카테고리별 판매 수량
	@ResponseBody
	@RequestMapping(value="/chart_sellingProductsByCategory_201907", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> chart_sellingProductsByCategory_201907(Model model) throws Exception{
		List<TotalVO> categoryList= chartService.chart_sellingProductsByCategory_201907();
	//model.addAttribute("productList", productList);
				
		return categoryList;
	}
	
	//찜 best 5
	@ResponseBody
	@RequestMapping(value="/chart_mostLikedProducts", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> chart_mostLikedProducts(Model model) throws Exception{
		List<TotalVO> mostLikedProducts= chartService.chart_mostLikedProducts();
	//model.addAttribute("productList", productList);
					
		return mostLikedProducts;
	}
	
	//인기검색어
	@ResponseBody
	@RequestMapping(value="/chart_searchKeyword", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> chart_searchKeyword(Model model) throws Exception{
		List<TotalVO> searchKeyword= chartService.chart_searchKeyword();
	//model.addAttribute("productList", productList);
					
		return searchKeyword;
	}
}
