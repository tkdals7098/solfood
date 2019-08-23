package com.solfood.service;
import java.util.List;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

public interface BuyService {
	public List<TotalVO> selectBuy(String account_user) throws Exception;	
	public List<TotalVO> selectBuyInfo(String account_user) throws Exception;
	
	public void insertBuy(TotalVO vo) throws Exception;
	
}
