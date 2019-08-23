package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public class ChartDAOImpl implements ChartDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.chartMapper";
	
	@Override
	public List<TotalVO> chart_mostSelllingProducts_201907() throws Exception {
		return sqlSession.selectList(Namespace+".chart_mostSelllingProducts_201907");
	}
	@Override
	public List<TotalVO> chart_sellingProductsByCategory_201907() throws Exception {
		return sqlSession.selectList(Namespace+".chart_sellingProductsByCategory_201907");
	}
	@Override
	public List<TotalVO> chart_mostLikedProducts() throws Exception {
		return sqlSession.selectList(Namespace+".chart_mostLikedProducts");
	}

	@Override
	public List<TotalVO> chart_searchKeyword() throws Exception {
		return sqlSession.selectList(Namespace+".chart_searchKeyword");
	}
	
}
