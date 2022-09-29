package ljn.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ljn.service.RentalService;
import ljn.service.RentalVO;

@Controller
public class RentalController {

	@Resource(name = "rentalService")
	private RentalService rentalService;

	@RequestMapping(value = "/rental.do", method = RequestMethod.GET)
	public String rental() {
		
		return "rental/rental";
	}

	@RequestMapping(value = "/rentaldrone1.do", method = RequestMethod.GET)
	public String rentaldrone1() {
		return "rental/droneRental/rentaldrone1";
	}

	@RequestMapping(value = "/rentaldrone2.do", method = RequestMethod.GET)
	public String rentaldrone2() {
		return "rental/droneRental/rentaldrone2";
	}

	@RequestMapping(value = "/rentaldrone3.do", method = RequestMethod.GET)
	public String rentaldrone3() {
		return "rental/droneRental/rentaldrone3";
	}

	@RequestMapping(value = "/rentaldrone4.do", method = RequestMethod.GET)
	public String rentaldrone4() {
		return "rental/droneRental/rentaldrone4";
	}

	@RequestMapping(value = "/rentaldrone5.do", method = RequestMethod.GET)
	public String rentaldrone5() {
		return "rental/droneRental/rentaldrone5";
	}

	@RequestMapping(value = "/rentaldrone6.do", method = RequestMethod.GET)
	public String rentaldrone6() {		
		return "rental/droneRental/rentaldrone6";
	}

	@ResponseBody
	@RequestMapping(value = "/insertrental.do", method = RequestMethod.POST)
	public String insertrental(RentalVO vo, 
			@RequestParam(name = "rentalSDate") Date rentalSDate, 
			@RequestParam(name = "rentalEDate") Date rentalEDate, 
			@RequestParam(name = "droneNo") int droneNo, HttpSession session, HttpServletRequest request) throws Exception {

		String data = "";

		int count = rentalService.rentalCheck(vo);

		System.out.println(count);
		
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd"); 
		String sDate = simpleDateFormat.format(rentalSDate);
		String eDate = simpleDateFormat.format(rentalEDate);
		int sD = Integer.parseInt(sDate);
		int eD = Integer.parseInt(eDate);
		int result = eD - sD + 1;
		
		int price = rentalService.dronePrice(droneNo);	
		int totalPrice = price * result;
		vo.setPrice(totalPrice);
		

		if(count >= 1) {
			data = "fail";
		} else if(sD > eD) {
			data = "overdate";
		} else if(count == 0) {
			data = "ok";
			rentalService.insertRental(vo);
		}
		
		session.removeAttribute("SessionrentalSDate");
		session.removeAttribute("SessionrentalEDate");

		return data;
	}

	@RequestMapping(value = "rentalConfirm.do", method = RequestMethod.GET)
	public String rentalConfirm(RentalVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {

		String userId = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");

		System.out.println(userId);

		int total = rentalService.userRentalTotal(userId);
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
		vo.setUserId(userId);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);

		model.addAttribute("rentalList", rentalService.rentalConfirmList(vo));

		return "rental/rentalConfirm";
	}
	
	@RequestMapping(value = "/rentalDelete.do", method = RequestMethod.GET)
	public String rentalDelete() throws Exception {			
		return "rental/rentalDelete";
	}
	
	@RequestMapping(value = "/adminDelete.do", method = RequestMethod.GET)
	public String adminDelete() throws Exception {			
		return "admin/adminDelete";
	}
	
	@RequestMapping(value = "/droneDelete.do", method = RequestMethod.GET)
	public String droneDelete() throws Exception {			
		return "admin/droneDelete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/rentalDelete.do", method = RequestMethod.POST)
	public String rentalDelete(HttpSession session, HttpServletRequest request) throws Exception {
		
		String data = "";
		
		int rentalNo = (int) session.getAttribute("SessionrentalNo");
		
		if(rentalNo != 0) {
			System.out.println("rentalNo=>" + rentalNo);			
			rentalService.rentalDelete(rentalNo);
			session.removeAttribute("SessionrentalNo");
			data = "ok";
		}
				
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/adminDelete.do", method = RequestMethod.POST)
	public String adminDelete(HttpSession session, HttpServletRequest request) throws Exception {
		
		String data = "";
		
		int rentalNo = (int) session.getAttribute("SessionrentalNo");
		
		if(rentalNo != 0) {
			System.out.println("rentalNo=>" + rentalNo);			
			rentalService.rentalDelete(rentalNo);
			session.removeAttribute("SessionrentalNo");
			data = "ok";
		}
				
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/droneDelete.do", method = RequestMethod.POST)
	public String droneDelete(HttpSession session, HttpServletRequest request) throws Exception {
		
		String data = "";
		
		int droneNo = (int) session.getAttribute("SessiondroneNo");
		
		if(droneNo != 0) {
			System.out.println("droneNo=>" + droneNo);			
			rentalService.droneDelete(droneNo);
			session.removeAttribute("SessiondroneNo");
			data = "ok";
		}
				
		return data;
	}
	
	@RequestMapping(value = "/rentalDeleteConfirm.do", method = RequestMethod.GET)
	public String rentalDeleteConfirm() throws Exception {				
		return "rental/rentalConfirm";
	}
	
	@RequestMapping(value = "/adminDeleteConfirm.do", method = RequestMethod.GET)
	public String adminDeleteConfirm() throws Exception {				
		return "admin/rentalList";
	}
	
	@RequestMapping(value = "/droneDeleteConfirm.do", method = RequestMethod.GET)
	public String droneDeleteConfirm() throws Exception {				
		return "admin/droneList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/rentalDeleteConfirm.do", method = RequestMethod.POST)
	public String rentalDeleteConfirm(@RequestParam(name = "rentalNo") int rentalNo, Model model, 
			HttpSession session, HttpServletRequest request) throws Exception {
		
		String data = "";
		
		if (rentalNo != 0) {
			session.setAttribute("SessionrentalNo", rentalNo);
			data = "ok";
		}
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/adminDeleteConfirm.do", method = RequestMethod.POST)
	public String adminDeleteConfirm(@RequestParam(name = "rentalNo") int rentalNo, Model model, 
			HttpSession session, HttpServletRequest request) throws Exception {
		
		String data = "";
		
		if (rentalNo != 0) {
			System.out.println("대여번호" + rentalNo);
			session.setAttribute("SessionrentalNo", rentalNo);
			data = "ok";
		}
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/droneDeleteConfirm.do", method = RequestMethod.POST)
	public String droneDeleteConfirm(@RequestParam(name = "droneNo") int droneNo, Model model, 
			HttpSession session, HttpServletRequest request) throws Exception {
		
		String data = "";
		
		if (droneNo != 0) {
			System.out.println("드론번호" + droneNo);
			session.setAttribute("SessiondroneNo", droneNo);
			data = "ok";
		}
		
		return data;
	}
	
//	==========================================================================================================
	
	@RequestMapping(value = "/adminConfirm.do", method = RequestMethod.GET)
	public String adminConfirm(RentalVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		String userId = "";
		session = request.getSession();
		userId = (String) session.getAttribute("SessionUserId");

		System.out.println(userId);

		int total = rentalService.adminRentalTotal(vo);
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
		vo.setUserId(userId);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);

		model.addAttribute("adminrentalList", rentalService.adminConfirmList(vo));
		
		return "admin/rentalList";
	}
	
	@RequestMapping(value = "/insertDroneForm.do", method = RequestMethod.GET)
	public String insertDroneForm() throws Exception {				
		return "admin/insertDrone";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertDrone.do", method = RequestMethod.POST)
	public String insertDrone(RentalVO vo) throws Exception {
		
		String data = "";
		
		int count = rentalService.droneCheck(vo);
		
		System.out.println(count);
		
		if(count == 0) {
			rentalService.insertDrone(vo);
			data = "ok";
		} else if (count >= 1) {
			data = "fail";
		}
		
		return data;
	}
	
	@RequestMapping(value = "/droneList.do", method = RequestMethod.GET)
	public String droneList(RentalVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {

		int total = rentalService.droneCount(vo);
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

		model.addAttribute("droneList", rentalService.droneList(vo));
		
		return "admin/droneList";
	}
	
//	==========================================================================================================	
	
	@RequestMapping(value = "/rentalDate.do", method = RequestMethod.GET)
	public String rentalDate() throws Exception {			
		return "rental/rentalDate";
	}
	
	@RequestMapping(value = "/searchDrone.do", method = RequestMethod.POST)
	public String searchDrone(RentalVO vo, @RequestParam(name = "rentalSDate") Date rentalSDate, 
			@RequestParam(name = "rentalEDate") Date rentalEDate,
			Model model, HttpSession session, HttpServletRequest request) throws Exception {					
		
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy");	
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");	
		
		DateFormat format2 = new SimpleDateFormat("yyyyMMdd");	
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyyMMdd");
		
		String sDate = simpleDateFormat.format(rentalSDate);
		String eDate = simpleDateFormat.format(rentalEDate);
		
		String sDate2 = simpleDateFormat2.format(rentalSDate);
		String eDate2 = simpleDateFormat2.format(rentalEDate);
		int sD = Integer.parseInt(sDate2);
		int eD = Integer.parseInt(eDate2);
		
		System.out.println(sDate);
		System.out.println(eDate);
		
		System.out.println("sD:"+sD);
		System.out.println("eD:"+eD);
		
		if(sD <= eD) {		
			vo.setRentalSDate(rentalSDate);
			vo.setRentalEDate(rentalEDate);
			
			session.setAttribute("SessionrentalSDate", sDate);
			session.setAttribute("SessionrentalEDate", eDate);
					
			model.addAttribute("sDrone", rentalService.searchDrone(vo));
		}
		
		return "rental/searchDrone";
	}
	
	
}
