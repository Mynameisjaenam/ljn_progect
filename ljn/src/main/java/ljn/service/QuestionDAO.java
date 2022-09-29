package ljn.service;

import java.util.List;

public interface QuestionDAO {

	void quetionInsert(QuestionVO vo) throws Exception;
	
	List<QuestionVO> selectQuestionList(QuestionVO vo) throws Exception;
	
	List<QuestionVO> selectadminQuestionList(QuestionVO vo) throws Exception;
	
	int quetionListTotal(String userId) throws Exception;
	
	int adminquestionListTotal(QuestionVO vo) throws Exception;
	
	QuestionVO selectQuestion(QuestionVO vo) throws Exception;
	
	void questionDelete(int questionNo) throws Exception;
	
	void updateQuestion(QuestionVO vo) throws Exception;
	
	void answerInsert(QuestionVO vo) throws Exception;
	
	List<QuestionVO> selectadminAnswerList(QuestionVO vo) throws Exception;
	
	int answerListTotal(QuestionVO vo) throws Exception;
	
	QuestionVO selectAnswer(QuestionVO vo) throws Exception;
	
	int answerCount(int questionNo) throws Exception;
	
}
