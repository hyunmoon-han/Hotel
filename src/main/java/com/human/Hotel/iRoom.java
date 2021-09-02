package com.human.Hotel;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface iRoom {
	//room
	ArrayList<Roominfo>RoomList();
	//roomtype구하기
	ArrayList<RoomType>RoomType();
	public void doDeleteRoom(int roomcode);
	
	public void doAddRoom(String rname,int rtypt,int howmany,int howmuch);
	
	public void doUpdateRoom(String rname,int rtypt,int howmany,int howmuch,int roomcode);
	
	
}
