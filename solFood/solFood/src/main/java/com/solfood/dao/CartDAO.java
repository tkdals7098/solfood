package com.solfood.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public interface CartDAO {
	//---------------------------------------------------
	//	select 
	//---------------------------------------------------
	// account_user별로 cart의 상품 목록 보기
	public List<TotalVO> selectCart(String account_user) throws Exception;	

	// cart에 해당 상품이 이미 있는지 검사
	public int selectCart_alreadyInOrNot(TotalVO vo) throws Exception;
	
	//---------------------------------------------------
	//	insert 
	//---------------------------------------------------
	// cart에 상품 추가하기
	public void insertCart(TotalVO vo) throws Exception;
	
	//---------------------------------------------------
	//	delete 
	//---------------------------------------------------
	// account_user별로 cart에서 특정한 상품 삭제하기 // parameter String으로 하면 하나밖에 못받아서 VO로 해놨슴다
	public void deleteCart(TotalVO vo) throws Exception;
	
	// account_user별로 cart clear 하기 
	public void clearCart(String account_user) throws Exception;
	
	//---------------------------------------------------
	//	update 
	//---------------------------------------------------
	// account_user별로 특정한 상품 count수정하기
	public void updateCart(TotalVO vo) throws Exception; 
	
	// cart에 이미 있는 상품 또 담으면, cart_count만 올라가게// cart_count + 수량 조정하기
	public void updateCart_plusCartCount(TotalVO vo) throws Exception; 
	
	// cart_count - 수량 조정하기 
	public void updateCart_minusCartCount(TotalVO vo) throws Exception;
	
	
}






