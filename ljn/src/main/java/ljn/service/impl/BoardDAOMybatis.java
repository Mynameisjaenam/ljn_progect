package ljn.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ljn.service.BoardDAO;
import ljn.service.BoardVO;

@Repository("boarddaoMybatis")
public class BoardDAOMybatis extends EgovAbstractMapper implements BoardDAO {

	public BoardDAOMybatis() {
		System.out.println("===> BoardDAOMybatis 생성");
	}

	@Override
	public void boardInsert(BoardVO vo) throws Exception {
		System.out.println("===> MyBatis로 boardInsert() 기능 처리");
		insert("boardInsert", vo);
	}

	@Override
	public List<BoardVO> selectBoardList(BoardVO vo) throws Exception {
		System.out.println("===> MyBatis로 selectBoardList() 기능 처리");
		return selectList("selectBoardList", vo);
	}

	@Override
	public int boardListTotal(BoardVO vo) throws Exception {	
		return selectOne("boardListTotal", vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		System.out.println("===> MyBatis로 selectBoard() 기능 처리");
		return selectOne("selectBoard", vo);
	}

	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		System.out.println("===> MyBatis로 boardUpdate() 기능 처리");
		update("boardUpdate", vo);
	}

	@Override
	public void boardDelete(BoardVO vo) throws Exception {
		System.out.println("===> MyBatis로 boardDelete() 기능 처리");
		delete("boardDelete", vo);		
	}

	@Override
	public List<BoardVO> myBoardList(BoardVO vo) throws Exception {
		System.out.println("===> MyBatis로 myBoard() 기능 처리");
		return selectList("myBoardList", vo);
	}

	@Override
	public int myBoardTotal(String userId) throws Exception {
		int count = selectOne("myBoardTotal", userId);
		return count;
	}
	
	
	
}
