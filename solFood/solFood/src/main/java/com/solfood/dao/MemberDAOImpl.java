package com.solfood.dao;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.MemberVO;
 
@Repository
public class MemberDAOImpl implements MemberDAO {
 
    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.solfood.mapper.memberMapper";
	
	//------------------------------------------------------------------------------------------
	// login
	//------------------------------------------------------------------------------------------
	/* 로그인 */
	@Override
	public MemberVO login(MemberVO vo) {
		return sqlSession.selectOne(Namespace+".login", vo);
	}	
    /*회원 로그인 정보*/
    @Override
    public MemberVO viewMember(MemberVO vo) {
        return sqlSession.selectOne(Namespace+".viewMember", vo);
    }
    /*회원 로그아웃*/
    @Override
    public void logout(HttpSession session) {
    }
    
    
	//------------------------------------------------------------------------------------------
	// 회원
	//------------------------------------------------------------------------------------------
    /* 회원조회 */
    @Override
    public List<MemberVO> selectMember() throws Exception {
    	return sqlSession.selectList(Namespace+".selectMember");
    }
    /* 회원가입 */
    @Override
    public void joinMember(MemberVO vo) throws Exception {
    	sqlSession.insert(Namespace + ".joinMember", vo);
    }
    // 아이디 중복 체크
 	@Override
 	public int check_id(String account_user) throws Exception {
 		return sqlSession.selectOne(Namespace+".check_id", account_user);
 	}
 	// 이메일 중복 체크 
 	@Override
 	public int check_email(String account_email) throws Exception {
 		return sqlSession.selectOne(Namespace+".check_email", account_email);
 	}
    /* 회원정보 수정 */
	@Override
	public void updateMyAccount(MemberVO memberVo) throws Exception {
		sqlSession.update(Namespace+".updateMemberSub", memberVo);
	}
	/* 회원정보 삭제 */
	@Override
	public void deleteMyAccount(MemberVO memberVo) throws Exception {
		sqlSession.delete(Namespace+".deleteMember", memberVo);
	}
    
}
