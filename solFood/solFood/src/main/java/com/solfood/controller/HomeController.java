package com.solfood.controller;

import java.util.List;
import java.util.Locale;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.solfood.dto.TotalVO;
import com.solfood.service.ProductService;
import com.solfood.service.RecentService;
import com.solfood.service.RecipeService;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
      
    @Inject
    private ProductService productService;
    
    @Inject
    private RecipeService recipeService;
    
    @Inject
    private RecentService recentService;
    
    //-----------------------------------------------------
    //	home
    //-----------------------------------------------------
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) throws Exception{
        List<TotalVO> homeProduct = productService.selectProduct_all();
        model.addAttribute("homeProduct", homeProduct);
        
        List<TotalVO> homeRecipe = recipeService.allRecipe();
        model.addAttribute("homeRecipe", homeRecipe);
        
        return "home";  
    }
    
    //-----------------------------------------------------
    //	chat
    //-----------------------------------------------------
	@RequestMapping("/chat")
	public String chat() {
		return "module/chat";
	}
	
	//-----------------------------------------------------
    //	solfood- extra
    //-----------------------------------------------------
	//회사소개
	@RequestMapping("/intro.do")
	public String intro() {
		return "company/intro";
	}
	//이용약관
	@RequestMapping("/accessTerms.do")
	public String accessTerms() {
		return "company/accessTerms";
	}
	//개인정보처리방침
	@RequestMapping("/personalInfo.do")
	public String personalInfo() {
		return "company/personalInfo";
	}
	//이용안내
	@RequestMapping("/guide.do")
	public String guide() {
		return "company/guide";
	}

	
	//-----------------------------------------------------
    //	recent
    //-----------------------------------------------------
	//최근본상품
	@ResponseBody
	@RequestMapping(value= "/recentList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> recentList(String account_user) throws Exception {		
		List<TotalVO> recentList= recentService.selectRecent(account_user);
		
		return recentList;
	}

}
