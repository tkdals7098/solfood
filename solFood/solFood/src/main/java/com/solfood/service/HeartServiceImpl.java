package com.solfood.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.solfood.dao.CartDAO;
import com.solfood.dao.HeartDAO;
import com.solfood.dao.ProductDAO;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Service
public class HeartServiceImpl implements HeartService{
	@Inject
	private HeartDAO dao;
	
	//----------------------------------------------------------
	//	select
	//----------------------------------------------------------
	@Override
	public List<TotalVO> selectHeartForHeartList(String account_user) throws Exception {
		return dao.selectHeartForHeartList(account_user);
	}
	
	@Override
	public List<TotalVO> selectHeartForProductList() throws Exception {
		return dao.selectHeartForProductList();
	}


	//----------------------------------------------------------
	//	insert
	//----------------------------------------------------------	
	@Override
	public void insertHeart(TotalVO vo) throws Exception {
		dao.insertHeart(vo);
	}
	
	//----------------------------------------------------------
	//	insert
	//----------------------------------------------------------	
	@Override
	public void deleteHeart(TotalVO vo) throws Exception {
		dao.deleteHeart(vo);
	}

	
}
