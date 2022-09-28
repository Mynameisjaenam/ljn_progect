package ljn.service;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class RentalVO {

	private int rentalNo;
	private String userId;
	private String userName;
	private String userPhone;
	private int droneNo;
	private Date rentalSDate;
	private Date rentalEDate;
	private String droneName;
	private int price;
	

	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 5;

	private int pageList = 5;
	private int firstPage = 0;
	private int lastPage = 0;

}
