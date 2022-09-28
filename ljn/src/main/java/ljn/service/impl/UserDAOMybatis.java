package ljn.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ljn.service.UserDAO;
import ljn.service.UserVO;

@Repository("userdaoMyBatis")
public class UserDAOMybatis extends EgovAbstractMapper implements UserDAO {

	public UserDAOMybatis() {
		System.out.println("===> UserDAOMyBatis 생성");
	}
	
	@Override
	public void signUpUser(UserVO vo) throws Exception {
		System.out.println("===> UserDAOMyBatis로 signUpUser() 기능 처리");
		vo.setUserRole("ROLE_USER");
		insert("signUpUser", vo);
	}

	@Override
	public int signUpCount(String userId) throws Exception {
		System.out.println("===> UserDAOMyBatis로 signUpCount() 기능 처리");		
		return selectOne("signUpCount", userId);
	}

	@Override
	public int userlogin(UserVO vo) throws Exception {	
		System.out.println("===> UserDAOMyBatis로 userlogin() 기능 처리");
		return selectOne("userlogin", vo);
	}

	@Override
	public String selectUserName(String userId) throws Exception {
		return selectOne("selectUserName", userId);
	}

	@Override
	public String selectUserPhone(String userId) throws Exception {
		return selectOne("selectUserPhone", userId);
	}

	@Override
	public String selectUserEmail(String userId) throws Exception {
		return selectOne("selectUserEmail", userId);
	}

	@Override
	public void updateuserPw(UserVO vo) {
		update("updateuserPw", vo);
	}

	@Override
	public void updateuserPhone(UserVO vo) {
		update("updateuserPhone", vo);		
	}

	@Override
	public void updateuserEmail(UserVO vo) {
		update("updateuserEmail", vo);		
	}

	@Override
	public UserVO selectUser(String userId) {
	    return selectOne("selectUser", userId);
	}

}
