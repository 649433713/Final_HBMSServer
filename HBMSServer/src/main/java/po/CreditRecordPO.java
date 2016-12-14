package po;

import model.CreditRecordReasonType;
import java.io.Serializable;
import java.util.Date;

public class CreditRecordPO implements Serializable{


	private static final long serialVersionUID = 5432468739548863445L;
	int creditRecordID;
	Date time;
	int userID;
	CreditRecordReasonType reasonType;
	Long amount;
	int orderID;

	public CreditRecordPO(int creditRecordID, Date time, int userID, CreditRecordReasonType reasonType, Long amount, int orderID) {
		this.creditRecordID = creditRecordID;
		this.time = time;
		this.userID = userID;
		this.reasonType = reasonType;
		this.amount = amount;
		this.orderID = orderID;
	}

	public int getCreditRecordID() {
		return creditRecordID;
	}

	public Date getTime() {
		return time;
	}

	public int getUserID() {
		return userID;
	}

	public CreditRecordReasonType getReasonType() {
		return reasonType;
	}

	public Long getAmount() {
		return amount;
	}

	public int getOrderID() {
		return orderID;
	}
}
