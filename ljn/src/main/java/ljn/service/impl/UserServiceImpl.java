package ljn.service.impl;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ljn.service.UserDAO;
import ljn.service.UserService;
import ljn.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "userdaoMyBatis")
	private UserDAO userDAO;

	@Override
	public void signUpUser(UserVO vo) throws Exception {
		userDAO.signUpUser(vo);		
	}

	@Override
	public int signUpCount(String userId) throws Exception {
		
		int count = userDAO.signUpCount(userId);
		System.out.println("count: " + count);
		
		return count;		
	}

	@Override
	public int userlogin(UserVO vo) throws Exception {				
		return userDAO.userlogin(vo);
	}

	@Override
	public String selectUserName(String userId) throws Exception {
		return userDAO.selectUserName(userId);
	}

	@Override
	public String selectUserPhone(String userId) throws Exception {
		return userDAO.selectUserPhone(userId);
	}

	@Override
	public String selectUserEmail(String userId) throws Exception {
		return userDAO.selectUserEmail(userId);
	}
	
	@Override
	public String selectUserAddressNum(String userId) throws Exception {
		return userDAO.selectUserAddressNum(userId);
	}

	@Override
	public String selectUserAddress(String userId) throws Exception {
		return userDAO.selectUserAddress(userId);
	}

	@Override
	public void updateuserPw(UserVO vo) {
		userDAO.updateuserPw(vo);		
	}

	@Override
	public void updateuserPhone(UserVO vo) {
		userDAO.updateuserPhone(vo);
	}

	@Override
	public void updateuserEmail(UserVO vo) {
		userDAO.updateuserEmail(vo);		
	}

	@Override
	public UserVO selectUser(String userId) {
		return userDAO.selectUser(userId);
	}

}
