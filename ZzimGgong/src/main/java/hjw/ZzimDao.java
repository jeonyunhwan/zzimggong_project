package hjw;


import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ZzimDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
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
			    			rs.getString(2)
			    	 );
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
}
