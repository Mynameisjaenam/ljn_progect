package ljn.service;

public interface UserDAO {

	void signUpUser(UserVO vo) throws Exception;

	int signUpCount(String userId) throws Exception;

	int userlogin(UserVO vo) throws Exception;

	String selectUserName(String userId) throws Exception;

	String selectUserPhone(String userId) throws Exception;
	
	String selectUserEmail(String userId) throws Exception;
	
	String selectUserAddressNum(String userId) throws Exception;
	
	String selectUserAddress(String userId) throws Exception;
	
	UserVO selectUser(String userId);
	
	void updateuserPw(UserVO vo);
	
	void updateuserPhone(UserVO vo);
	
	void updateuserEmail(UserVO vo);

}
