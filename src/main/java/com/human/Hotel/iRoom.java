package com.human.Hotel;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface iRoom {
	//room
	ArrayList<Roominfo>RoomList();
	//roomtype구하기
	ArrayList<RoomType>RoomType();
	//삭제
	public void doDeleteRoom(int roomcode);
	//추가
	public void doAddRoom(String rname,int rtypt,int howmany,int howmuch);
	//업데이트
	public void doUpdateRoom(String rname,int rtypt,int howmany,int howmuch,int roomcode);
	
	//검색
	ArrayList<Roominfo> RoomSlt(int code);
	
}
