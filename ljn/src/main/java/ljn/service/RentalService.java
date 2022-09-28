package ljn.service;

import java.util.List;

public interface RentalService {

	void insertRental(RentalVO vo) throws Exception;
	
	void insertDrone(RentalVO vo) throws Exception;
	
	int rentalCheck(RentalVO vo) throws Exception;
	
	int droneCheck(RentalVO vo) throws Exception;
	
	List<RentalVO> rentalConfirmList(RentalVO vo) throws Exception;
	
	List<RentalVO> adminConfirmList(RentalVO vo) throws Exception;
	
	List<RentalVO> droneList(RentalVO vo) throws Exception;
	
	List<RentalVO> searchDrone(RentalVO vo) throws Exception;
	
	int userRentalTotal(String userId) throws Exception;
	
	int adminRentalTotal(RentalVO vo) throws Exception;
	
	int droneCount(RentalVO vo) throws Exception;
	
	void rentalDelete(int rentalNo) throws Exception;
	
	int dronePrice(int droneNo) throws Exception;
	
	void droneDelete(int droneNo) throws Exception;
	
}
