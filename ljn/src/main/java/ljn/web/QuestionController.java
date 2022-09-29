package ljn.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ljn.service.QuestionService;
import ljn.service.QuestionVO;

@Controller
public class QuestionController {

	@Resource(name = "questionService")
	private QuestionService questionService;

	@RequestMapping(value = "/questionForm.do", method = RequestMethod.GET)
	public String questionForm() {
		return "question/questionForm";
	}

	@RequestMapping(value = "/questionInsert.do", method = RequestMethod.GET)
	public String questionInsert(QuestionVO vo, HttpSession session, HttpServletRequest request) throws Exception {

		String userId = "";

		session = request.getSession();

		userId = (String) session.getAttribute("SessionUserId");

		vo.setUserId(userId);
		questionService.quetionInsert(vo);

		return "question/questionForm";
	}

	@RequestMapping(value = "/selectQuestionList.do")
	public String myQuestionList(QuestionVO vo, Model model, HttpSession session, HttpServletRequest request)
			throws Exception {

		String userId = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");
		vo.setUserId(userId);

		int total = questionService.quetionListTotal(userId);
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
		model.addAttribute("myQuestionList", questionService.selectQuestionList(vo));

		return "question/myQuestionList";
	}

	@RequestMapping(value = "/selectQuestion.do", method = RequestMethod.GET)
	public String selectQuestion(QuestionVO vo, Model model) throws Exception {

		vo = questionService.selectQuestion(vo);
		model.addAttribute("selectQuestion", vo);

		return "question/selectQuestionForm";
	}

	// ===================================================================================================

	@RequestMapping(value = "/selectAnswerForm.do", method = RequestMethod.GET)
	public String selectAnswerForm(QuestionVO vo, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "questionNo") int questionNo) throws Exception {

		session.setAttribute("SessionanswerNo", questionNo);

		System.out.println("answer:" + questionNo);

		vo = questionService.selectAnswer(vo);
		model.addAttribute("selectAnswer", vo);

		return "question/answerForm";
	}

	// ===================================================================================================

	@RequestMapping(value = "/questionDelete.do", method = RequestMethod.GET)
	public String questionDelete() throws Exception {
		return "question/questionDelete";
	}

	@RequestMapping(value = "/adminquestionDelete.do", method = RequestMethod.GET)
	public String adminquestionDelete() throws Exception {
		return "admin/adminquestionDelete";
	}

	@ResponseBody
	@RequestMapping(value = "/questionDelete.do", method = RequestMethod.POST)
	public String questionDelete(HttpSession session, HttpServletRequest request) throws Exception {

		String data = "";

		int questionNo = (int) session.getAttribute("SessionquestionNo");

		if (questionNo != 0) {
			System.out.println("questionNo=>" + questionNo);
			questionService.questionDelete(questionNo);
			session.removeAttribute("SessionquestionNo");
			data = "ok";
		}

		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/adminquestionDelete.do", method = RequestMethod.POST)
	public String adminquestionDelete(HttpSession session, HttpServletRequest request) throws Exception {

		String data = "";

		int questionNo = (int) session.getAttribute("SessionquestionNo");

		if (questionNo != 0) {
			System.out.println("questionNo=>" + questionNo);
			questionService.questionDelete(questionNo);
			session.removeAttribute("SessionquestionNo");
			data = "ok";
		}

		return data;
	}

	@RequestMapping(value = "/questionDeleteConfirm.do", method = RequestMethod.GET)
	public String questionDeleteConfirm() throws Exception {
		return "question/myQuestionList";
	}

	@RequestMapping(value = "/adminquestionDeleteConfirm.do", method = RequestMethod.GET)
	public String adminquestionDeleteConfirm() throws Exception {
		return "admin/adminQuestionList";
	}

	@ResponseBody
	@RequestMapping(value = "/questionDeleteConfirm.do", method = RequestMethod.POST)
	public String questionDeleteConfirm(@RequestParam(name = "questionNo") int questionNo, Model model,
			HttpSession session, HttpServletRequest request) throws Exception {

		String data = "";

		if (questionNo != 0) {
			session.setAttribute("SessionquestionNo", questionNo);
			data = "ok";
		}

		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/adminquestionDeleteConfirm.do", method = RequestMethod.POST)
	public String adminquestionDeleteConfirm(@RequestParam(name = "questionNo") int questionNo, Model model,
			HttpSession session, HttpServletRequest request) throws Exception {

		String data = "";

		if (questionNo != 0) {
			session.setAttribute("SessionquestionNo", questionNo);
			data = "ok";
		}

		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/questionUpdate.do")
	public String questionUpdate(QuestionVO vo, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "questionNo") int questionNo) throws Exception {

		String userId = "";
		String data = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");

		vo.getTitle();
		vo.getContent();

		System.out.println("세션아이디=" + userId);
		System.out.println("게시글아이디=" + vo.getUserId());

		if (userId.equals(vo.getUserId())) {
			questionService.updateQuestion(vo);
			data = "ok";
		} else {
			data = "fail";
		}

		System.out.println(data);

		return data;
	}

	@RequestMapping(value = "/adminQuestionList.do")
	public String adminQuestionList(QuestionVO vo, Model model, HttpSession session, HttpServletRequest request)
			throws Exception {

		String userId = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");
		vo.setUserId(userId);

		int total = questionService.adminquestionListTotal(vo);
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
		model.addAttribute("adminQuestionList", questionService.selectadminQuestionList(vo));

		return "admin/adminQuestionList";
	}

	@RequestMapping(value = "/adminselectQuestion.do", method = RequestMethod.GET)
	public String adminselectQuestion(QuestionVO vo, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "questionNo") int questionNo) throws Exception {

		session.setAttribute("SessionquestionNo", questionNo);

		System.out.println("1:" + questionNo);

		vo = questionService.selectQuestion(vo);
		model.addAttribute("selectQuestion", vo);

		return "admin/adminselectQuestion";
	}

	@RequestMapping(value = "/adminAnswerForm.do", method = RequestMethod.GET)
	public String adminAnswerForm(QuestionVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {		
		
		int questionNo;
		session = request.getSession();
		questionNo = (int) session.getAttribute("SessionquestionNo");

		
		
		System.out.println("2:" + questionNo);
		
		
		
		
		vo.setQuestionNo(questionNo);
		

		return "admin/adminAnswer";
	}
	
	@ResponseBody
	@RequestMapping(value = "/answerInsert.do", method = RequestMethod.GET)
	public String answerInsert(QuestionVO vo, HttpSession session, HttpServletRequest request) throws Exception {

		String data = "";
		
		String userId = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");

		int questionNo;
		session = request.getSession();
		questionNo = (int) session.getAttribute("SessionquestionNo");
		
		int count = questionService.answerCount(questionNo);

		System.out.println("count"+count);
		
		if(count == 0) {
		
		vo.setUserId(userId);
		vo.setQuestionNo(questionNo);
		questionService.answerInsert(vo);

		session.removeAttribute("SessionquestionNo");
		
		data="ok";
		}

		return data;
	}

	@RequestMapping(value = "/adminAnswerList.do")
	public String adminAnswerList(QuestionVO vo, Model model, HttpSession session, HttpServletRequest request)
			throws Exception {

		String userId = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");
		vo.setUserId(userId);

		int total = questionService.answerListTotal(vo);
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
		model.addAttribute("adminAnswerList", questionService.selectadminAnswerList(vo));

		return "admin/adminAnswerList";
	}

}
