package com.solfood.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public interface RecentDAO {
	//---------------------------------------------------
	//	select 
	//---------------------------------------------------
	public List<TotalVO> selectRecent(String account_user) throws Exception;
	
	//---------------------------------------------------
	//	insert 
	//---------------------------------------------------
	public void insertRecent(TotalVO vo) throws Exception;
	
	
	//---------------------------------------------------
	//	delete 
	//---------------------------------------------------
	
	
	//---------------------------------------------------
	//	update 
	//---------------------------------------------------
	
	
}






