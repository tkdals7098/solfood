package com.solfood.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public interface HeartDAO {
	//-------------------------------------------------------------
	//	SELECT 
	//-------------------------------------------------------------
		// heart에 있는 목록 보기 for heartList
		public List<TotalVO> selectHeartForHeartList(String account_user) throws Exception;
		
		// heart에 있는 목록 보기 for productList
		public List<TotalVO> selectHeartForProductList() throws Exception;
		
	//-------------------------------------------------------------
	//	INSERT 
	//-------------------------------------------------------------
		// heart 누르면 heart 테이블로 상품 들어가게 해주기 
		public void insertHeart (TotalVO vo) throws Exception;
		
	//-------------------------------------------------------------
	//	DELETE
	//-------------------------------------------------------------
		public void deleteHeart(TotalVO vo) throws Exception;
}
