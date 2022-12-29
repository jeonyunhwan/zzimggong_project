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
	
	// 비회원 예매하기
			public String res_insert(String user_email, String resNum, int reserve_apply_person, String reserve_start_time, String reserve_request ) {
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
					
					System.out.println("예약 신청 완료!");
					con.commit();
					
					rs = pstmt.executeQuery();
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println("DB 에러 : "+e.getMessage());
				}catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println("에러 : "+e.getMessage());
				}finally {
					DB.close(rs, pstmt, con);
				}
				
				return reserve_apply_person+"명 에약 완료!";
				
			}

}
