package com.human.Hotel;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	
	ArrayList<Roominfo>RoomList();
	
	//roomtype구하기
	ArrayList<RoomType>RoomType();
	
	public void insertlist(Roominfo rooninfo);
}
