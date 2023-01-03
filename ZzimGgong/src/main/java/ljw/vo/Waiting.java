package ljw.vo;
import java.util.Date;

public class Waiting {
	
		private String resnum;
		private String userEmail;
		private Date wstarttime;
		private String wstarttimeS;
		private int waitingNum;
		private int waitingPerson;
		private String cancle;
		private String enterCheck;
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
		// 신청전대기인원-쉬운버전
		public Waiting(int countResnum) {
			this.countResnum = countResnum;
		}
		
		
		// 신청하기
		/*
		public Waiting(String resnum, String userEmail, Date wstarttime, int waitingNum, int waitingPerson, String cancle,
				String enterCheck) {
			this.resnum = resnum;
			this.userEmail = userEmail;
			this.wstarttime = wstarttime;
			this.waitingNum = waitingNum;
			this.waitingPerson = waitingPerson;
			this.cancle = cancle;
			this.enterCheck = enterCheck;
		}
		// 대기번호
		*/
		
		// 가게,신청정보 출력
		public Waiting(String resName, String resPhoneNum, String resAddress, Date wstarttime, int waitingNum, int waitingPerson, String cancle, String enterCheck ) {
			this.resName = resName;
			this.resPhoneNum = resPhoneNum;
			this.resAddress = resAddress;
			this.wstarttime = wstarttime;
			this.waitingNum = waitingNum;
			this.waitingPerson = waitingPerson;
			this.cancle = cancle;
			this.enterCheck = enterCheck;	
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
		public String getEnterCheck() {
			return enterCheck;
		}
		public void setEnterChek(String enterCheck) {
			this.enterCheck = enterCheck;
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
