package com.human.edu;

public interface IDaoMember {
	public int checkMember(String mobile, String pwd);
	public void addMember(String name, String gender, String mobile, String passcode, String nick, String birthday, String interest);
}
