package ljn.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ljn.service.QuestionDAO;
import ljn.service.QuestionVO;

@Repository("questiondaoMybatis")
public class QuestionDAOMybatis extends EgovAbstractMapper implements QuestionDAO {

	public QuestionDAOMybatis() {
		System.out.println("===> QuestionDAOMybatis 생성");
	}

	@Override
	public void quetionInsert(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 quetionInsert() 기능 처리");
		insert("questionInsert", vo);
	}

	@Override
	public List<QuestionVO> selectQuestionList(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 selectQuestionList() 기능 처리");
		return selectList("selectQuestionList", vo);
	}

	@Override
	public int quetionListTotal(String userId) throws Exception {
		int count = selectOne("questionListTotal", userId);
		return count;
	}

	@Override
	public QuestionVO selectQuestion(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 selectQuestion() 기능 처리");
		return selectOne("selectQuestion", vo);
	}

	@Override
	public void questionDelete(int questionNo) throws Exception {
		System.out.println("===> MyBatis로 questionDelete() 기능 처리");
		delete("questionDelete", questionNo);
	}

	@Override
	public void updateQuestion(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 questionUpdate() 기능 처리");
		update("updateQuestion", vo);
	}

	@Override
	public List<QuestionVO> selectadminQuestionList(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 selectadminQuestionList() 기능 처리");
		return selectList("selectadminQuestionList", vo);
	}

	@Override
	public int adminquestionListTotal(QuestionVO vo) throws Exception {
		int count = selectOne("adminquestionListTotal", vo);
		return count;
	}

	@Override
	public void answerInsert(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 answerInsert() 기능 처리");
		insert("answerInsert", vo);		
	}

	@Override
	public List<QuestionVO> selectadminAnswerList(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 selectadminAnswerList() 기능 처리");
		return selectList("selectadminAnswerList", vo);
	}

	@Override
	public int answerListTotal(QuestionVO vo) throws Exception {
		int count = selectOne("answerListTotal", vo);
		return count;
	}

	@Override
	public QuestionVO selectAnswer(QuestionVO vo) throws Exception {
		System.out.println("===> MyBatis로 selectAnswer() 기능 처리");
		return selectOne("selectAnswer", vo);
	}
	
}
