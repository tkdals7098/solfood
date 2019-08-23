package com.solfood.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solfood.dto.CartVO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.TotalVO;
import com.solfood.service.BuyService;
import com.solfood.service.CartService;
import com.solfood.service.MemberService;
import com.solfood.service.ProductService;
import com.solfood.service.ProductServiceImpl;

@Controller
@RequestMapping("/buy/")
public class BuyController {
	private static final Logger logger = LoggerFactory.getLogger(BuyController.class);
	@Inject
	private BuyService buyService;
	
	//============================================================
	//	buy()
	//============================================================
	@RequestMapping(value = "/buy.do")
	public String buy(String account_user, Model model) throws Exception{			
		model.addAttribute("account_user", account_user);
				
		return "buy/buy";
	}

	@ResponseBody
	@RequestMapping(value= "/buy2.do")
	public List<TotalVO> buy2(String account_user) throws Exception{		
		List<TotalVO> buyList= buyService.selectBuy(account_user);
		
		return buyList;
	}
	
	//============================================================
	//	buyInfo()--> pay에 필요한 정보 출력
	//============================================================	
	/*
	@RequestMapping(value = "/buyInfo.do")
	public List<TotalVO> buyInfo(Model model, String account_user) throws Exception{		
		List<TotalVO> buyInfoList= buyService.selectBuyInfo(account_user);						
		model.addAttribute("buyInfoList", buyInfoList);
			
		return buyInfoList;
	}
	*/
}


