package ljw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Waiting;


public class WaitingDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//신청전 대기인원
	public List<Waiting> countWaiting(Waiting bfwc){
		List<Waiting> wlist = new ArrayList<Waiting>();
		String sql = "SELECT resnum, count(resnum) as countResnum\r\n"
				+ "FROM WAITING\r\n"
				+ "WHERE TO_CHAR(wstarttime)=?\r\n"
				+ "AND resnum = ?\r\n"
				+ "AND cancel='F'\r\n"
				+ "AND enter_check='F'\r\n"
				+ "GROUP BY resnum ";
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bfwc.getWstarttimeS());
			pstmt.setString(2, bfwc.getResnum());

			rs = pstmt.executeQuery();
			while(rs.next()) {
				wlist.add(new Waiting(
							rs.getString("resnum"),
							rs.getInt("countResnum")
						));
			}
		}catch (SQLException e) {
			System.out.println("DB 에러: "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback 에러: "+e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러"+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return wlist;
	}
	
	
	
	
		
	public static void main(String[] args) {
		WaitingDao dao = new WaitingDao();
		
//		System.out.println();
//		for(Waiting w : dao.countWaiting()) {
//			System.out.println(w.getResnum());
//			System.out.println(w.getCountResnum());
//		}

	}
}
