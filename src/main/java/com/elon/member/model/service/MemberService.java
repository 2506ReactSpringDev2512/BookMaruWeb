package com.elon.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.elon.member.common.BOOKTemplate;
import com.elon.member.model.dao.MemberDAO;
import com.elon.member.model.vo.Member;

public class MemberService {
	private BOOKTemplate bookTemplate;
	private MemberDAO mDao;

	public MemberService() {
		bookTemplate = BOOKTemplate.getInstance();
		mDao = new MemberDAO();
	}

	public int signup(Member member) {
		int result = 0;
		try {
			Connection conn = bookTemplate.getConnection();
			result = mDao.signupMember(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Member login(Member member) {
		Member result = null;
		try {
			Connection conn = bookTemplate.getConnection();
			result = mDao.loginMember(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public String findid(Member member) {
		String mId = null;
		try {
			Connection conn = bookTemplate.getConnection();
			mId = mDao.findidMember(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mId;
	}
	
	public boolean check(Member member) {
		boolean result = false;
		try {
			Connection conn = bookTemplate.getConnection();
			result = mDao.checkMember(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean changePassword(Member member) {
		boolean result = false;
		try {
			Connection conn = bookTemplate.getConnection();
			int updateResult = mDao.updatePassword(member, conn);
			if(updateResult > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Member> selectAllUsers() {
		List<Member> mList = null;
		try {
            Connection conn = bookTemplate.getConnection();
            mList = mDao.selectAllUsers(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mList;
	}

	public int adminpermissions(String memberId, String adminYN) {
		int result = 0;
		try {
			Connection conn = bookTemplate.getConnection();
			result = mDao.adminpermissions(memberId, adminYN, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}