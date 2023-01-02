package ymw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ymw.vo.Restaurant;
import ymw.vo.Review;
import ymw.vo.StoReview;

public class StoreInfo {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public Restaurant detailStore(String resnum){
		  Restaurant schList = new Restaurant();
	      String sql="SELECT * FROM RESTAURANT WHERE resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList = new Restaurant(
	        			 rs.getString(1),
	        			 rs.getString(2),
			        	 rs.getString(3),
						 rs.getString(4),
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7),
						 rs.getString(8),
						 rs.getString(9),
						 rs.getString(10),
						 rs.getString(11),
						 rs.getString(12),
						 rs.getString(13),
						 rs.getInt(14),
						 rs.getInt(15))
							 ;
				}
	         
	      }catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return schList;
	      
	   }
	
	public StoReview StoreReview(String resnum){
		StoReview schList = new StoReview();
	      String sql="SELECT r.RESNUM, r.RES_NAME, NVL(rev.sco, 0)sco, NVL(rev.cnt,0) cnt\r\n"
	      		+ "FROM restaurant r, menu m, (SELECT RESNUM, avg(STAR_SCO) sco, count(STAR_SCO) cnt FROM jjim_review GROUP BY RESNUM) rev\r\n"
	      		+ "WHERE r.RESNUM = m.RESNUM AND r.RESNUM = rev.resnum(+) AND r.resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList = new StoReview(
	        			 rs.getString(1),
	        			 rs.getString(2),
			        	 rs.getDouble(3),
						 rs.getInt(4))
							 ;
				}
	         
	      }catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return schList;
	      
	   }
	
	public Review detailReview(String resnum){
		Review schList = new Review();
	      String sql="SELECT * FROM RESTAURANT WHERE resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList = new Review(
	        			 rs.getString(1),
	        			 rs.getString(2),
			        	 rs.getString(3),
						 rs.getDouble(4),
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7))
							 ;
				}
	         
	      }catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return schList;
	      
	   }
}
