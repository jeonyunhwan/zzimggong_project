package todayHouse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jspexp.a13_database.DB;

public class TodayNewmem {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void joinId(TodayVo inf) {
		String sql = "INSERT INTO today_member VALUES (?,?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inf.getId());
			pstmt.setString(2, inf.getPassword());
			pstmt.setString(3, inf.getNickname());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	         try {
	            con.rollback();
	         } catch (SQLException e1) {
	            // TODO Auto-generated catch block
	            System.out.println("rollback 에러:"+e1.getMessage());
	         }
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	}
	
	public boolean chId(String id) {
		String sql = "select id from TODAY_MEMBER where id = ?";
		boolean ch = false;
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			ch = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+ e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러 : "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return ch;
	}
}
