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
	
	//���� ������ ��ȣ ��������
	public int getSeqBoardLastNumber();
	
	//�Խù� �ۼ��ϱ�
	public int insertBoard(BoardVO param);
	
	//�Խù� ������Ʈ
	public int updateBoard(BoardVO param);
	
	//�Խù� ����
	public int deleteBoard(@Param("idx")int idx);
	
	//������ �� �Խñ��� ������ �ִ��� Ȯ��
	public BoardVO searchEqualsUserAndBoard(@Param("idx") int idx, @Param("creation_userid")  String userID);
	
	public List<Integer> searchIDXs(@Param("creation_userid")  String userID);
	
	// �Խù� ���� ���ϱ�
	public int getTotalCount();

	// �Խù� ��ȸ
	public List<Map<String, String>> read(@Param("bno") int bno);
}
