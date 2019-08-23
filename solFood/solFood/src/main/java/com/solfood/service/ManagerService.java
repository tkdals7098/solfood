package com.solfood.service;

import java.util.List;

import com.solfood.dto.BoardVO;
import com.solfood.dto.BuyVO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.ProductVO;
import com.solfood.dto.TotalVO;
import com.solfood.utils.Criteria;


public interface ManagerService {
	
	public List<BuyVO> selectBuy() throws Exception;								//구매내역 리스트
	public BuyVO buyDetail(int buy_id) throws Exception;							//구매내역 상세조회
	public void updateBuyDetail(BuyVO vo) throws Exception;							//구매내역 수정
	
	
	public List<BoardVO> selectBoard() throws Exception;

	 
	//=============================================================================================
	//회원
	//=============================================================================================
	public List<MemberVO> selectMember() throws Exception;							//회원조회
	public List<MemberVO> pageAccount(Criteria cri) throws Exception;				//회원페이지
	public int countAccount() throws Exception;										//회원페이지 : 카운트
	
    public MemberVO memberDetail(String account_user) throws Exception;				//회원정보 상세페이지
	public void updateMember(MemberVO vo) throws Exception;							//회원정보 수정
	public void deleteMember(MemberVO vo) throws Exception;							//회원정보 삭제
    																				//회원등록 => MemberController

	
	//=============================================================================================
	//상품
	//=============================================================================================
	public List<ProductVO> selectProduct() throws Exception;						//상품조회
	public List<ProductVO> pageProduct(Criteria cri) throws Exception;				//상품페이지
	public int countProduct() throws Exception;										//상품페이지 : 카운트
	
	public ProductVO productDetail(int product_id) throws Exception;				//상품정보 상세페이지
	public void updateProduct(ProductVO vo) throws Exception;						//상품정보 수정
	public void deleteProduct(ProductVO vo) throws Exception;						//상품정보 삭제
	void insertProduct(ProductVO vo) throws Exception;							 	//상품등록
	
	
	//=============================================================================================
	// 레시피 
	//=============================================================================================
	public List<TotalVO> selectRecipe() throws Exception;							//레시피 조회
	
	public List<TotalVO> selectRecipeDetail(int recipe_id) throws Exception;				//특정 레시피 조회
	public void insertRecipe(TotalVO vo) throws Exception;							//레시피 등록 
	public void insertRelateRP(TotalVO vo) throws Exception;
	
	public void updateRecipe(TotalVO vo) throws Exception;							//레시피 수정
	public void deleteRecipe(int recipe_id) throws Exception;						//레시피 삭제
	
	

}



