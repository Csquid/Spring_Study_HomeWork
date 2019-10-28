package com.monkey.coffee.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.monkey.coffee.vo.BoardVO;

@Mapper
public interface BoardMapper {
	// 리스트 불러오기
	//public List<BoardVO> getlistWithPagin(Criteria cri);
	public List<BoardVO> getBoardList();

	//단일 게시판 불러오기
	public BoardVO getBoard(int board_idx);
	
	//보도 마지막 번호 가져오기
	public int getSeqBoardLastNumber();
	
	//게시물 작성하기
	public int insertBoard(BoardVO param);
	
	public int updateBoardHistory(@Param("board_idx")int board_idx);
	//게시물 업데이트
	public int updateBoard(BoardVO param);
	
	//게시물 삭제
	public int deleteBoard(@Param("board_idx")int board_idx);
	
	//유저가 이 게시글을 가지고 있는지 확인
	public BoardVO searchEqualsUserAndBoard(@Param("board_idx") int board_idx, @Param("writer")  String writer);
	
	public List<Integer> searchIDXs(@Param("writer")  String userID);
	
	// 게시물 갯수 구하기
	public int getTotalCount();

	// 게시물 조회
	public List<Map<String, String>> read(@Param("bno") int bno);
}
