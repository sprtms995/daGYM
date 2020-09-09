package com.kh.dagym.member.model.service;

import java.util.List;

import com.kh.dagym.common.PageInfo;
import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.member.model.vo.MyBoard;
import com.kh.dagym.member.model.vo.MyReply;

public interface MemberService {

	/** 회원가입 Service
	 * @param signUpMember
	 * @return result
	 */
	int signUp(Member signUpMember);

	/** 로그인 Service
	 * @param member
	 * @return loginMember
	 */
	Member login(Member member);

	
	/** 아이디 중복체크 Service
	 * @param memberId
	 * @return result
	 */
	int idDupCheck(String memberId);

	/** 회원 비밀번호 확인용 Service
	 * @param loginMember
	 * @return result
	 */
	int checkPwd(String memberPwd, int memberNo);
	
	
	/** 회원 정보 수정용 Service
	 * @param upMember
	 * @return result
	 */
	int updateMember(Member upMember);

	/** 회원 탈퇴용 Service
	 * @param memberPwd
	 * @param memberNo
	 * @return result
	 */
	int removeMember(String memberPwd, int memberNo);

	/** 내 댓글 Service
	 * @param pInfo 
	 * @param memberNo
	 * @return myReplyList
	 */
	List<MyReply> MyReplyList(int rerlyMemberNo, PageInfo pInfo);

	/** 내 댓글 페이징 처리 Service
	 * @param type
	 * @param cp
	 * @param rerlyMemberNo
	 * @return pInfo
	 */
	PageInfo replyPagination(int type, int cp, int rerlyMemberNo);

	/** 내 게시판 페이징 처리 Service
	 * @param type
	 * @param cp
	 * @param rerlyMemberNo
	 * @return pInfo
	 */
	PageInfo boardPagination(int type, int cp, int rerlyMemberNo);

	/** 내 게시글 Service
	 * @param rerlyMemberNo
	 * @param pInfo
	 * @return myBoardList
	 */
	List<MyBoard> myBoardList(int rerlyMemberNo, PageInfo pInfo);
}
