package ljn.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ljn.service.RentalDAO;
import ljn.service.RentalVO;

@Repository("rentaldaoMybatis")
public class RentalDAOMybatis extends EgovAbstractMapper implements RentalDAO {

	public RentalDAOMybatis() {
		System.out.println("===> RentalDAOMybatis 생성");
	}

	@Override
	public void insertRental(RentalVO vo) throws Exception {
		System.out.println("===> MyBatis로 insertRental() 기능 처리");
		insert("insertRental", vo);
	}

	@Override
	public int rentalCheck(RentalVO vo) throws Exception {
		int count = selectOne("rentalCheck", vo);
		return count;
	}
	
	@Override
	public List<RentalVO> rentalConfirmList(RentalVO vo) throws Exception {
		System.out.println("===> MyBatis로 rentalConfirmList() 기능 처리");
		return selectList("rentalConfirmList", vo);
	}

	@Override
	public int userRentalTotal(String userId) throws Exception {
		return selectOne("userRentalTotal", userId);
	}

	@Override
	public void rentalDelete(int rentalNo) throws Exception {
		System.out.println("===> MyBatis로 rentalDelete() 기능 처리");
		delete("rentalDelete", rentalNo);
	}

	@Override
	public int dronePrice(int droneNo) throws Exception {
		return selectOne("dronePrice", droneNo);
	}

	@Override
	public int adminRentalTotal(RentalVO vo) throws Exception {
		return selectOne("adminRentalTotal", vo);
	}

	@Override
	public List<RentalVO> adminConfirmList(RentalVO vo) throws Exception {
		System.out.println("===> MyBatis로 adminConfirmList() 기능 처리");
		return selectList("adminConfirmList", vo);
	}

	@Override
	public void insertDrone(RentalVO vo) throws Exception {
		System.out.println("===> MyBatis로 insertDrone() 기능 처리");
		insert("insertDrone", vo);
	}

	@Override
	public int droneCheck(RentalVO vo) throws Exception {
		int count = selectOne("droneCheck", vo);
		return count;
	}

	@Override
	public List<RentalVO> droneList(RentalVO vo) throws Exception {
		System.out.println("===> MyBatis로 droneList() 기능 처리");
		return selectList("droneList", vo);
	}

	@Override
	public int droneCount(RentalVO vo) throws Exception {
		return selectOne("droneCount", vo);
	}

	@Override
	public void droneDelete(int droneNo) throws Exception {
		System.out.println("===> MyBatis로 rentalDelete() 기능 처리");
		delete("droneDelete", droneNo);
		
	}

	@Override
	public List<RentalVO> searchDrone(RentalVO vo) throws Exception {
		System.out.println("===> MyBatis로 searchDrone() 기능 처리");
		return selectList("searchDrone", vo);
	}


	
	
}
