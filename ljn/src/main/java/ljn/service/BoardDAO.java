package ljn.service;

import java.util.List;

public interface BoardDAO {

	void boardInsert(BoardVO vo) throws Exception;
	
	List<BoardVO> selectBoardList(BoardVO vo) throws Exception;
	
	List<BoardVO> myBoardList(BoardVO vo) throws Exception;
	
	BoardVO selectBoard(BoardVO vo) throws Exception;
	
	int boardListTotal(BoardVO vo) throws Exception;
	
	int myBoardTotal(String userId) throws Exception;
	
	void boardUpdate(BoardVO vo) throws Exception;
	
	void boardDelete(BoardVO vo) throws Exception;
	
}
