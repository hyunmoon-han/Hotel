package com.human.Hotel;

import java.util.ArrayList;

public interface iRoom {
	//room
	ArrayList<Roominfo>RoomList();
	//roomtype구하기
	ArrayList<RoomType>RoomType();
	
	public void insertlist(Roominfo rooninfo);
}
