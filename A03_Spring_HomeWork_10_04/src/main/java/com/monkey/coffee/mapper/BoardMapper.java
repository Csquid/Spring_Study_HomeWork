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
	public BoardVO getBoard(int idx);
	
	public int getSeqBoardLastNumber();
	// �Խù� �ۼ��ϱ�
	public int insertBoard(BoardVO param);
	
	// �Խù� ���� ���ϱ�
	public int getTotalCount();

	// �Խù� ��ȸ
	public List<Map<String, String>> read(@Param("bno") int bno);
}
