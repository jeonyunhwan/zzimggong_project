package hjw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// hjw/ZzimDao.;
public class ZzimDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String resNumber;
	public  Restaurant login(Restaurant res){
		  	Restaurant resNum =null;
		  	String sql = "SELECT * FROM RESTAURANT WHERE resnum=?";
		  	try {
			     con = DB.con();
			     pstmt = con.prepareStatement(sql);
			     pstmt.setString(1, res.getResnum()); //
			     rs = pstmt.executeQuery();
			     if(rs.next()) {
			    	 resNum = new Restaurant(
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
		        			 rs.getInt(12),
		        			 rs.getString(13),
		        			 rs.getInt(14),
		        			 rs.getInt(15)
			    	 );
			    	 resNumber=rs.getString(1);
			     }
			 // 해당 id, pass로 조회 될 때만 true, 그 외는 false
			  }catch (SQLException e) {
			     System.out.println("DB에러:"+e.getMessage());
			  }catch(Exception e) {
			     System.out.println("일반 에러:"+e.getMessage());
			  }finally {
			         DB.close(rs, pstmt, con);
			  } 
			      return resNum;
	}
	
	public List<Restaurant> getRestaurantInfo(Restaurant res,String resNumber){
	      List<Restaurant> reslist = new ArrayList<Restaurant>();
	      String sql = "SELECT * FROM RESTAURANT WHERE resnum=?";
	      try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resNumber);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {

	             reslist.add(new Restaurant(
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
	        			 rs.getInt(12),
	        			 rs.getString(13),
	        			 rs.getInt(14),
	        			 rs.getInt(15)
                         )
	            		 
                 );
	        	 
	         }
	         System.out.println("데이터 건수:"+reslist.size());
	         
	      } catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return reslist;
	   }
}
