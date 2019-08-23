package com.solfood.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.solfood.dto.TotalVO;

@Repository
public interface RecipeDAO {
		public List<TotalVO> selectRecipe(int recipe_id) throws Exception;	
		
		public List<TotalVO> allRecipe() throws Exception;

		public List<TotalVO> relateProduct(String recipe_keyword) throws Exception;	
		
		public TotalVO getRecipe(int recipe_id) throws Exception;	
}
