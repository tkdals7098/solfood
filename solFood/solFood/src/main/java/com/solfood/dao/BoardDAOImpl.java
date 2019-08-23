package com.solfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.solfood.dto.BoardVO;
import com.solfood.dto.CommentVO;
import com.solfood.dto.Criteria;
import com.solfood.dto.SearchCriteria;

	@Repository
	public class BoardDAOImpl implements BoardDAO {

		
	@Inject
	private SqlSession sql;
	private static String namespace = "com.solfood.mappers.boardMapper";

	
	// 게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}

	
	// 게시물수정
	@Override
	public void update(BoardVO vo) throws Exception {
		sql.update(namespace + ".update", vo);
	}

	
	// 게시물삭제
	@Override
	public void delete(int board_num) throws Exception {
		sql.delete(namespace + ".delete", board_num);
	}

	
	// 게시물조회
	@Override
	public BoardVO view(int board_num) throws Exception {
		return sql.selectOne(namespace + ".view", board_num);
	}
	
	
	// 조회수 업데이트
	@Override
	public void updateBoard_readcount(int board_num) throws Exception {
		sql.update(namespace + ".updateBoard_readcount", board_num);
	}

	
	// 게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	
	//게시물 삭제후
	 @Override public void deleteAfter(int board_num)throws Exception{
	 sql.delete(namespace +".deleteAfter",board_num); 
	 }
	 

//=============페이징 시작==============================================================================
	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return sql.selectList(namespace + ".listPage", page);
	}

	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".listCriteria", cri);
	}

	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".countPaging", cri);
	}
//===========페이징끝===========================================================
	
//=============검색기능시작======================================================
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace + ".listSearch", cri);
	}
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace + ".listSearchCount", cri);
	}
//=============검색기능끝========================================================



	

//==============================================================================
	
	//게시물카테고리
	@Override
	public List<BoardVO> selectByCategory(SearchCriteria cri) throws Exception { //테스트
		return sql.selectList(namespace + ".selectByCategory", cri);
	}	
	//게시물카테고리갯수
	@Override
	public int categoryCount(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace + ".categoryCount", cri);
	} 
	
	
//==============댓글테스트=====================================================================
	// 댓글 개수
	@Override
    public int commentCount() throws Exception{
		return sql.selectOne(namespace + ".commentCount");
	}
 
    // 댓글 목록
	@Override
    public List<CommentVO> commentList(int board_num) throws Exception{
		return sql.selectList(namespace + ".commentList", board_num);
	}
 
    // 댓글 작성
	@Override
    public int commentInsert(CommentVO comment) throws Exception{
		return sql.insert(namespace + ".commentInsert", comment);
	}
    
    // 댓글 수정
	@Override
    public void commentUpdate(CommentVO comment) throws Exception{
		sql.update(namespace + ".commentUpdate", comment);
	}
 
    // 댓글 삭제
	@Override
    public void commentDelete(CommentVO comment) throws Exception{
		 sql.delete(namespace + ".commentDelete",comment );
	}
	
	//댓글 수정창
	@Override
	public int commentUpdateForm(int reply_num) throws Exception{
		return sql.selectOne(namespace + ".commentUpdateForm", reply_num);
	}
	
	//======매니저보드 테스트=============================================================================
	
	//매니저게시글 /검색
	@Override
	public List<BoardVO> listSearch2(SearchCriteria cri) throws Exception {
		return sql.selectList(namespace + ".listSearch2", cri);
	}
	//매니저게시글갯수 /검색
	@Override
	public int listSearchCount2(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace + ".listSearchCount2", cri);
	}
	
	// 매니저보드 작성
	@Override
	public void managerBoard_write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".managerBoard_write", vo);
	}
	//매니저보드 수정
	@Override
	public void managerBoard_update(BoardVO vo) throws Exception {
		sql.update(namespace + ".managerBoard_update", vo);
	} 
	// 매니저보드 조회
	@Override
	public BoardVO managerBoard_view(int board_num) throws Exception {
		return sql.selectOne(namespace + ".managerBoard_view", board_num);
	}
	// 매니저보드 삭제
	@Override
	public void managerBoard_delete(int board_num) throws Exception {
		sql.delete(namespace + ".managerBoard_delete", board_num);
	}	
	//매니저보드 삭제후
	 @Override 
	 public void managerBoard_deleteAfter(int board_num)throws Exception{
	 sql.delete(namespace +".managerBoard_deleteAfter",board_num); 
	 }
	//매니져보드 카테고리
	@Override
	public List<BoardVO> managerBoard_category(SearchCriteria cri) throws Exception { //테스트
		return sql.selectList(namespace + ".managerBoard_category", cri);
	}	
	//매니져보드카테고리갯수
	@Override
	public int managerBoard_categoryCount(SearchCriteria cri) throws Exception {
		return sql.selectOne(namespace + ".managerBoard_categoryCount", cri);
	}


}
	
	
	
	
	
	
	
	
	
	
	
	
	
