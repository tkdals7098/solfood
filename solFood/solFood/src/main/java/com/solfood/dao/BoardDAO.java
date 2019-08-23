package com.solfood.dao;

import java.util.List;

import com.solfood.dto.BoardVO;
import com.solfood.dto.CommentVO;
import com.solfood.dto.Criteria;

import com.solfood.dto.SearchCriteria;

public interface BoardDAO {
	
	// 게시물 작성
	public void write(BoardVO vo) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int board_num) throws Exception;
	
	// 게시물 조회
	public BoardVO view(int board_num) throws Exception;
	
	// 게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 조회수 업데이트
	public void updateBoard_readcount(int board_num) throws Exception;
	
	//게시물 삭제후 
	public void deleteAfter(int board_num) throws Exception;
	
	//페이징 시작
	public List<BoardVO> listPage(int page) throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
	//페이징 끝
	
	//게시글 /검색
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
//=================댓글==========================================================	
	// 댓글 개수
    public int commentCount() throws Exception;
 
    // 댓글 목록
    public List<CommentVO> commentList(int board_num) throws Exception;
 
    // 댓글 작성
    public int commentInsert(CommentVO comment) throws Exception;
    
    // 댓글 수정
    public void commentUpdate(CommentVO comment) throws Exception;
 
    // 댓글 삭제
    public void commentDelete(CommentVO comment) throws Exception;

    //댓글 수정창
    public int commentUpdateForm(int reply_num) throws Exception;
	
    
 //------매니저보드테스트---------------------------------------------------
    //매니저게시글/검색기능
    public List<BoardVO> listSearch2(SearchCriteria cri)throws Exception;
    public int listSearchCount2(SearchCriteria cri)throws Exception;
    //검색기능추가 테스트	
    
    //매니저게시글갯수/검색기능
    public List<BoardVO> selectByCategory(SearchCriteria cri) throws Exception; //테스트
    //게시판 카테고리 갯수 테스트
    public int categoryCount(SearchCriteria cri) throws Exception;
    
    //매니저보드 작성
    public void managerBoard_write(BoardVO vo) throws Exception;
    // 매니저보드 조회
 	public BoardVO managerBoard_view(int board_num) throws Exception;
 	
 	//매니저보드 수정
	public void managerBoard_update(BoardVO vo) throws Exception;
	// 매니저보드 삭제
	public void managerBoard_delete(int board_num) throws Exception;
	//매니저보드 삭제후 
	public void managerBoard_deleteAfter(int board_num) throws Exception;
 	
//------메니저보드카테고리------------------------------------------------------------------------------
 	
 	//매니져 게시판 카테고리
 	public List<BoardVO> managerBoard_category(SearchCriteria cri) throws Exception; //테스트
	//매니져 게시판 카테고리 갯수 테스트
	public int managerBoard_categoryCount(SearchCriteria cri) throws Exception;
}













