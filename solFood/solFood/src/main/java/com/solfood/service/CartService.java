package com.solfood.service;
import java.util.List;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

public interface CartService {
	public List<TotalVO> selectCart(String account_user) throws Exception;
	public int selectCart_alreadyInOrNot(TotalVO vo) throws Exception;
	public void insertCart(TotalVO vo) throws Exception;
	public void deleteCart(TotalVO vo) throws Exception;
	public void clearCart(String account_user) throws Exception;
	public void updateCart(TotalVO vo) throws Exception;
	public void updateCart_plusCartCount(TotalVO vo) throws Exception;
	public void updateCart_minusCartCount(TotalVO vo) throws Exception;
}
