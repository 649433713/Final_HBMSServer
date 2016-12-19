package po;

import java.io.Serializable;

public class RankPO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3338900337062010058L;
	int rank;
	int discount;
	int value;
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "RankPO [rank=" + rank + ", discount=" + discount + ", value=" + value + "]";
	}
	public RankPO(int rank, int discount, int value) {
		super();
		this.rank = rank;
		this.discount = discount;
		this.value = value;
	}
	
}
