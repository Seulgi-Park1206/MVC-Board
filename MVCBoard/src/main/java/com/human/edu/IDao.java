package com.human.edu;

import java.util.ArrayList;

public interface IDao {	// CRUD 기능을 하는 것의 이름, 매개변수
	public ArrayList<BDto> listDao(); // list 페이지 실행 시 기능을 하는 메소드
	public BDto viewDao(int bId);	// 특정 게시물 조회
	public void deleteDao(int bId);
	public void modifyDao(int bId, String mTitle, String mContent);
	public void writeDao(String mWriter, String mTitle, String mContent);
}
