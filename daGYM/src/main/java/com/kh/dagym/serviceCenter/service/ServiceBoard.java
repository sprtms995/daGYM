package com.kh.dagym.serviceCenter.service;

import java.util.List;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

public interface ServiceBoard {


	PageInfo pagination(int type, int cp);

	
	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return boardList
	 */
	List<Board> selectList(PageInfo pInfo);

	
}
