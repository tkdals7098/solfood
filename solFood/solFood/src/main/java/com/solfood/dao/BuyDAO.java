package com.solfood.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public interface BuyDAO {
	//---------------------------------------------------
	//	select 
	//---------------------------------------------------
	public List<TotalVO> selectBuy(String account_user) throws Exception;
	public List<TotalVO> selectBuyInfo(String account_user) throws Exception;
	
	//---------------------------------------------------
	//	insert 
	//---------------------------------------------------
	public void insertBuy(TotalVO vo) throws Exception;
	
	
	//---------------------------------------------------
	//	delete 
	//---------------------------------------------------
	
	
	//---------------------------------------------------
	//	update 
	//---------------------------------------------------
	
	
}






