package com.human.edu;

public class BDtoMember {
	String name;
	String gender;
	String mobile;
	String passcode;
	String nick;
	String birthday;
	String interest;
	
	BDtoMember(){}

	public BDtoMember(String name, String gender, String mobile, String passcode, String nick, String birthday,
			String interest) {
		super();
		this.name = name;
		this.gender = gender;
		this.mobile = mobile;
		this.passcode = passcode;
		this.nick = nick;
		this.birthday = birthday;
		this.interest = interest;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPasscode() {
		return passcode;
	}

	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}
	
}
