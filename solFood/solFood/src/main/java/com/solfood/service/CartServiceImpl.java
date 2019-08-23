package com.solfood.service;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.solfood.dao.CartDAO;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Service
public class CartServiceImpl implements CartService{
	@Inject
	private CartDAO dao;
	
	//------------------------------------------------------------------
	//	select
	//------------------------------------------------------------------
	@Override
	public List<TotalVO> selectCart(String account_user) throws Exception{
		return dao.selectCart(account_user);
	}
	@Override
	public int selectCart_alreadyInOrNot(TotalVO vo) throws Exception {
		return dao.selectCart_alreadyInOrNot(vo);
	}
	
	//------------------------------------------------------------------
	//	insert
	//------------------------------------------------------------------
	@Override
	public void insertCart(TotalVO vo) throws Exception {
		dao.insertCart(vo);
	}

	//------------------------------------------------------------------
	//	delete
	//------------------------------------------------------------------
	@Override
	public void deleteCart(TotalVO vo) throws Exception {
		dao.deleteCart(vo);
	}
	@Override
	public void clearCart(String account_user) throws Exception {
		dao.clearCart(account_user);
	}
	
	//------------------------------------------------------------------
	//	update
	//------------------------------------------------------------------
	@Override
	public void updateCart(TotalVO vo) throws Exception {
		dao.updateCart(vo);
	}
	@Override
	public void updateCart_plusCartCount(TotalVO vo) throws Exception {
		dao.updateCart_plusCartCount(vo);
	}
	@Override
	public void updateCart_minusCartCount(TotalVO vo) throws Exception {
		dao.updateCart_minusCartCount(vo);
		
	}
	
	
}
