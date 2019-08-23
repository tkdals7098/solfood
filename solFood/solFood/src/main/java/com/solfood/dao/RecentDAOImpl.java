package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public class RecentDAOImpl implements RecentDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.recentMapper";
	
	//--------------------------------------------------------------
	//	select
	//--------------------------------------------------------------
	@Override
	public List<TotalVO> selectRecent(String account_user) throws Exception {
		return sqlSession.selectList(Namespace+".selectRecent", account_user);
	}
	
	
	
	//--------------------------------------------------------------
	//	insert
	//--------------------------------------------------------------
	@Override
	public void insertRecent(TotalVO vo) throws Exception {
		sqlSession.insert(Namespace+".insertRecent", vo);		
	}

	//--------------------------------------------------------------
	//	delete
	//--------------------------------------------------------------
	

	//--------------------------------------------------------------
	//	update
	//--------------------------------------------------------------
	

}
