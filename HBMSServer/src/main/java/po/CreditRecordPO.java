package po;

import model.CreditRecordChangeType;
import model.CreditRecordReasonType;
import java.io.Serializable;
import java.util.Date;

public class CreditRecordPO implements Serializable{
	int creditRecordID;
	Date time;
	int userID;
	CreditRecordChangeType changeType;
	CreditRecordReasonType reasonType;
	Long amount;
	int orderID;

	public CreditRecordPO(int creditRecordID, Date time, int userID, CreditRecordChangeType changeType, CreditRecordReasonType reasonType, Long amount, int orderID) {
		this.creditRecordID = creditRecordID;
		this.time = time;
		this.userID = userID;
		this.changeType = changeType;
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

	public CreditRecordChangeType getChangeType() {
		return changeType;
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
