package com.solfood.controller;
import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.solfood.dto.TotalVO;
import com.solfood.service.CartService;
import com.solfood.service.HeartService;
import com.solfood.service.ProductService;

@Controller
@RequestMapping("/heart/")
public class HeartController {
	private static final Logger logger = LoggerFactory.getLogger(HeartController.class);
	
	@Inject
	private HeartService heartService;	

	//============================================================
	//	HEART 
	//============================================================
	// heart 상태보기--> heart 테이블 불러오기
	@RequestMapping(value= "/heartList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String heartList(String account_user, Model model) throws Exception{
		model.addAttribute("account_user", account_user);
				
		return "heart/heartList";
	}
	
	@ResponseBody
	@RequestMapping(value= "/heartListForHeartList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> heartListForHeartList(Model model, String account_user) throws Exception{
		List<TotalVO> heartList_heartList= heartService.selectHeartForHeartList(account_user);
		model.addAttribute("heartList_heartList", heartList_heartList);
				
		return heartList_heartList;
	}
	
	@ResponseBody
	@RequestMapping(value= "/heartListForProductList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> heartListForProductList(Model model) throws Exception{
		List<TotalVO> heartList_productList= heartService.selectHeartForProductList();
		model.addAttribute("heartList_productList", heartList_productList);
				
		// 삭제하기
		System.out.println("==================== hearlist productlist"+ heartList_productList.get(0).getProduct_name());
	
		return heartList_productList;
	}
	
	// change heart--> insert to heart or delete from heart
	@ResponseBody
	@RequestMapping(value= "/changeHeart.do", method= {RequestMethod.GET, RequestMethod.POST})
	public void insertHeart(TotalVO vo, String state) throws Exception{
		if(state.equals("click")) {
			heartService.insertHeart(vo);		
			System.out.println("===================== 여기는 insertHeart");
		} else if(state.equals("unclick")) {
			heartService.deleteHeart(vo);
			System.out.println("===================== 여기는 deleteHeart");
		}		
	}
	
}







