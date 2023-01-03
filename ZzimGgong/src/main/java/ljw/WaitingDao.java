package ljw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ljw.vo.Waiting;


public class WaitingDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//신청전 대기인원
	/*
	public List<Waiting> countWaiting(String wstarttimeS, String resnum){
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
			pstmt.setString(1, wstarttimeS);
			pstmt.setString(2, resnum);

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
	*/
	
	//신청전 대기인원-쉬운버전 날짜 빠진 버전
	public List<Waiting> countWaiting(String resnum){
		List<Waiting> wlist = new ArrayList<Waiting>();
		String sql = "SELECT count(resnum) AS countResnum\r\n"
				+ "FROM WAITING w \r\n"
				+ "WHERE RESNUM = ? \r\n"
				+ "AND CANCEL = 'F' AND ENTER_CHECK ='F'\r\n"
				+ "GROUP BY resnum";
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, resnum);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				wlist.add(new Waiting(
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
	
	
	
	//신청하기클릭
	//1. 신청하기 <<고객
	public void insertWaiting(Waiting w) {
		String sql="INSERT INTO WAITING VALUES(?,?,sysdate,0,?, upper('F'),upper('F'))";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, w.getResnum());
			pstmt.setString(2, w.getUserEmail());
			pstmt.setInt(3, w.getWaitingNum());
			pstmt.setInt(4, w.getWaitingPerson());
			pstmt.setString(5, w.getCancle());
			pstmt.setString(6, w.getEnterCheck());

			pstmt.executeUpdate();
			con.commit();
			
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
	
	}
	
	//2. 대기번호
	public void updWaitingNum(Waiting ww) {
		String sql="UPDATE WAITING \r\n"
				+ "SET WAITING_NUM = ( SELECT count(resnum) \r\n"
				+ "					FROM WAITING\r\n"
				+ "					WHERE TO_CHAR(wstarttime)=? \r\n"
				+ "					AND resnum=?\r\n"
				+ "					GROUP BY resnum\r\n"
				+ "				  )\r\n"
				+ "WHERE user_email=?\r\n"
				+ "AND cancel='F' 		\r\n"
				+ "AND enter_check='F'";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ww.getWstarttimeS());
			pstmt.setString(2, ww.getResnum());
			pstmt.setString(3, ww.getUserEmail());

			pstmt.executeUpdate();
			con.commit();
			
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
	}
	
	
		
	// 주문현황
	// 1. 가게, 신청정보 출력
	public List<Waiting> curntSitu(String userEmail){
		List<Waiting> cwlist = new ArrayList<Waiting>();
		String sql = "SELECT res_name, res_phonenum, res_addresss, wstarttime, waiting_num, waiting_person, cancel, enter_check\r\n"
				+ "FROM waiting w, RESTAURANT r  \r\n"
				+ "WHERE w.resnum = r.resnum\r\n"
				+ "AND user_email= ?\r\n"
				+ "AND cancel='F'\r\n"
				+ "AND enter_check='F";
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userEmail);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				cwlist.add(new Waiting(
							rs.getString("resName"),
							rs.getString("resAddress"),
							rs.getString("resAddress"),
							rs.getDate("wstarttime"),
							rs.getInt("waitingNum"),
							rs.getInt("waitingPerson"),
							rs.getString("cancle"),
							rs.getString("enterCheck")
							
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
		return cwlist;
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
