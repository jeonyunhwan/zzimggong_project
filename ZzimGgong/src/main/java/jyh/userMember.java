package vo;

public class userMember {
	private String email;
	private String pw;
	private int emailAuth;
	private String nickName;
	private String phoneNum;
	private String address;
	private int idAuth;
	private int noshow;
	private String nvrToken;
	private String kkoToken;
	/**
	 * @param email
	 * @param pw
	 * @param emailAuth
	 * @param nickName
	 * @param phoneNum
	 * @param address
	 * @param idAuth
	 */
	//일반 회원 등록 
	
	public userMember(String email, String pw, int emailAuth, String nickName, String phoneNum, String address,
			int idAuth) {
		super();
		this.email = email;
		this.pw = pw;
		this.emailAuth = emailAuth;
		this.nickName = nickName;
		this.phoneNum = phoneNum;
		this.address = address;
		this.idAuth = idAuth;
	}
	public userMember(String email, String pw, String nickName, String address) {
		this.email = email;
		this.pw = pw;
		this.nickName = nickName;
		this.address = address;
	}
	
	

	
	/**
	 * 
	 */
	public userMember() {
	
	}
	/**
	 * @param email
	 */
	public userMember(String email) {
		this.email = email;
	}
	/**
	 * @param email
	 * @param emailAuth
	 * @param nickName
	 * @param noshow
	 */
	//session 객체 
	public userMember(String email, int emailAuth, String nickName, int noshow) {
		this.email = email;
		this.emailAuth = emailAuth;
		this.nickName = nickName;
		this.noshow = noshow;
	}
	/**
	 * @param email
	 * @param nickName
	 */
	public userMember(String email, String nickName) {
		super();
		this.email = email;
		this.nickName = nickName;
	}


	/**
	 * @param email
	 * @param pw
	 * @param nickName
	 * @param address
	 */
	
	public String getNvrToken() {
		return nvrToken;
	}

	public int getNoshow() {
		return noshow;
	}
	public void setNoshow(int noshow) {
		this.noshow = noshow;
	}
	public String getKkoToken() {
		return kkoToken;
	}

	public void setNvrToken(String nvrToken) {
		this.nvrToken = nvrToken;
	}

	public void setKkoToken(String kkoToken) {
		this.kkoToken = kkoToken;
	}

	public String getEmail() {
		return email;
	}
	public String getPw() {
		return pw;
	}
	public int getEmailAuth() {
		return emailAuth;
	}
	public String getNickName() {
		return nickName;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public int getIdAuth() {
		return idAuth;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setEmailAuth(int emailAuth) {
		this.emailAuth = emailAuth;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setIdAuth(int idAuth) {
		this.idAuth = idAuth;
	}	
	
	
}

