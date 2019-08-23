package com.solfood.service;
import java.util.List;
import com.solfood.dto.TotalVO;

public interface RecipeService {
	public List<TotalVO> selectRecipe(int recipe_id) throws Exception;
	public List<TotalVO> allRecipe() throws Exception;
	public List<TotalVO> relateProduct(String recipe_keyword) throws Exception;
	public TotalVO getRecipe(int recipe_id)  throws Exception;
}
