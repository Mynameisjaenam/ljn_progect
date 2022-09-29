package ljn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ljn.service.QuestionDAO;
import ljn.service.QuestionService;
import ljn.service.QuestionVO;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Resource(name = "questiondaoMybatis")
	private QuestionDAO questionDAO;

	@Override
	public void quetionInsert(QuestionVO vo) throws Exception {
		questionDAO.quetionInsert(vo);		
	}

	@Override
	public List<QuestionVO> selectQuestionList(QuestionVO vo) throws Exception {
		return questionDAO.selectQuestionList(vo);
	}

	@Override
	public int quetionListTotal(String userId) throws Exception {
		return questionDAO.quetionListTotal(userId);
	}

	@Override
	public QuestionVO selectQuestion(QuestionVO vo) throws Exception {
		return questionDAO.selectQuestion(vo);
	}

	@Override
	public void questionDelete(int questionNo) throws Exception {
		questionDAO.questionDelete(questionNo);
	}

	@Override
	public void updateQuestion(QuestionVO vo) throws Exception {
		questionDAO.updateQuestion(vo);
	}

	@Override
	public List<QuestionVO> selectadminQuestionList(QuestionVO vo) throws Exception {
		return questionDAO.selectadminQuestionList(vo);
	}

	@Override
	public int adminquestionListTotal(QuestionVO vo) throws Exception {
		return questionDAO.adminquestionListTotal(vo);
	}

	@Override
	public void answerInsert(QuestionVO vo) throws Exception {
		questionDAO.answerInsert(vo);
	}

	@Override
	public List<QuestionVO> selectadminAnswerList(QuestionVO vo) throws Exception {
		return questionDAO.selectadminAnswerList(vo);
	}

	@Override
	public int answerListTotal(QuestionVO vo) throws Exception {
		return questionDAO.answerListTotal(vo);
	}

	@Override
	public QuestionVO selectAnswer(QuestionVO vo) throws Exception {
		return questionDAO.selectAnswer(vo);
	}

	@Override
	public int answerCount(int questionNo) throws Exception {
		return questionDAO.answerCount(questionNo);
	}
	
}
