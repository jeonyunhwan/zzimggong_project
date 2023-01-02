package hjw;

public class ResPick {
	private String resnum;
	private String mood;
	private String purpose;
	private String foody_type;
	private String table_type;
	public ResPick() {
		// TODO Auto-generated constructor stub
	}
	
	public ResPick(String resnum, String mood, String purpose, String foody_type, String table_type) {
		this.resnum = resnum;
		this.mood = mood;
		this.purpose = purpose;
		this.foody_type = foody_type;
		this.table_type = table_type;
	}
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getFoody_type() {
		return foody_type;
	}
	public void setFoody_type(String foody_type) {
		this.foody_type = foody_type;
	}
	public String getTable_type() {
		return table_type;
	}
	public void setTable_type(String table_type) {
		this.table_type = table_type;
	}
	
	
}
