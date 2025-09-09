package com.elon.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.elon.member.model.vo.Member;

public class MemberDAO {

	public int signupMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO MEMBER_TBL VALUES(?,?,?,?,?,?,'N')";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPwd());
		pstmt.setString(3, member.getMemberName());
		pstmt.setString(4, member.getPhone());
		pstmt.setString(5, member.getGender());
		pstmt.setInt(6, member.getAge());
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}

	public Member loginMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member result = null;
		String query = "SELECT * FROM MEMBER_TBL WHERE MEMBER_ID=? AND MEMBER_PW=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPwd());
		rset = pstmt.executeQuery();
		if (rset.next()) {
			String memberId = rset.getString("MEMBER_ID");
			String memberName = rset.getString("MEMBER_NAME");
			String adminYN = rset.getString("ADMIN_YN");

			result = new Member(memberId, memberName, adminYN);
		}
		rset.close();
		pstmt.close();
		conn.close();
		return result;
	}

	public String findidMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		String query = "SELECT MEMBER_ID FROM MEMBER_TBL WHERE MEMBER_NAME = ? AND MEMBER_PHONE = ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberName());
		pstmt.setString(2, member.getPhone());
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = rset.getString("MEMBER_ID");
		}
		rset.close();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public boolean checkMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		String query = "SELECT MEMBER_ID FROM MEMBER_TBL WHERE MEMBER_ID = ? AND MEMBER_NAME = ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberName());
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = true; 
		}
		rset.close();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public int updatePassword(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE MEMBER_TBL SET MEMBER_PW = ? WHERE MEMBER_ID = ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberPwd());
		pstmt.setString(2, member.getMemberId());
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}

	public List<Member> selectAllUsers(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
        List<Member> mList = new ArrayList<>();
        String query = "SELECT MEMBER_ID, MEMBER_NAME, MEMBER_PHONE, MEMBER_AGE, ADMIN_YN FROM MEMBER_TBL WHERE ADMIN_YN != 'ADMIN'";
        pstmt = conn.prepareStatement(query);
        rset = pstmt.executeQuery();
        while(rset.next()) {
            String memberId   = rset.getString("MEMBER_ID");
            String memberName   = rset.getString("MEMBER_NAME");
            String phone = rset.getString("MEMBER_PHONE");
            int age = rset.getInt("MEMBER_AGE");
            String adminYN = rset.getString("ADMIN_YN");
            Member member = new Member(memberId, memberName, phone, age, adminYN);
            mList.add(member);
        }
        rset.close();
        pstmt.close();
        return mList;
	}

	public int adminpermissions(String memberId, String adminYN, Connection conn) throws SQLException {	
		PreparedStatement pstmt = null;
        int result = 0;
        String query = "UPDATE MEMBER_TBL SET ADMIN_YN = ? WHERE MEMBER_ID = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, adminYN);
        pstmt.setString(2, memberId);
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        return result;
	}
}