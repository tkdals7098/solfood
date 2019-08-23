package com.solfood.service;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import com.solfood.dao.MemberDAO;
import com.solfood.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
    @Inject
    private MemberDAO dao;
    
    //-------------------------------------------------------------------------
    //	로그인
    //-------------------------------------------------------------------------
    // 로그인 
    @Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	// 회원 로그인 정보
	@Override
	public MemberVO viewMember(MemberVO vo) {
	    return dao.viewMember(vo);
	}
	
	// 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
	    // 세션 변수 개별 삭제
	    // session.removeAttribute("userId");
	    // 세션 정보를 초기화 시킴
	    session.invalidate();
	}
    
	//-------------------------------------------------------------------------
    //	회원가입
    //-------------------------------------------------------------------------
	/* 회원조회 */
    @Override
    public List<MemberVO> selectMember() throws Exception {
        return dao.selectMember();
    }

	/* 회원가입 */
	@Override
	public void joinMember(MemberVO vo) throws Exception {
		dao.joinMember(vo);
	}
	
	// 아이디 체크
	@Override
	public int check_id(String account_user) throws Exception {
		return dao.check_id(account_user);
	}

	// 이메일 체크
	@Override
	public int check_email(String account_email) throws Exception {
		return dao.check_email(account_email);
	}

	@Override
	public void updateMyAccount(MemberVO memberVo) throws Exception {
		dao.updateMyAccount(memberVo);		
	}
	@Override
	public void deleteMyAccount(MemberVO memberVo) throws Exception {
		dao.deleteMyAccount(memberVo);
	}
}




