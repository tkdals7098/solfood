package com.solfood.service;

import java.util.List;

import com.solfood.dto.BoardVO;
import com.solfood.dto.CommentVO;
import com.solfood.dto.Criteria;
import com.solfood.dto.SearchCriteria;


public interface BoardService {
	
	//게시물 작성
	public void write(BoardVO vo) throws Exception;
	
	//게시물 수정
	public void update(BoardVO vo) throws Exception;

	//게시물 삭제
	public void delete(int board_num) throws Exception;
	
	//게시물 조회
	public BoardVO view(int board_num) throws Exception;

	//게시물 목록
	public List<BoardVO> list() throws Exception;

	//페이징 테스트
	public List<BoardVO> listCriteria(Criteria cri) throws Exception; // 페이징 계산용
	public int listCountCriteria(Criteria cri) throws Exception; // DB의 데이터 카운팅을 위한 메소드

	// 게시물 삭제후 
	public void deleteAfter(int board_num) throws Exception;

	//게시글 / 검색기능 
	public List<BoardVO> listSearchCriteria(SearchCriteria cri)  throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;

	//게시판카테고리
	public List<BoardVO> selectByCategory(SearchCriteria cri) throws Exception; //test
	//게시판 카테고리 갯수
	public int categoryCount(SearchCriteria cri)throws Exception;
	
//=========댓글테스트=======================================================
	//댓글 갯수
	public int commentCount() throws Exception;
	//댓글 리스트
	public List<CommentVO> commentList(int board_num) throws Exception;
	//댓글 작성
	public int commentInsert(CommentVO comment) throws Exception;
	//댓글 수정
	public void commentUpdate(CommentVO comment) throws Exception;
	//댓글 삭제
	public void commentDelete(CommentVO comment) throws Exception;
	//댓글 수정창
	public int commentUpdateForm(int reply_num) throws Exception;
	
//==========매니져보드테스트================================================================

	//매니저게시글 /검새기능
	public List<BoardVO> listSearchCriteria2(SearchCriteria cri)  throws Exception;
	public int listSearchCount2(SearchCriteria cri) throws Exception;
	
	//매니저보드작성
	public void managerBoard_write(BoardVO vo) throws Exception;
	//매니저보드조회
	public BoardVO managerBoard_view(int board_num) throws Exception;
	//매니저 보드 수정
	public void managerBoard_update(BoardVO vo) throws Exception;
	
	//매니저 게시물 삭제
	public void managerBoard_delete(int board_num) throws Exception;
	//매니저 게시물 삭제후 
	public void managerBoard_deleteAfter(int board_num) throws Exception;
//===========================================================================================================		
	//매니저게시판카테고리
	public List<BoardVO> managerBoard_category(SearchCriteria cri) throws Exception; //test
	//매니저 게시판 카테고리 갯수
	public int managerBoard_categoryCount(SearchCriteria cri)throws Exception;
}
















