package com.solfood.service;
import java.util.List;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

public interface RecentService {
	public List<TotalVO> selectRecent(String account_user) throws Exception;	
	
	public void insertRecent(TotalVO vo) throws Exception;
	
}
