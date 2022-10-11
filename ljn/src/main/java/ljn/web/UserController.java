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

import ljn.service.UserService;
import ljn.service.UserVO;

@Controller
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		return "main";
	}

	@RequestMapping(value = "/about.do", method = RequestMethod.GET)
	public String about() {
		return "about";
	}
	
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage() {
		return "user/myPage";
	}
	
	@RequestMapping(value = "/myPage2.do", method = RequestMethod.GET)
	public String myPage2() {
		return "user/myPage2";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}	

	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login2(UserVO vo, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "userId") String userId, 
			@RequestParam(name = "userPw") String userPw) throws Exception {

		vo.setUserId(userId);
		vo.setUserPw(userPw);
		
		String data = "";

		int count = userService.userlogin(vo);
		
		if (count == 1) {
			String userName = userService.selectUserName(userId);
			String userPhone = userService.selectUserPhone(userId);
			String userEmail = userService.selectUserEmail(userId);
			String userAddressNum = userService.selectUserAddressNum(userId);
			String userAddress = userService.selectUserAddress(userId);
			session.setAttribute("SessionUserId", vo.getUserId());
			session.setAttribute("SessionUserPw", vo.getUserPw());
			session.setAttribute("SessionUserName", userName);
			session.setAttribute("SessionUserPhone", userPhone);
			session.setAttribute("SessionUserEmail", userEmail);
			session.setAttribute("SessionUseruserAddressNum", userAddressNum);
			session.setAttribute("SessionUseruserAddress", userAddress);
			data = "ok";
		}
		
		return data;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("SessionUserId");
		session.removeAttribute("SessionUserPw");
		session.removeAttribute("SessionUserName");
		session.removeAttribute("SessionUserPhone");
		session.removeAttribute("SessionUserEmail");
		session.removeAttribute("SessionUseruserAddressNum");
		session.removeAttribute("SessionUseruserAddress");
		return "main";
	}

	@RequestMapping(value = "/signUpform.do", method = RequestMethod.GET)
	public String signUpform() {
		return "user/signUp";
	}

	@ResponseBody
	@RequestMapping(value = "/signUpCount.do", method = RequestMethod.POST)
	public String signUpCount(String userId) throws Exception {

		String data = "";

		int count = userService.signUpCount(userId);

		if (count == 0) {
			data = "ok";
		} else {
			data = "fail";
		}
		System.out.println(data);
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String signUp(UserVO vo, String userId, 
			@RequestParam(name = "userPw") String userPw,
			@RequestParam(name = "userPw2") String userPw2) throws Exception {

		String data = "";
		
		int count = userService.signUpCount(userId);

		if (userPw.contentEquals(userPw2) && count == 0) {
			userService.signUpUser(vo);
			data = "ok";
		} else {
			data = "fail";
		}

		return data;
	}
	
	@RequestMapping(value = "/myPage.do")
	   public String myPageView(UserVO userVO, Model model, HttpSession session, HttpServletRequest request) throws Exception {
	      String userId = "";
	      session = request.getSession();
	      userId = (String) session.getAttribute("SessionUserId");
	      model.addAttribute("user", userService.selectUser(userId));
	      return "user/myPage";
	}	
	
	@RequestMapping(value = "/modifyPw.do", method = RequestMethod.GET)
	public String modifyPw() {
		return "user/modifyPw";
	}
	
	@RequestMapping(value = "/modifyPhone.do", method = RequestMethod.GET)
	public String modifyPhone() {
		return "user/modifyPhone";
	}
	
	@RequestMapping(value = "/modifyEmail.do", method = RequestMethod.GET)
	public String modifyEmail() {
		return "user/modifyEmail";
	}
	
	@RequestMapping(value = "/updatePw.do", method = RequestMethod.POST)
	public String updatePw(UserVO vo, HttpSession session, HttpServletRequest request) {
		
		vo.getUserPw();
		userService.updateuserPw(vo);
		
		session.removeAttribute("SessionUserId");
		
		return "user/myPage";
	}
	
	@RequestMapping(value = "/updatePhone.do", method = RequestMethod.POST)
	public String updatePhone(UserVO vo, HttpSession session, HttpServletRequest request, 
			@RequestParam(name = "userPhone") String userPhone) {
		
		vo.getUserPhone();
		userService.updateuserPhone(vo);		
		session.setAttribute("SessionUserPhone", userPhone);
		
		return "user/myPage";
	}
	
	@RequestMapping(value = "/updateEmail.do", method = RequestMethod.POST)
	public String updateEmail(UserVO vo, HttpSession session, HttpServletRequest request, 
			@RequestParam(name = "userEmail") String userEmail) {
		
		vo.getUserEmail();
		userService.updateuserEmail(vo);
		session.setAttribute("SessionUserEmail", userEmail);
		
		return "user/myPage";
	}

}
