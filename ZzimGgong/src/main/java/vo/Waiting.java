package vo;

import java.util.Date;

public class Waiting {
	private String resnum;
	private String userEmail;
	private Date wstarttime;
	private String wstarttimeS;
	private int waitingNum;
	private int waitingPerson;
	private String cancle;
	private String enterChek;
	private int countResnum; //대기예상시간 등
	// 주문현황
	private String resName;
	private String resPhoneNum;
	private String resAddress;
	
	
	public Waiting() {}

	// 신청전대기인원
	public Waiting(String resnum, int countResnum) {
		this.resnum = resnum;
		this.countResnum = countResnum;
	}
	// 신청하기
	// 대기번호
	
	// 가게,신청정보 출력
	public Waiting(Date wstarttime, int waitingNum, int waitingPerson, String cancle, String enterChek, String resName,
			String resPhoneNum, String resAddress) {
		this.wstarttime = wstarttime;
		this.waitingNum = waitingNum;
		this.waitingPerson = waitingPerson;
		this.cancle = cancle;
		this.enterChek = enterChek;
		this.resName = resName;
		this.resPhoneNum = resPhoneNum;
		this.resAddress = resAddress;
	}
	
	//실시간 입장순서
	//취소하기(손님)
	//취소하기(가게)
	//입장하기(가게)
	
	
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getWstarttime() {
		return wstarttime;
	}
	public void setWstarttime(Date wstarttime) {
		this.wstarttime = wstarttime;
	}
	public int getWaitingNum() {
		return waitingNum;
	}
	public void setWaitingNum(int waitingNum) {
		this.waitingNum = waitingNum;
	}
	public int getWaitingPerson() {
		return waitingPerson;
	}
	public void setWaitingPerson(int waitingPerson) {
		this.waitingPerson = waitingPerson;
	}
	public String getCancle() {
		return cancle;
	}
	public void setCancle(String cancle) {
		this.cancle = cancle;
	}
	public String getEnterChek() {
		return enterChek;
	}
	public void setEnterChek(String enterChek) {
		this.enterChek = enterChek;
	}
	public int getCountResnum() {
		return countResnum;
	}
	public void setCountResnum(int countResnum) {
		this.countResnum = countResnum;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResPhoneNum() {
		return resPhoneNum;
	}
	public void setResPhoneNum(String resPhoneNum) {
		this.resPhoneNum = resPhoneNum;
	}
	public String getResAddress() {
		return resAddress;
	}
	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}
	public String getWstarttimeS() {
		return wstarttimeS;
	}
	public void setWstarttimeS(String wstarttimeS) {
		this.wstarttimeS = wstarttimeS;
	}
	
}
