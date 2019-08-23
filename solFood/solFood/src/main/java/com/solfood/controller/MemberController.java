package com.solfood.controller;

import java.util.List;
import java.util.Locale;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.solfood.dto.MemberVO;
import com.solfood.dto.TotalVO;
import com.solfood.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	//============================================================
	//	로그인
	//============================================================
	//---------------------------------------------
	// login form
	//---------------------------------------------
	@RequestMapping("login.do")
	   public String login(){
	       return "member/login";   
	}
	    
	//---------------------------------------------
	// login process
	//---------------------------------------------
	@RequestMapping(value="loginPro.do")
	public String loginProcess(HttpSession session, HttpServletRequest request, MemberVO dto, Model model){
	    String returnURL = "";
	    if ( session.getAttribute("login") != null ){
	        session.removeAttribute("login"); 					// 기존에 login이란 세션 값이 존재한다면 기존값을 제거해 준다.
	    }
	    MemberVO vo = memberService.login(dto);					// 로그인이 성공하면 UserVO 객체를 반환함.
	         
	    // 로그인 성공
	    if (vo!= null){ 
	        session.setAttribute("login", vo); 					// 세션에 login인이란 이름으로 UserVO 객체를 저장
	        
	        // account_grade를 managerMainInterceptor에서 사용하기 위해 session으로 넣어주기
	        session.setAttribute("account_grade", vo.getAccount_grade());	   
	        session.setAttribute("account_user", vo.getAccount_user());
	        model.addAttribute("account_user", vo.getAccount_user());
	        request.setAttribute("account_user", vo.getAccount_user());
	        
	        System.out.println("==============================로그인 성공");
	        returnURL = "redirect:/"; 							// 로그인 성공시 메인으로 바로 이동
		        
	    // 로그인에 실패한 경우
	    }else { 
	        returnURL = "redirect:/login.do"; 					// 로그인 폼으로 다시 가도록 함
	        System.out.println("==============================로그인 실패");
	    }    
	    return returnURL; 										// 위에서 설정한 returnURL 을 반환해서 이동시킴
	}
	
		
	//---------------------------------------------
	//	logout form
	//---------------------------------------------
	   @RequestMapping("logout.do")
	   public ModelAndView logout(HttpSession session){
	       memberService.logout(session);
	       ModelAndView mav = new ModelAndView();
	       mav.setViewName("member/login");
	       mav.addObject("msg", "logout");
	       return mav;
	   }
	//---------------------------------------------
	//	logout process
	//---------------------------------------------
	
	
	//============================================================
	//	회원가입
	//============================================================
	// 회원가입
	@RequestMapping(value = "/joinMember.do")
	public String joinMember() throws Exception{
		return "/member/joinMember";
	}
	
	@RequestMapping(value = "/joinMemberPro.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String joinMemberPro(MemberVO vo, Model model) throws Exception{		
		memberService.joinMember(vo);
		model.addAttribute("account_name", vo.getAccount_name());
		
		return "/member/joinComp";
	}
	
	// 회원가입 완료페이지 이동
	@RequestMapping(value="/joinComp.do")
	public String joinComp() {
		return "/member/joinComp";
	}
	
	// 아이디 체크 
	@ResponseBody
	@RequestMapping(value="/check_id.do")
	public String check_id(String account_user) throws Exception{
		int idCount= memberService.check_id(account_user);
		
		if(account_user.trim()== null || account_user.trim()== "") {
			return "null";
		} else if(idCount== 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//===============================================================
	// 회원정보 수정
	//===============================================================
	// 마이페이지 이동
	@RequestMapping(value="/mypage.do")
	public String mypage() throws Exception{
		return "/member/mypage";
	}	
	
	//***************************************************
	//	mypage 수정 고쳐야함!!!- 8/2 영민 기준
	//***************************************************
	@RequestMapping(value="/updateMyAccount.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String updateMyAccount(HttpServletRequest request, HttpSession session) throws Exception{
		MemberVO memberVo= new MemberVO();
		
		memberService.updateMyAccount(memberVo);								
		
		MemberVO afterUpdate= new MemberVO();									// 새로운 memberVO 객체 생성
		afterUpdate= memberService.login(memberVo);								// select * from account where account_user=? 의 결과값 넣기
		session.setAttribute("login", afterUpdate);								// 그 결과값을 다시 login attribute에 넣기
		session.setAttribute("account_grade", afterUpdate.getAccount_grade());
	
		return "member/mypageComp"; 
	}
	
	@RequestMapping(value="/mypageComp.do")
	public String mypageComp() throws Exception{
		return "/member/mypageComp";
	}
	
	//===============================================================
	// 회원정보 탈퇴
	//===============================================================
	@RequestMapping(value="/dismiss.do")
	public String getDeleteByUser(MemberVO memberVo) throws Exception{
		memberService.deleteMyAccount(memberVo);
		
		return "redirect:logout.do";
	}
	
}
