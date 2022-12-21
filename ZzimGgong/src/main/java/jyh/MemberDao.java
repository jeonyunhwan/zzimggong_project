package dao;

import dbDriver.DB;
import vo.userMemberVo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    //회원등록 Dao
    public int SignUp(userMemberVo ins) {
    	String query = "insert into user values(?,?,NULL,?,NULL,?,0,NULL)";
    	int suIdx = 0;
    	try {
    		con = DB.con();
    		con.setAutoCommit(false);
    		pstmt = con.prepareStatement(query);
    		
    		pstmt.setString(1,ins.getUserId());
    		pstmt.setString(2,ins.getPassword());
    		pstmt.setString(3,ins.getNickName());
    		pstmt.setString(4,ins.getAddress());
    		suIdx = pstmt.executeUpdate();
    		con.commit();
            pstmt.close();
            con.close();
    	}catch (SQLException e) {
    		suIdx = -1;
            try {
                con.rollback();
            }catch (SQLException e1) {
                System.out.println("rollback 에러:" + e.getMessage());
            }
            
        } catch (Exception e) {
        	suIdx = -2;
            System.out.println(e.getMessage());
        }
    	return suIdx;
    }
    
    //IDcheck
    public boolean IdCheck(String userId) {
    	String query = "select count(id) from jjim_user where id = ?";
    	boolean chid = false;
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        rs.next();
        int show = rs.getInt(1);
        if(show==1) {
        	chid = true;
        }
             
    }catch (SQLException e) {
        e.printStackTrace();   
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        DB.close(rs, pstmt, con);
        }
    	return chid;
    }
    
}
    


    

