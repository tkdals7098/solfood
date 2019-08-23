package com.solfood.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.solfood.dao.ManagerDAO;
import com.solfood.dto.BoardVO;
import com.solfood.dto.BuyVO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.ProductVO;
import com.solfood.dto.TotalVO;
import com.solfood.utils.Criteria;
 
@Service
public class ManagerServiceImpl implements ManagerService {
   
	@Inject
    private ManagerDAO dao;
    
    //-------------------------------------------------------
    //	product
    //-------------------------------------------------------
	/* 상품 조회 */
	@Override
	public List<ProductVO> selectProduct() throws Exception {
		 return dao.selectProduct();
	}
	/* 상품정보 업데이트 */
	@Override
	public void updateProduct(ProductVO vo) throws Exception {
		dao.updateProduct(vo);
	}
	/* 상품정보 삭제 */
	@Override
	public void deleteProduct(ProductVO vo) throws Exception{
		dao.deleteProduct(vo);
	}
	/* 상품등록 */
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		dao.insertProduct(vo);
	}
	/* 상품정보 상세조회 */
	@Override
	public ProductVO productDetail(int product_id) throws Exception {
		return dao.productDetail(product_id);
	}
	@Override
	public List<ProductVO> pageProduct(Criteria cri) throws Exception {
		return dao.pageProduct(cri);
	}
	@Override
	public int countProduct() throws Exception {
		return dao.countProduct();
	}
	
	//-------------------------------------------------------
    //	buy
    //-------------------------------------------------------
	/* 구매내역 리스트 */
	@Override
	public List<BuyVO> selectBuy() throws Exception {
		 return dao.selectBuy();
	}

	/* 구매내역 상세페이지 */
	@Override
	public BuyVO buyDetail(int buy_id) throws Exception {
		return dao.buyDetail(buy_id);
	}
	@Override
	public void updateBuyDetail(BuyVO vo) throws Exception {
		dao.updateBuyDetail(vo);
	}

	@Override
	public List<BoardVO> selectBoard() throws Exception {
		 return dao.selectBoard();
	}
	
	//-------------------------------------------------------
    //	account
    //-------------------------------------------------------
	/* 회원조회 */
    @Override
    public List<MemberVO> selectMember() throws Exception {
        return dao.selectMember();
    }
	/* 회원정보 상세조회 */
	@Override
	public MemberVO memberDetail(String account_user) throws Exception {
		return dao.memberDetail(account_user);
	}
	/* 회원정보 수정 */
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);		
	}
	/* 회원정보 삭제 */
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		dao.deleteMember(vo);
	}
	
	@Override
	public List<MemberVO> pageAccount(Criteria cri) throws Exception {
		return dao.pageAccount(cri);
	}
	@Override
	public int countAccount() throws Exception {
		return dao.countAccount();
	}
	
	//-------------------------------------------------------
    //	recipe
    //-------------------------------------------------------
	/* 레시피 조회 */
	@Override
	public List<TotalVO> selectRecipe() throws Exception {
		return dao.selectRecipe();
	}
	@Override
	public List<TotalVO> selectRecipeDetail(int recipe_id) throws Exception {
		return dao.selectRecipeDetail(recipe_id);
	}
	
	@Override
	public void insertRecipe(TotalVO vo) throws Exception {
		dao.insertRecipe(vo);
	}

	@Override
	public void updateRecipe(TotalVO vo) throws Exception {
		dao.updateRecipe(vo);
		
	}
	@Override
	public void deleteRecipe(int recipe_id) throws Exception {
		dao.deleteRecipe(recipe_id);
	}

	@Override
	public void insertRelateRP(TotalVO vo) throws Exception {
		dao.insertRelateRP(vo);
	}
	

	



}




