package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public class BuyDAOImpl implements BuyDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.buyMapper";
	
	//--------------------------------------------------------------
	//	select
	//--------------------------------------------------------------
	@Override
	public List<TotalVO> selectBuy(String account_user) throws Exception {
		return sqlSession.selectList(Namespace+".selectBuy", account_user);
	}
	
	@Override
	public List<TotalVO> selectBuyInfo(String account_user) throws Exception {
		return sqlSession.selectList(Namespace+".selectBuyInfo", account_user);
	}
	
	//--------------------------------------------------------------
	//	insert
	//--------------------------------------------------------------
	@Override
	public void insertBuy(TotalVO vo) throws Exception {
		sqlSession.insert(Namespace+".insertBuy", vo);		
	}

	//--------------------------------------------------------------
	//	delete
	//--------------------------------------------------------------
	

	//--------------------------------------------------------------
	//	update
	//--------------------------------------------------------------
	

}
