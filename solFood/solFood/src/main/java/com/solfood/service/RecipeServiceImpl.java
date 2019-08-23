package com.solfood.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.solfood.dao.ProductDAO;
import com.solfood.dao.RecipeDAO;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Service
public class RecipeServiceImpl implements RecipeService{
	@Inject
	private RecipeDAO dao;
	
	//----------------------------------------------------------
	//	select
	//----------------------------------------------------------
	@Override
	public List<TotalVO> selectRecipe(int recipe_id) throws Exception{
		return dao.selectRecipe(recipe_id);
	}
	
	@Override
	public List<TotalVO> allRecipe() throws Exception{
		return dao.allRecipe();
	}

	@Override
	public List<TotalVO> relateProduct(String recipe_keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.relateProduct(recipe_keyword);
	}
	
	@Override
	public TotalVO getRecipe(int recipe_id) throws Exception {
		return dao.getRecipe(recipe_id);
	}
}
