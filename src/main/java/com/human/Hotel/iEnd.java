package com.human.Hotel;

import java.util.ArrayList;

public interface iEnd {
	public void doAdd(int roomcode,int person,String checkin,String checkout,String name,String mobile,int totalprice);
	
	ArrayList<Roominfo> doList();
	
	ArrayList<Roominfo> doTim(String checkin,String checkout);
	
	//검색
	ArrayList<Roominfo> doSlt(String checkin,String checkout,int code);
}
