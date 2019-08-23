package com.solfood.controller;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.solfood.dto.CartVO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.TotalVO;
import com.solfood.service.BuyService;
import com.solfood.service.CartService;
import com.solfood.service.MemberService;
import com.solfood.service.ProductService;
import com.solfood.service.ProductServiceImpl;

@Controller
@RequestMapping("/cart/")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	@Inject
	private CartService 	cartService;	
	@Inject
	private ProductService 	productService;
	@Inject
	private BuyService 		buyService;
	
	//============================================================
	//	selectCart--> account_user 별로 cart에 있는 상품 모두 불러오기
	//============================================================	
	@RequestMapping(value = "/cartList.do")
	public List<TotalVO> selectCart(Model model, String account_user) throws Exception{		
		
		List<TotalVO> cartList= cartService.selectCart(account_user);						
		model.addAttribute("cartList", cartList);
	
		return cartList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/cartList2.do")
	public List<TotalVO> selectCart2(Model model, String account_user) throws Exception{		
		
		List<TotalVO> cartList= cartService.selectCart(account_user);						
		model.addAttribute("cartList", cartList);
	
		return cartList;
	}
	
	//============================================================
	//	deleteCart--> account_user별로, cart에서 선택한 상품 삭제하기
	//============================================================
	@RequestMapping(value = "/cartDelete.do")
	public void deleteCart(String account_user, int product_id, HttpServletRequest request) throws Exception{		
		// 삭제하기
		System.out.println("====================================== 여기는 cartDelete.do");
		
		// cartList에서 account_user, product_id 받아와서 vo에 넣어주기	
		account_user= request.getParameter("account_user");								
		product_id= Integer.parseInt(request.getParameter("product_id"));
				
		TotalVO vo= new TotalVO();
		vo.setAccount_user(account_user);
		vo.setProduct_id(product_id);		
		
		
		// 쿼리문: DELETE FROM CART WHERE ACCOUNT_USER= ? AND PRODUCT_ID= ?
		cartService.deleteCart(vo);
		
		
		// 해당 account_user의 cartList로 redirect로 새로고침해서 보내주기
		// String returnURI= "redirect:/cart/cartList.do?account_user="+ account_user;
		// return  returnURI;
	}
	
	
	//============================================================
	//	insertCart--> cart에 상품 넣기// cart_id, cart_date는 자동으로 들어가게 해둠
	//============================================================
	@ResponseBody
	@RequestMapping(value = "/cartInsert.do")
	public String insertCart(int product_id, String account_user, int purchase_count, HttpServletRequest request) throws Exception{	
		TotalVO vo= new TotalVO();
		vo.setProduct_id(product_id);
		vo.setAccount_user(account_user);		
		
		// product_id에 해당하는 product_count 알아보기
		List<TotalVO> result= productService.selectProduct(product_id);
		int product_count= result.get(0).getProduct_count();	
		
		// cart에 있는 해당 상품의 count 수 구하기 
		int cart_count= cartService.selectCart_alreadyInOrNot(vo);
		

		// cart_count 수량이 product_count 수량을 넘지 않는 선에서 수량 + ---> cart_count가 product_count 안넘게가 지금 안돼서 걍 일단 했어여
		if(product_count== 0) {
			return "outOfStock";
		
		} else if(cart_count== 0) {
			if(purchase_count> product_count) {
				return "overStock";
			} else {
				vo.setCart_count(purchase_count);
				cartService.insertCart(vo);
				return "success";
			}
			
		} else if(cart_count> 0) {
			if(cart_count< product_count) {
				return "replace";
			}
		}
		return "";
	}
		
	//============================================================
	//	searchProductCount()--> product count 불러다주기
	//============================================================
	@ResponseBody
	@RequestMapping(value = "/searchProductCount.do")
	public int searchProductCount(int product_id) throws Exception{	
		int result= productService.selectProduct_count_individually(product_id);
		
		return result;
	}
	
	//============================================================
	//	cartDeleteOutOfStock--> cart에 있는 상품 중 product_count가 0인거는 삭제해줌 
	//============================================================
	@ResponseBody
	@RequestMapping(value = "/cartDeleteOutOfStock.do")
	public void cartDeleteOutOfStock(String account_user) throws Exception{
		List<TotalVO> productCountList= productService.selectProduct_count();				// product_id, product_count를 추출해서 list에 담기		
		

		// product_count가 0인게 있는지 검사
		for(int i=0; i<productCountList.size(); i++) {
			int product_count= productCountList.get(i).getProduct_count();					// list에서 product_count, id 뽑기
			int product_id= productCountList.get(i).getProduct_id();

			
			// product_count가 0이면 cartList에서 해당 상품 삭제
			if(product_count== 0) {		
				TotalVO vo= new TotalVO();
				vo.setProduct_id(product_id);
				vo.setAccount_user(account_user);
				cartService.deleteCart(vo);	
			} 
		}
	}
	
	
	
	//============================================================
	//	cartPlus--> cart에 있는 상품 중 + 로 수량 조정
	//============================================================
	@RequestMapping(value = "/cartPlus.do")
	public String cartPlus(TotalVO vo, HttpServletRequest request) throws Exception{		
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String account_user= request.getParameter("account_user");
		int cart_count= Integer.parseInt(request.getParameter("cart_count"));
			
		vo.setProduct_id(product_id);
		vo.setAccount_user(account_user);

		System.out.println("============================================== ffff "+ product_id+ account_user+ cart_count);
		
		
		// product_id에 해당하는 product_count 알아보기
		List<TotalVO> result= productService.selectProduct(product_id);
		int product_count_fromDB= result.get(0).getProduct_count();
		
		// cart_count 수량이 product_count 수량을 넘지 않는 선에서 수량 + 하려고 했을 때, 품절된 상품이면 alert띄워주고 cart에서 삭제하기 
		if(cart_count< product_count_fromDB) {
			if(product_count_fromDB<= 0) {
				System.out.println("===================== 품절된 상품입니다// 이거를 alert로 해주기");
				
				cartService.deleteCart(vo);	
			} else {
				cartService.updateCart_plusCartCount(vo);
			}
		}
		
		String returnURI= "redirect:/cart/cartList.do?account_user="+ account_user;
		return returnURI;
	}
	
	
	//============================================================
	//	cartMinus--> cart에 있는 상품 중 - 로 수량 조정
	//============================================================
	@RequestMapping(value = "/cartMinus.do")
	public String cartMinus(TotalVO vo, HttpServletRequest request) throws Exception{
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String account_user= request.getParameter("account_user");
		int cart_count= Integer.parseInt(request.getParameter("cart_count"));

		vo.setProduct_id(product_id);
		vo.setAccount_user(account_user);
		
		// product_id에 해당하는 product_count 알아보기
		List<TotalVO> result= productService.selectProduct(product_id);
		int product_count_fromDB= result.get(0).getProduct_count();
	
		// cart_count가 0 이하가 아닌 선까지 -를 해주고, 0 이하가 되면 '장바구니에서 삭제하시겠습니까?' alert 띄워주기
		if(product_count_fromDB> 0) {
			if(cart_count> 0) {
				cartService.updateCart_minusCartCount(vo);
			} else {
				System.out.println("=========================== 상품을 아예 카트에서 삭제하시겠습니까? alert");
			}
		}
			
		String returnURI= "redirect:/cart/cartList.do?account_user="+ account_user;
		return returnURI;
	}
	
	//============================================================
	//	cartToBuy--> cart에서 buy로 보내기
	//============================================================
	@RequestMapping(value = "/cartToBuy.do")
	public void cartToBuy(String account_user) throws Exception{		
		List<TotalVO> cartList= cartService.selectCart(account_user);
		
		for(int i=0; i<cartList.size(); i++) {
			TotalVO vo= new TotalVO();
			vo.setAccount_user(account_user);
			vo.setProduct_id(cartList.get(i).getProduct_id());
			vo.setBuy_count(cartList.get(i).getCart_count());
			
			
			// 품절 상품은 buy로 안넘어가기 빼기
			List<TotalVO> result= productService.selectProduct(cartList.get(i).getProduct_id());
			int product_count_fromDB= result.get(0).getProduct_count();
			
			System.out.println("======================= 재고: "+product_count_fromDB);
			
			if(product_count_fromDB== 0) {
				cartService.deleteCart(vo);	
				
			} else {
				// cart에서 buy로 데이터 집어넣기
				buyService.insertBuy(vo);		
				
				// buy로 넘어갈 때, 산만큼 product_count 빼주기 (재고관리)			
				productService.updateProduct_count_minus(vo);	
				
				// cart 클리어 해주기
				clearCart(account_user);
			}
		}
	}
	
	
	//============================================================
	//	clearCart--> cart 클리어 하기 
	//============================================================
	@RequestMapping(value = "/clearCart.do")
	public void clearCart(String account_user) throws Exception{
		cartService.clearCart(account_user);
	}
	
	
	//============================================================
	//	pay()--> pay 창
	//============================================================
	@RequestMapping(value = "/pay.do")
	public String pay() throws Exception{
		System.out.println("============================== pay.do");
		
		return "buy/pay";
	}
	
	@ResponseBody
	@RequestMapping(value = "/pay2.do")
	public List<TotalVO> pay2(Model model, String account_user) throws Exception{
		System.out.println("============================== pay2.do");
		
		List<TotalVO> buyInfoList= buyService.selectBuyInfo(account_user);
		model.addAttribute("buyInfoList", buyInfoList);
				
		return buyInfoList;
	}
}






