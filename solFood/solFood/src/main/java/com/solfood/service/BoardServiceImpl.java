package com.solfood.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.solfood.dao.BoardDAO;
import com.solfood.dto.BoardVO;
import com.solfood.dto.CommentVO;
import com.solfood.dto.Criteria;
import com.solfood.dto.SearchCriteria;

	@Service
	public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	//게시판 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}
	
	//게시물 수정
	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}
	
	//게시물 삭제
	@Override
	public void delete(int board_num) throws Exception {
		dao.delete(board_num);
	}

	//게시물 삭제후
	@Override public void deleteAfter(int board_num) throws Exception{
	dao.deleteAfter(board_num); 
	}
	
	//게시물 조회
	@Override
	public BoardVO view(int board_num) throws Exception {
		dao.updateBoard_readcount(board_num); //조회수 업데이트
		return dao.view(board_num);		
	}
	
	//게시물리스트
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
	
	//페이징테스트
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	//게시글/검색기능
	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	//게시글 갯수 /검색기능
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	
		
//====게시물카테고리 테스트=======================================================	

	@Override
	public List<BoardVO> selectByCategory(SearchCriteria cri) throws Exception{
		return dao.selectByCategory(cri);
	}
	@Override
	public int categoryCount(SearchCriteria cri) throws Exception{
		return dao.categoryCount(cri);
	}
	
//=======댓글 테스트=============================================================	
	//댓글 갯수
	public int commentCount() throws Exception{
		return dao.commentCount();
	}
	//댓글 리스트
	public List<CommentVO> commentList(int board_num) throws Exception{
        
        return dao.commentList(board_num);
    }
    //댓글 작성
    public int commentInsert(CommentVO comment) throws Exception{
        
        return dao.commentInsert(comment);
    }
    //댓글 수정
    public void commentUpdate(CommentVO comment) throws Exception{
        dao.commentUpdate(comment);
    }
    
    //댓글 삭제
    public void commentDelete(CommentVO comment) throws Exception{
        
         dao.commentDelete(comment);
    }
    
    //댓글 수정창
    public int commentUpdateForm(int reply_num) throws Exception{
    	
    	return dao.commentUpdateForm(reply_num);
    }

//==========매니져보드테스트=========================================================

    //매니저 게시글 /검색기능
    @Override
    public List<BoardVO> listSearchCriteria2(SearchCriteria cri) throws Exception {
    	return dao.listSearch2(cri);
    }
    //매니저 게시글 갯수 /검색기능
    @Override
    public int listSearchCount2(SearchCriteria cri) throws Exception {
    	return dao.listSearchCount2(cri);
    }
    
	//매니저보드작성
	@Override
	public void managerBoard_write(BoardVO vo) throws Exception {
		dao.managerBoard_write(vo);
	}
	
	//매니저보드조회
	@Override
	public BoardVO managerBoard_view(int board_num) throws Exception {
		dao.updateBoard_readcount(board_num); //조회수 업데이트
		return dao.managerBoard_view(board_num);		
	}
	//매니저보드 수정
	@Override
	public void managerBoard_update(BoardVO vo) throws Exception {
		dao.managerBoard_update(vo);
	}
	//매니저보드 삭제
	@Override
	public void managerBoard_delete(int board_num) throws Exception {
		dao.delete(board_num);
	}

	//매니저보드 삭제후
	@Override public void managerBoard_deleteAfter(int board_num) throws Exception{
	dao.deleteAfter(board_num); 
	}
//====================================================================================================	
	//매니져보드 카테고리	
	@Override
	public List<BoardVO> managerBoard_category(SearchCriteria cri) throws Exception{
		return dao.managerBoard_category(cri);
	}
	//매니져보드 카테고리카운트
	@Override
	public int managerBoard_categoryCount(SearchCriteria cri) throws Exception{
		return dao.managerBoard_categoryCount(cri);
	}

}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	