package ljn.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ljn.service.BoardService;
import ljn.service.BoardVO;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/boardForm.do", method = RequestMethod.GET)
	public String boardForm() {
		return "board/insertBoard";
	}

	@RequestMapping(value = "/boardInsert.do", method = RequestMethod.GET)
	public String boardInsert(BoardVO vo, HttpSession session, HttpServletRequest request) throws Exception {

		String userId = "";

		session = request.getSession();

		userId = (String) session.getAttribute("SessionUserId");

		vo.setUserId(userId);
		boardService.boardInsert(vo);

		return "board/insertBoard";
	}

	@RequestMapping(value = "/boardList.do")
	public String selectBoardList(BoardVO vo, Model model) throws Exception {

		int total = boardService.boardListTotal(vo);
		int totalPage = (int) Math.ceil((double) total / 5);
		int pageList = vo.getPageList();
		int viewPage = vo.getViewPage();

		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 5;
		int endIndex = 5;

		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		vo.setPageList(pageList);
		vo.setFirstPage(firstPage);
		vo.setLastPage(lastPage);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("boardList", boardService.selectBoardList(vo));

		return "board/boardList";
	}
	
	@RequestMapping(value = "/myBoardList.do")
	public String myBoardList(BoardVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {

		String userId = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");
		vo.setUserId(userId);
		
		int total = boardService.myBoardTotal(userId);
		int totalPage = (int) Math.ceil((double) total / 5);
		int pageList = vo.getPageList();
		int viewPage = vo.getViewPage();

		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 5;
		int endIndex = 5;

		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		vo.setPageList(pageList);
		vo.setFirstPage(firstPage);
		vo.setLastPage(lastPage);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("myBoardList", boardService.myBoardList(vo));

		return "board/myBoardList";
	}

	@RequestMapping(value = "/selectBoard.do", method = RequestMethod.GET)
	public String selectBoard(BoardVO vo, Model model) throws Exception {

		vo = boardService.selectBoard(vo);
		model.addAttribute("board", vo);

		return "board/selectForm";
	}
	
	@RequestMapping(value = "/selectMyBoard.do", method = RequestMethod.GET)
	public String selectMyBoard(BoardVO vo, Model model) throws Exception {

		vo = boardService.selectBoard(vo);
		model.addAttribute("board", vo);

		return "board/selectMyForm";
	}

	@ResponseBody
	@RequestMapping(value = "/boardUpdate.do")
	public String boardUpdate(BoardVO vo, HttpSession session, HttpServletRequest request) throws Exception {

		String userId = "";
		String data = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");
		
		vo.getBoardType();
		vo.getTitle();
		vo.getContent();
		
		System.out.println("세션아이디="+userId);
		System.out.println("게시글아이디="+vo.getUserId());
		
		if (userId.equals(vo.getUserId())) {		
			boardService.boardUpdate(vo);
			data = "ok";
		} else {
			data = "fail";
		}
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardDelete.do")
	public String boardDelete(BoardVO vo, HttpSession session, HttpServletRequest request) throws Exception {

		String userId = "";
		String data = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");
		
		System.out.println("세션아이디="+userId);
		System.out.println("게시글아이디="+vo.getUserId());
		
		if (userId.equals(vo.getUserId()) || userId.equals("ADMIN")) {		
			boardService.boardDelete(vo);
			data = "ok";
		} else {
			data = "fail";
		}
		
		return data;
	}

}
