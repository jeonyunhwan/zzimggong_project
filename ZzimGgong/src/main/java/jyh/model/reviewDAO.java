package jyh.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class reviewDAO {
	private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    //전체 게시물 수 가져오기.
    
    public int selectCount(String email) {
    	int totalCount = 0;
    	
    	String query = "select count(*) from jjim_review where user_email = ?";
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
		pstmt.setString(1,email);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			totalCount = rs.getInt(1);
		}
    	} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return totalCount;   	
    }
    //페이지 처리한 메서드 
    public ArrayList<reviewDTO> reviewView(String email,int page) {
    	ArrayList<reviewDTO> list = new ArrayList<reviewDTO>();
    	//int startNum = (page-1)*3;
    	//int endNum = page*3;
    	//page-1*3
    	int pages = (page-1)*3;
    	String query = "SELECT b.RES_NAME,a.resNum,a.review_date,a.star_sco,a.review_content,a.review_img\n"
    			+ "FROM jjim_review a, RESTAURANT b\n"
    			+ "where a.RESNUM = b.RESNUM and user_email = ?\n"
    			+ "ORDER BY a.review_date DESC\n"
    			+ "OFFSET ? ROWS FETCH FIRST 3 ROWS ONLY";
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
		pstmt.setString(1,email);
		pstmt.setInt(2, pages);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			list.add(new reviewDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6)));
		}
    	} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;   	
    }
    
}
