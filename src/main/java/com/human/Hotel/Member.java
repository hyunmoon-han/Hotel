package com.human.Hotel;

public class Member {
	private String loginid;
	private String passcode;
	private String name;
	
	public Member() {
		
	}
	public Member(String loginid, String passcode, String name) {
	
		this.loginid = loginid;
		this.passcode = passcode;
		this.name = name;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
