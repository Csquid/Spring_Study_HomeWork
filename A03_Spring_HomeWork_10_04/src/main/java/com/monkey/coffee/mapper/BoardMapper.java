package com.monkey.coffee.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.monkey.coffee.vo.BoardVO;

@Mapper
public interface BoardMapper {
	// ����Ʈ �ҷ�����
	//public List<BoardVO> getlistWithPagin(Criteria cri);
	public List<BoardVO> getBoardList();

	//���� �Խ��� �ҷ�����
	public BoardVO getBoard(int board_idx);
	
	//���� ������ ��ȣ ��������
	public int getSeqBoardLastNumber();
	
	//�Խù� �ۼ��ϱ�
	public int insertBoard(BoardVO param);
	
	public int updateBoardHistory(@Param("board_idx")int board_idx);
	//�Խù� ������Ʈ
	public int updateBoard(BoardVO param);
	
	//�Խù� ����
	public int deleteBoard(@Param("board_idx")int board_idx);
	
	//������ �� �Խñ��� ������ �ִ��� Ȯ��
	public BoardVO searchEqualsUserAndBoard(@Param("board_idx") int board_idx, @Param("writer")  String writer);
	
	public List<Integer> searchIDXs(@Param("writer")  String userID);
	
	// �Խù� ���� ���ϱ�
	public int getTotalCount();

	// �Խù� ��ȸ
	public List<Map<String, String>> read(@Param("bno") int bno);
}
