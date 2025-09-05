package com.elon.member.model.vo;

public class Member {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String gender;
	private int age;
	private String phone;
	private String adminYN;

	public Member() {
	}

	public Member(String memberId, String memberPwd) {
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}

	public Member(String memberId, String memberName, String adminYN) {
		this.memberId = memberId;
		this.memberName = memberName;
		this.adminYN = adminYN;
	}

	public Member(String memberId, String memberPwd, String memberName, String phone, String gender, int age) {
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
	}

	public Member(String memberId, String memberPwd, String memberName, String phone, String gender, int age,
			String adminYN) {
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
		this.adminYN = adminYN;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdmin() {
		return adminYN;
	}

	public void setAdmin(String adminYN) {
		this.adminYN = adminYN;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", gender="
				+ gender + ", age=" + age + ", phone=" + phone + ", adminYN=" + adminYN + "]";
	}
}