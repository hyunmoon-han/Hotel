package com.human.Hotel;

import java.util.ArrayList;

public interface iEnd {
	//예약 추가하기
	public void doAdd(int roomcode,int person,String checkin,String checkout,String name,String mobile,int totalprice);
	//예약 정보 수정하기
	public void doUpdate(int person,String name,String mobile,int bookcode);
	//예약 정보 삭제 처리하기
	public void doDelete(int bookcode);
	//예약중인 테이블검색
	ArrayList<Roominfo> doTim(String checkin,String checkout,int type);
	//예약가능한 테이블 검색
	ArrayList<Roominfo> doSlt(String checkin,String checkout,int type);
}
