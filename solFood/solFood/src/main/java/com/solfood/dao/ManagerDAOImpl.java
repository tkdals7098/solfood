package com.solfood.dao;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.solfood.dto.BoardVO;
import com.solfood.dto.BuyVO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.ProductVO;
import com.solfood.dto.TotalVO;
import com.solfood.utils.Criteria;
 
@Repository
public class ManagerDAOImpl implements ManagerDAO {
    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.solfood.mapper.managerMapper";
    
    
	
  	//===================================================================================================
  	//	buy/ board
  	//===================================================================================================
	/* 구매내역 리스트 */
	@Override
	public List<BuyVO> selectBuy() throws Exception {
		return sqlSession.selectList(Namespace+".selectBuy");
	}
	/* 구매내역 상세페이지 */
	@Override
	public BuyVO buyDetail(int buy_id) throws Exception {
		return sqlSession.selectOne(Namespace+".buyDetail", buy_id);
	}

	//게시판
	@Override
	public List<BoardVO> selectBoard() throws Exception {
		return sqlSession.selectList(Namespace+".selectBoard");
	}
	
	
	//===================================================================================================
	//회원
	//===================================================================================================
	/* 회원조회 */
    @Override
    public List<MemberVO> selectMember() throws Exception {
        return sqlSession.selectList(Namespace+".selectMember");
    }
	/* 회원정보 상세페이지 */
	@Override
	public MemberVO memberDetail(String account_user) throws Exception {
		return sqlSession.selectOne(Namespace+".memberDetail", account_user);
	}
	/* 회원정보 수정 */
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		sqlSession.update(Namespace+".updateMember", vo);
	}
	/* 회원정보 삭제 */
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		sqlSession.delete(Namespace+".deleteMember", vo);
	}
	/* 회원페이지 */
	@Override
	public List<MemberVO> pageAccount(Criteria cri) throws Exception {
		return sqlSession.selectList(Namespace+".pageAccount", cri);
	}
	@Override
	public int countAccount() throws Exception {
		return sqlSession.selectOne(Namespace+".countAccount");
	}

	//===================================================================================================
  	//상품
  	//===================================================================================================
	/* 상품조회 */
  	@Override
	public List<ProductVO> selectProduct() throws Exception {
		return sqlSession.selectList(Namespace+".selectProduct");
	}
	/* 상품정보 상세페이지 */
	@Override
	public ProductVO productDetail(int product_id) throws Exception {
		return sqlSession.selectOne(Namespace+".productDetail", product_id);
	}
	/* 상품정보 수정 */
	@Override
	public void updateProduct(ProductVO vo) throws Exception {
		sqlSession.update(Namespace+".updateProduct", vo);		
	}
	/* 상품정보 삭제 */
	@Override
	public void deleteProduct(ProductVO vo) throws Exception{
		sqlSession.delete(Namespace+".deleteProduct", vo);
	}
	/* 상품등록 */
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		sqlSession.insert(Namespace+".insertProduct", vo);
	}
	/* 상품페이지 */
	@Override
	public int countProduct() throws Exception {
		return sqlSession.selectOne(Namespace+".countProduct");
	}
	@Override
	public List<ProductVO> pageProduct(Criteria cri) throws Exception {
		return sqlSession.selectList(Namespace+".pageProduct", cri);
	}
	
	//===================================================================================================
  	// 레시피
  	//===================================================================================================
	/* 레시피 조회 */
	@Override
	public List<TotalVO> selectRecipe() throws Exception {
		return sqlSession.selectList(Namespace+".selectRecipe");
	}
	@Override
	public List<TotalVO> selectRecipeDetail(int recipe_id) throws Exception {
		return sqlSession.selectList(Namespace+".selectRecipeDetail", recipe_id);
	}
	@Override
	public void insertRecipe(TotalVO vo) throws Exception {
		sqlSession.insert(Namespace+".insertRecipe", vo);
	}
	@Override
	public void updateRecipe(TotalVO vo) throws Exception {
		sqlSession.update(Namespace+".updateRecipe", vo);
	}
	@Override
	public void deleteRecipe(int recipe_id) throws Exception {
		sqlSession.delete(Namespace+".deleteRecipe", recipe_id);
	}
	@Override
	public void insertRelateRP(TotalVO vo) throws Exception {
		sqlSession.insert(Namespace+".insertRelateRP", vo);
	}
	
	
	@Override
	public void updateBuyDetail(BuyVO vo) throws Exception {
		sqlSession.update(Namespace+".updateBuyDetail", vo);
	}


	
}
