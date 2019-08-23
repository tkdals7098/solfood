package com.solfood.service;
import java.util.List;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

public interface HeartService {
	public List<TotalVO> selectHeartForHeartList(String account_user) throws Exception; 
	public List<TotalVO> selectHeartForProductList() throws Exception; 
	public void insertHeart (TotalVO vo) throws Exception;
	public void deleteHeart(TotalVO vo) throws Exception;
}
