package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.TotalVO;

@Repository
public class RecipeDAOImpl implements RecipeDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.recipeMapper";
	
	//-----------------------------------------------------------------------
	//	select 
	//-----------------------------------------------------------------------
	@Override
	public List<TotalVO> selectRecipe(int recipe_id) throws Exception {
		return sqlSession.selectList(Namespace+".selectRecipe", recipe_id);
	}
	
	@Override
	public List<TotalVO> allRecipe() throws Exception {
		return sqlSession.selectList(Namespace+".allRecipe");
	}

	@Override
	public List<TotalVO> relateProduct(String recipe_keyword) throws Exception {
		return sqlSession.selectList(Namespace+".relateProduct");
	}
    
	@Override
	public TotalVO getRecipe(int recipe_id) throws Exception {
		return sqlSession.selectOne(Namespace+".getRecipe", recipe_id);
	}
	
}
