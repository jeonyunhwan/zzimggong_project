package dao;

import dbDriver.DB;
import vo.userMember;
import java.util.ArrayList;
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
    
    //일반회원등록 Dao
    public int SignUp(userMember ins) {
    	String query = "insert into jjim_user values(?,?,0,?,NULL,?,0,0)";
    	int suIdx = 0;
    	try {
    		con = DB.con();
    		con.setAutoCommit(false);
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1,ins.getEmail());
    		pstmt.setString(2,ins.getPw());
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
    // 카카오 signUp 
    
    public int kakaoSignUp(userMember ins) {
    	String query = "insert into jjim_user values(?,NULL,1,?,NULL,NULL,0,1)";
    	int suIdx = 0;
    	try {
    		con = DB.con();
    		con.setAutoCommit(false);
    		pstmt = con.prepareStatement(query);	
    		pstmt.setString(1,ins.getEmail());
    		pstmt.setString(2,ins.getNickName());
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
    public int naverSignUp(userMember ins) {
    	String query = "insert into jjim_user values(?,NULL,1,?,NULL,NULL,0,2)";
    	int suIdx = 0;
    	try {
    		con = DB.con();
    		con.setAutoCommit(false);
    		pstmt = con.prepareStatement(query);	
    		pstmt.setString(1,ins.getEmail());
    		pstmt.setString(2,ins.getNickName());
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
    
    public int kakaoTokenInsert(String userEmail,String id) {
		int a;
		try {
			String query = "insert into access_Token values(?,null,?)";
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,userEmail);
			pstmt.setString(2,id);
			rs = pstmt.executeQuery();
			a = pstmt.executeUpdate();
    		con.commit();
            pstmt.close();
            con.close();
		} catch (SQLException e) {
			a = -1;
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			a = -1;
		} finally {
			DB.close(rs, pstmt, con);
		}
		return a;
	}
    public int naverTokenInsert(String userEmail,String id) {
		int a;
		try {
			String query = "insert into access_Token values(?,?,NULL)";
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,userEmail);
			pstmt.setString(2,id);
			rs = pstmt.executeQuery();
			a = pstmt.executeUpdate();
    		con.commit();
            pstmt.close();
            con.close();
		} catch (SQLException e) {
			a = -1;
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			a = -1;
		} finally {
			DB.close(rs, pstmt, con);
		}
		return a;
	}
    
    //로그인 
	public int loginCheck(String email, String userPass) {
		try {
			String query = "select user_pw from jjim_user where user_email = ?";
			con = DB.con();

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPass)) {
					return 1;
				} else {
					return 0;
				}		
			}
		return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return -2;

	}
	//세션 닉
	public userMember sessionNick(userMember ins) {
		userMember userInfo = null;
		try {
			String query = "select user_email,emailAuth,NICKNAME,no_show from jjim_user where user_email = ?";
			con = DB.con();

			pstmt = con.prepareStatement(query);
			pstmt.setString(1,ins.getEmail());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userInfo = new userMember(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getInt(4));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return userInfo;
	}
     

    
    //IDcheck
    public String IdCheck(String useremail) {
    	String result = "";
    	String email = "";
    	int authNum=0;
    	String query = "select user_email,idauth from jjim_user where user_email = ?";
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
        pstmt.setString(1, useremail);
        rs = pstmt.executeQuery();
        while(rs.next()) {
        	email = rs.getString(1);
        	authNum = rs.getInt(2);
        } 
        if(email.equals(useremail)&& authNum==1) {
			result = "kakao_auth";
	    }else if(email.equals(useremail)&& authNum==2) {
			result = "naver_auth";
	    }else if(email.equals(useremail)&& authNum==0) {
			result = "zzim_auth"; 
	    }else {
	    	result="no_auth";
	    }
        
             
    }catch (SQLException e) {
        e.printStackTrace();   
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        DB.close(rs, pstmt, con);
        }
    	return result;
    }
    
    
    public String SnsId(String userId) {
    	String query = "select id from jjim_user where id = ?";
    	String id = "";
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        if(rs.next()) {
        id = rs.getString(1);
        };
             
    }catch (SQLException e) {
        e.printStackTrace();   
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        DB.close(rs, pstmt, con);
        }
    	return id;
    }
    
    
}
    


    

