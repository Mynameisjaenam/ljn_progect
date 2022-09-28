package ljn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ljn.service.BoardDAO;
import ljn.service.BoardService;
import ljn.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "boarddaoMybatis")
	private BoardDAO boardDAO;

	@Override
	public void boardInsert(BoardVO vo) throws Exception {
		boardDAO.boardInsert(vo);		
	}

	@Override
	public List<BoardVO> selectBoardList(BoardVO vo) throws Exception {
		return boardDAO.selectBoardList(vo);
	}

	@Override
	public int boardListTotal(BoardVO vo) throws Exception {
		return boardDAO.boardListTotal(vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		return boardDAO.selectBoard(vo);
	}

	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		boardDAO.boardUpdate(vo);		
	}

	@Override
	public void boardDelete(BoardVO vo) throws Exception {
		boardDAO.boardDelete(vo);		
	}

	@Override
	public List<BoardVO> myBoardList(BoardVO vo) throws Exception {
		return boardDAO.myBoardList(vo);
	}

	@Override
	public int myBoardTotal(String userId) throws Exception {
		return boardDAO.myBoardTotal(userId);
	}
	
}
