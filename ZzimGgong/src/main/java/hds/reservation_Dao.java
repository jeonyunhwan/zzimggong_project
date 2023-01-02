package hds;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class reservation_Dao {
	// 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 즉시예약 신청
	public void res_insert(String user_email, String resNum, int reserve_apply_person, String reserve_start_time, String reserve_request ) {
		String sql="INSERT INTO RESERVATION values(?,?,?,to_date(?,'YYYY-MM-DD HH24:MI'),?,0)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, resNum);
			pstmt.setInt(3, reserve_apply_person);
			pstmt.setString(4, reserve_start_time);
			pstmt.setString(5, reserve_request);
			

			con.commit();
			int insertSuccess = pstmt.executeUpdate();
			 if (insertSuccess>0) {
				System.out.println("예약 신청 완료!");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
		
	}

	// 즉시예약 승인
	public void res_approval(String user_email, String resNum,String reserve_start_time) {
		String sql="UPDATE RESERVATION\r\n"
				+ "SET reserve_state = 1\r\n"
				+ "WHERE USER_EMAIL = ?\r\n"
				+ "AND RESNUM = ?\r\n"
				+ "AND RESERVE_START_TIME = to_date(?,'YYYY-MM-DD HH24:MI')";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, resNum);
			pstmt.setString(3, reserve_start_time);	
	
			con.commit();
			int insertSuccess = pstmt.executeUpdate();
			 if (insertSuccess>0) {
				System.out.println("예약 승인 완료!");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
		
	}	

}
