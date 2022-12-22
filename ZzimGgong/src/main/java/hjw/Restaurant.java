package hjw;

import java.util.Date;

public class Restaurant {
	private String resnum;
	private String res_name;
	private String res_email;
	private String res_phonenum;
	private String res_img;
	private String opentime;
	private String endtime;
	private String day_off;
	private String stbtime;
	private String edbtime;
	private String convenient;
	private String introduce;
	private int deposit;
	private Date enroll_date;
	public Restaurant() {
		// TODO Auto-generated constructor stub
	}
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getRes_email() {
		return res_email;
	}
	public void setRes_email(String res_email) {
		this.res_email = res_email;
	}
	public String getRes_phonenum() {
		return res_phonenum;
	}
	public void setRes_phonenum(String res_phonenum) {
		this.res_phonenum = res_phonenum;
	}
	public String getRes_img() {
		return res_img;
	}
	public void setRes_img(String res_img) {
		this.res_img = res_img;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getDay_off() {
		return day_off;
	}
	public void setDay_off(String day_off) {
		this.day_off = day_off;
	}
	public String getStbtime() {
		return stbtime;
	}
	public void setStbtime(String stbtime) {
		this.stbtime = stbtime;
	}
	public String getEdbtime() {
		return edbtime;
	}
	public void setEdbtime(String edbtime) {
		this.edbtime = edbtime;
	}
	public String getConvenient() {
		return convenient;
	}
	public void setConvenient(String convenient) {
		this.convenient = convenient;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public Date getEnroll_date() {
		return enroll_date;
	}
	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}
	public Restaurant(String resnum, String res_name) {
		this.resnum = resnum;
		this.res_name = res_name;
	}
	
}
