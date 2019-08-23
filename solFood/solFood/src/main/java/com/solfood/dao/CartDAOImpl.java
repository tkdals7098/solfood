package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public class CartDAOImpl implements CartDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.cartMapper";
	
	//--------------------------------------------------------------
	//	select
	//--------------------------------------------------------------
	@Override
	public List<TotalVO> selectCart(String account_user) throws Exception {
		return sqlSession.selectList(Namespace+".selectCart", account_user);
	}
	@Override
	public int selectCart_alreadyInOrNot(TotalVO vo) throws Exception {
		return sqlSession.selectOne(Namespace+".selectCart_alreadyInOrNot", vo);
	}

	//--------------------------------------------------------------
	//	insert
	//--------------------------------------------------------------
	@Override
	public void insertCart(TotalVO vo) throws Exception {
		sqlSession.insert(Namespace+".insertCart", vo);
	}
	
	//--------------------------------------------------------------
	//	delete
	//--------------------------------------------------------------
	@Override
	public void deleteCart(TotalVO vo) throws Exception {
		sqlSession.delete(Namespace+".deleteCart", vo);
	}
	
	@Override
	public void clearCart(String account_user) throws Exception {
		sqlSession.delete(Namespace+".clearCart", account_user);		
	}
	//--------------------------------------------------------------
	//	update
	//--------------------------------------------------------------
	@Override
	public void updateCart(TotalVO vo) throws Exception {
		sqlSession.update(Namespace+".updateCart", vo);
	}

	@Override
	public void updateCart_plusCartCount(TotalVO vo) throws Exception {
		sqlSession.update(Namespace+".updateCart_plusCartCount", vo);
		
	}
	@Override
	public void updateCart_minusCartCount(TotalVO vo) throws Exception {
		sqlSession.update(Namespace+".updateCart_minusCartCount", vo);
		
	}
	

}
