package com.solfood.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.solfood.dto.BoardVO;
import com.solfood.dto.CommentVO;
import com.solfood.dto.MemberVO;

//페이징 테스트
import com.solfood.dto.Criteria;
import com.solfood.dto.PageMaker;
import com.solfood.dto.SearchCriteria;
import com.solfood.service.BoardService;

@Controller // 컨트롤러인거를 명시
@RequestMapping("/board/")
public class BoardController {

	@Inject
	BoardService service;

//============================================================================================================		
	// 날짜 타입 데이터 변환
	@InitBinder
	protected void initBinder(WebDataBinder wdb) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		wdb.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

//============================================================================================================	

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {
		service.write(vo);
		return "redirect:/board/listPage";
	}

//============================================================================================================		
	// 게시물 조회
	@RequestMapping(value = "/view", method = { RequestMethod.GET, RequestMethod.POST }) //
	public void getView(@RequestParam("board_num") int board_num, Model model) throws Exception {
		BoardVO view = null;
		view = service.view(board_num);
		model.addAttribute("view", view);
	}

//=============================================================================================================		

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("board_num") int board_num, Model model) throws Exception {
		BoardVO view = null;
		view = service.view(board_num);
		model.addAttribute("view", view);
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(BoardVO vo) throws Exception {
		service.update(vo);
		return "redirect:/board/listPage";
	}

//=============================================================================================================		

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("board_num") int board_num, Model model) throws Exception {
		BoardVO view = null;
		view = service.view(board_num);
		model.addAttribute("view", view);
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(BoardVO vo) throws Exception {
		service.delete(vo.getBoard_num());
		service.deleteAfter(vo.getBoard_num());
		return "redirect:/board/listPage";
	}

//==============================================================================================================		

	// 페이징 테스트
	@RequestMapping(value = "/listPage", method = { RequestMethod.GET, RequestMethod.POST })
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listSearchCriteria(cri)); // JSP에 계산된 페이징 출력
		PageMaker pageMaker = new PageMaker(); // 객체생성
		pageMaker.setCri(cri); // setCri 메소드 사용
		pageMaker.setTotalCount(service.listSearchCount(cri)); // 전체 게시글 갯수 카운트
		model.addAttribute("pageMaker", pageMaker);
	}

//===============================================================================================================

	// 검색기능 추가 테스트 //검색할때 필요한 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listSearchCriteria(cri)); // 전체목록에 검색페이징 기능+
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri)); // 전체목록에 검색페이징 카운트+
		System.out.println(cri);
		model.addAttribute("pageMaker", pageMaker);
	}

//----------------------------------------------------------------------------------------------------------------

//===============================================================================================================	

	// selectByCategory에 검색기능 추가테스트
	@RequestMapping(value = "/selectByCategory", method = RequestMethod.GET)
	public String listcategory(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request)
			throws Exception {

		// 영민 수정
		String board_category = request.getParameter("board_category");
		cri.setBoard_category(board_category);

		List<BoardVO> list = null; // boardVO를 참조하는 list 변수를 정의한다
		list = service.selectByCategory(cri); // 정의한 list에 selectByCategory기능을 list에 넣어준다 //category를 찾는 기능

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.categoryCount(cri)); // 전체목록에 검색페이징 카운트+

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list); // 오른쪽에 list객체를 왼쪽에 list이름으로 추가한다 // 뷰코드에서는 왼쪽에 지정한 list를 통해서 오른쪽에 list을 사용한다

		return "board/selectByCategory";
	}
//================================================================================================================

	@SuppressWarnings("unchecked")

//================================================================================================================	
	/*
	 * // 영민 수정
	 * 
	 * @RequestMapping(value = "/comment.do", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public void comment() throws Exception {
	 * 
	 * }
	 */
	
	
	
	
	// 댓글 리스트인데 더 간단하게 만든버전
	@RequestMapping("/commentList") // 댓글 리스트
	@ResponseBody // ajax쓸때 필요
	public List<CommentVO> commentList(Model model, int board_num) throws Exception {
		List<CommentVO> list = service.commentList(board_num);
		
		// 삭제하기
		System.out.println("====================== commentlist  "+ list.size());

		return list;
	}

//================================================================================================================		
	/*
	 // 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {
		service.write(vo);
		return "redirect:/board/listPage";
	}

	 */
	// 댓글 작성
	@RequestMapping(value="/commentInsert", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String commentInsert(@ModelAttribute("commentVO") CommentVO commentvo,  HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		
		String account_user= request.getParameter("account_user_login");
		System.out.println("============== commentinsert의 account_user= "+ account_user);
		commentvo.setAccount_user(account_user);
		
		// 삭제하기
		System.out.println("==========================여기 commentinsert "+ commentvo.toString() );
		

		try {
			service.commentInsert(commentvo);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	// ================================================================================================================
	// 댓글 수정
	@RequestMapping("/commentUpdate")
	@ResponseBody
	public void commentUpdate(int reply_num, String reply_reComment) throws Exception {

		CommentVO vo = new CommentVO();
		vo.setReply_num(reply_num);
		vo.setReply_content(reply_reComment);

		service.commentUpdate(vo);
	}

	// 댓글 수정창
	@ResponseBody
	@RequestMapping("/commentUpdateForm") // method = RequestMethod.GET
	public String commentUpdateForm(Model model, int reply_num, String reply_content) throws Exception {// @RequestParam("reply_num")
																										// int
																										// reply_num,
																										// Model model

		service.commentUpdateForm(reply_num);
		return "success";
	}

	// =======================================================================================================================
	// 댓글 삭제
	// 삭제를 해도 댓글이 삭제되고 댓글리스트로 안넘아간 이유는 삭제를 하고 view에서 get방식만 허용되게 해놔서
	// 삭제하면 post방식으로 넘어가기때문에 에러남
	@ResponseBody
	@RequestMapping(value = "/commentDelete")
	public void commentDelete(int reply_num) throws Exception {
		CommentVO vo = new CommentVO();
		vo.setReply_num(reply_num);
		
		
		
		service.commentDelete(vo);
	}
	// =========================매니저보드테스트==================================================================================
//	매니저 게시판	
//=====================================================================================================================		
// 매니져 게시글
	@RequestMapping(value = "/managerBoard_listPage", method = { RequestMethod.GET, RequestMethod.POST })
	public void managerBoard_listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("managerBoard_list", service.listSearchCriteria2(cri)); // JSP에 계산된 페이징 출력
		PageMaker pageMaker = new PageMaker(); // 객체생성
		pageMaker.setCri(cri); // setCri 메소드 사용
		pageMaker.setTotalCount(service.listSearchCount2(cri)); // 전체 게시글 갯수 카운트
		model.addAttribute("pageMaker", pageMaker);
	}



//===============================================================================================================	
//===============================================================================================================

// 매니져게시글 검색기능
	@RequestMapping(value = "/managerBoard_list", method = RequestMethod.GET)
	public void managerBoard_list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("managerBoard_list", service.listSearchCriteria2(cri)); // 전체목록에 검색페이징 기능+
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount2(cri)); // 전체목록에 검색페이징 카운트+
		System.out.println(cri);
		model.addAttribute("pageMaker", pageMaker);
	}

	// 매니저보드작성
	@RequestMapping(value = "/managerBoard_write", method = RequestMethod.GET)
	public void getManagerBoard_write() throws Exception {
	}

	// 매니저보드작성
	@RequestMapping(value = "/managerBoard_write", method = RequestMethod.POST)
	public String postManagerBoard_write(BoardVO vo) throws Exception {
		service.managerBoard_write(vo);
		return "redirect:/board/managerBoard_list";
	}
	//===============================================================================================================
		//매니져보드 수정창
		@RequestMapping(value = "/managerBoard_update", method = RequestMethod.GET)
		public void getManager_update(@RequestParam("board_num") int board_num, Model model) throws Exception {
			BoardVO view = null;
			view = service.managerBoard_view(board_num);
			model.addAttribute("view", view);
		}
		// 매니져보드 수정
		@RequestMapping(value = "/managerBoard_update", method = RequestMethod.POST)
		public String postManger_update(BoardVO vo) throws Exception {
			service.managerBoard_update(vo);
			return "redirect:/board/managerBoard_listPage";
		}
		//===============================================================================================================		
		// 매니저 게시물 삭제
		@RequestMapping(value = "/managerBoard_delete", method = RequestMethod.GET)
		public void getManager_delete(@RequestParam("board_num") int board_num, Model model) throws Exception {
			BoardVO view = null;
			view = service.managerBoard_view(board_num);
			model.addAttribute("view", view);
		}

		// 매니저 게시물 삭제
		@RequestMapping(value = "/managerBoard_delete", method = RequestMethod.POST)
		public String postManager_delete(BoardVO vo) throws Exception {
			service.managerBoard_delete(vo.getBoard_num());
			service.managerBoard_deleteAfter(vo.getBoard_num());
			return "redirect:/board/managerBoard_listPage";
		}

	// ========================================================================================================
	// 매니저보드조회
	@RequestMapping(value = "/managerBoard_view", method = { RequestMethod.GET, RequestMethod.POST }) //
	public void getManagerBoard_view(@RequestParam("board_num") int board_num, Model model) throws Exception {
		BoardVO view = null;
		view = service.managerBoard_view(board_num);
		model.addAttribute("view", view);

	}

	// ==================매니져보드카테고리================================================================================================
	@RequestMapping(value = "/managerBoard_category", method = { RequestMethod.GET, RequestMethod.POST })
	public String managerBoard_category(@ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest request) throws Exception {
		String board_category = request.getParameter("board_category");
		cri.setBoard_category(board_category);

		List<BoardVO> list = null;
		list = service.managerBoard_category(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.managerBoard_categoryCount(cri)); // 전체목록에 검색페이징 카운트+

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);

		return "board/managerBoard_category";
	}
//=========================================================================================================

}