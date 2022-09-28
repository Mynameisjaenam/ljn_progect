package ljn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ljn.service.RentalDAO;
import ljn.service.RentalService;
import ljn.service.RentalVO;

@Service("rentalService")
public class RentalServiceImpl implements RentalService {

	@Resource(name = "rentaldaoMybatis")
	private RentalDAO rentalDAO;

	@Override
	public void insertRental(RentalVO vo) throws Exception {
		System.out.println("===> insertReserve Impl 실행");
		rentalDAO.insertRental(vo);
	}

	@Override
	public int rentalCheck(RentalVO vo) throws Exception {
		return rentalDAO.rentalCheck(vo);
	}

	@Override
	public List<RentalVO> rentalConfirmList(RentalVO vo) throws Exception {
		return rentalDAO.rentalConfirmList(vo);
	}

	@Override
	public int userRentalTotal(String userId) throws Exception {
		return rentalDAO.userRentalTotal(userId);
	}

	@Override
	public void rentalDelete(int rentalNo) throws Exception {
		rentalDAO.rentalDelete(rentalNo);		
	}

	@Override
	public int dronePrice(int droneNo) throws Exception {
		return rentalDAO.dronePrice(droneNo);
	}

	@Override
	public int adminRentalTotal(RentalVO vo) throws Exception {
		return rentalDAO.adminRentalTotal(vo);
	}

	@Override
	public List<RentalVO> adminConfirmList(RentalVO vo) throws Exception {
		return rentalDAO.adminConfirmList(vo);
	}

	@Override
	public void insertDrone(RentalVO vo) throws Exception {
		rentalDAO.insertDrone(vo);		
	}

	@Override
	public int droneCheck(RentalVO vo) throws Exception {
		return rentalDAO.droneCheck(vo);
	}

	@Override
	public List<RentalVO> droneList(RentalVO vo) throws Exception {
		return rentalDAO.droneList(vo);
	}

	@Override
	public int droneCount(RentalVO vo) throws Exception {
		return rentalDAO.droneCount(vo);
	}

	@Override
	public void droneDelete(int droneNo) throws Exception {
		rentalDAO.droneDelete(droneNo);
	}

	@Override
	public List<RentalVO> searchDrone(RentalVO vo) throws Exception {
		return rentalDAO.searchDrone(vo);
	}



	
}
