package hds;

public class Reservation {
	private String user_email;
	private String resNum;
	private int reserve_apply_person;
	private String reserve_start_time;
	private String reserve_request;
	private int reserve_state;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(String user_email, String resNum, int reserve_apply_person, String reserve_start_time,
			String reserve_request, int reserve_state) {
		super();
		this.user_email = user_email;
		this.resNum = resNum;
		this.reserve_apply_person = reserve_apply_person;
		this.reserve_start_time = reserve_start_time;
		this.reserve_request = reserve_request;
		this.reserve_state = reserve_state;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getResNum() {
		return resNum;
	}

	public void setResNum(String resNum) {
		this.resNum = resNum;
	}

	public int getReserve_apply_person() {
		return reserve_apply_person;
	}

	public void setReserve_apply_person(int reserve_apply_person) {
		this.reserve_apply_person = reserve_apply_person;
	}

	public String getReserve_start_time() {
		return reserve_start_time;
	}

	public void setReserve_start_time(String reserve_start_time) {
		this.reserve_start_time = reserve_start_time;
	}

	public String getReserve_request() {
		return reserve_request;
	}

	public void setReserve_request(String reserve_request) {
		this.reserve_request = reserve_request;
	}

	public int getReserve_state() {
		return reserve_state;
	}

	public void setReserve_state(int reserve_state) {
		this.reserve_state = reserve_state;
	}
}