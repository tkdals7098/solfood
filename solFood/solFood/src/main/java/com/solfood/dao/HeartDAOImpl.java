package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public class HeartDAOImpl implements HeartDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.heartMapper";
	
	//-----------------------------------------------------------------------
	//	select 
	//-----------------------------------------------------------------------
	@Override
	public List<TotalVO> selectHeartForHeartList(String account_user) throws Exception {
		return sqlSession.selectList(Namespace+".selectHeartForHeartList", account_user);
	}
	@Override
	public List<TotalVO> selectHeartForProductList() throws Exception {
		return sqlSession.selectList(Namespace+".selectHeartForProductList");
	}
	
	//-----------------------------------------------------------------------
	//	insert 
	//-----------------------------------------------------------------------
	// heart 누르면 heart 테이블로 들어가게 하기 
	@Override
	public void insertHeart(TotalVO vo) throws Exception {
		sqlSession.insert(Namespace+".insertHeart", vo);
	}
	
	//-----------------------------------------------------------------------
	//	delete 
	//-----------------------------------------------------------------------
	@Override
	public void deleteHeart(TotalVO vo) throws Exception {
		sqlSession.delete(Namespace+".deleteHeart", vo);
	}
	


	
}
