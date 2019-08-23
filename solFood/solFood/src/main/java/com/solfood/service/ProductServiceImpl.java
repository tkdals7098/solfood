package com.solfood.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.solfood.dao.CartDAO;
import com.solfood.dao.ProductDAO;
import com.solfood.dto.CartVO;
import com.solfood.dto.ProductVO;
import com.solfood.dto.SearchVO;
import com.solfood.dto.TotalVO;

@Service
public class ProductServiceImpl implements ProductService{
	@Inject
	private ProductDAO dao;
	
	//----------------------------------------------------------
	//	select
	//----------------------------------------------------------
	@Override
	public List<TotalVO> selectProduct_all() throws Exception {
		return dao.selectProduct_all();
	}
	
	@Override
	public List<TotalVO> selectProduct(int product_id) throws Exception{
		return dao.selectProduct(product_id);
	}

	@Override
	public List<TotalVO> selectProduct_count() throws Exception {
		return dao.selectProduct_count();
	}

	@Override
	public int selectProduct_count_individually(int product_id) throws Exception {
		return dao.selectProduct_count_individually(product_id);
	}
	

	@Override
	public List<TotalVO> selectProduct_category1(String product_category1) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectProduct_category1(product_category1);
	}

	@Override
	public List<TotalVO> selectProduct_category2(String product_category2) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectProduct_category2(product_category2);
	}

	@Override
	public List<TotalVO> selectEvent(int product_event) throws Exception {
		return dao.selectEvent(product_event);
	}
	
	@Override
	public List<TotalVO> showAll(String keyword_p) throws Exception {
		return dao.showAll(keyword_p);
	}

	//----------------------------------------------------------
	//	update
	//----------------------------------------------------------	
	@Override
	public void updateProduct_count_minus(TotalVO vo) throws Exception {
		dao.updateProduct_count_minus(vo);
		
	}

	//----------------------------------------------------------
	//	searchInsert
	//----------------------------------------------------------	
	@Override
	public void searchInsert(SearchVO searchvo) throws Exception {
		dao.searchInsert(searchvo);
	}
}
