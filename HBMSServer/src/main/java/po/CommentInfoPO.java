package po;

import java.awt.Image;
import java.io.Serializable;
import java.util.Date;

/**
 * @author 凡
 *
 */
public class CommentInfoPO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1340405623531713283L;
	int commentID;
	Date time;
	int hotelID;
	int score;
	String comment;
	Image picture1;
	Image picture2;
	Image picture3;
	public CommentInfoPO(int commentID, Date time, int hotelID, int score, String comment, Image picture1,
			Image picture2, Image picture3) {
		super();
		this.commentID = commentID;
		this.time = time;
		this.hotelID = hotelID;
		this.score = score;
		this.comment = comment;
		this.picture1 = picture1;
		this.picture2 = picture2;
		this.picture3 = picture3;
	}
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getHotelID() {
		return hotelID;
	}
	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Image getPicture1() {
		return picture1;
	}
	public void setPicture1(Image picture1) {
		this.picture1 = picture1;
	}
	public Image getPicture2() {
		return picture2;
	}
	public void setPicture2(Image picture2) {
		this.picture2 = picture2;
	}
	public Image getPicture3() {
		return picture3;
	}
	public void setPicture3(Image picture3) {
		this.picture3 = picture3;
	}
	@Override
	public String toString() {
		return "CommentInfoPO [commentID=" + commentID + ", time=" + time + ", hotelID=" + hotelID + ", score=" + score
				+ ", comment=" + comment + ", picture1=" + picture1 + ", picture2=" + picture2 + ", picture3="
				+ picture3 + "]";
	}
	
	
	
}
