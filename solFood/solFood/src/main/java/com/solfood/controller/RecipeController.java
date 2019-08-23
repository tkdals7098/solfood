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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.solfood.dto.TotalVO;
import com.solfood.service.CartService;
import com.solfood.service.ProductService;
import com.solfood.service.RecipeService;

@Controller
public class RecipeController {
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);
	
	@Inject
	private RecipeService recipeService;
	
	@Inject
	private ProductService productService;
	//============================================================
	//	selectRecipe--> 레시피 정보 불러오기// SELECT * FROM PRODUCT WHERE RECIPE_ID= ?
	//============================================================
	@RequestMapping(value = "/recipe.do")
	public String selectRecipe(Model model, int recipe_id) throws Exception{		
		TotalVO recipeLists = recipeService.getRecipe(recipe_id);	
		model.addAttribute("recipeLists", recipeLists);
		List<TotalVO> recipeList = recipeService.selectRecipe(recipe_id);	
		model.addAttribute("recipeList", recipeList);
		return "recipe/recipeMain";
	}
	/*
	@RequestMapping(value = "/recipe.do")
	public String selectRecipe(Model model, int recipe_id) throws Exception{		
		List<TotalVO> recipeList= recipeService.selectRecipe(recipe_id);						
		model.addAttribute("recipeList", recipeList);
		System.out.println("###1:"+recipeList);
		return "recipe/recipeMain";
	}
	*/

	
	@RequestMapping(value = "/recipeList.do")
	public String selectRecipeList(Model model) throws Exception{		
		List<TotalVO> allRecipe= recipeService.allRecipe();						
		model.addAttribute("allRecipe", allRecipe);
		System.out.println(allRecipe);
		return "recipe/recipeList";
	}
		
}
