package vo;

public class userMemberVo {
	private String userId;
	private String password;
	private String email;
	private String nickName;
	private String phoneNumber;
	private String address;
	private int noShowNum;
	private String accessToken;
	/**
	 * @param userId
	 * @param password
	 * @param email
	 * @param phoneNumber
	 * @param noShowNum
	 * @param accessToken
	 */
	public userMemberVo() {		
	}
	
	
	/**
	 * @param userId
	 * @param password
	 * @param address
	 * @param noShowNum
	 */
	// 회원가입 요청값 insert
	public userMemberVo(String userId, String password,String nickName, String address) {
		this.userId = userId;
		this.password = password;
		this.nickName = nickName;
		this.address = address;
	}
	
	

	public String getNickName() {
		return nickName;
	}


	public String getAddress() {
		return address;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public int getNoShowNum() {
		return noShowNum;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public void setNoShowNum(int noShowNum) {
		this.noShowNum = noShowNum;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	
	
}
