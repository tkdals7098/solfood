package com.solfood.service;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.solfood.dao.BuyDAO;
import com.solfood.dao.CartDAO;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Service
public class BuyServiceImpl implements BuyService{
	@Inject
	private BuyDAO dao;

	//------------------------------------------------------------------
	//	select
	//------------------------------------------------------------------
	@Override
	public List<TotalVO> selectBuy(String account_user) throws Exception {
		return dao.selectBuy(account_user);
	}

	@Override
	public List<TotalVO> selectBuyInfo(String account_user) throws Exception {
		return dao.selectBuyInfo(account_user);
	}
	//------------------------------------------------------------------
	//	insert
	//------------------------------------------------------------------
	@Override
	public void insertBuy(TotalVO vo) throws Exception {
		dao.insertBuy(vo);
	}

	//------------------------------------------------------------------
	//	delete
	//------------------------------------------------------------------
	

	//------------------------------------------------------------------
	//	update
	//------------------------------------------------------------------
	
	
}
