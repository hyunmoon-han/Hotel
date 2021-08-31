package com.human.Hotel;

public class Roominfo {
	private int roomcode; 
	private String name;
	private int type;
	private int howmany;
	private int howmuch;
	private String typename2;
	
	public Roominfo() {
		
	}

	public Roominfo(int roomcode, String name, int type, int howmany, int howmuch) {
		this.roomcode = roomcode;
		this.name = name;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
		
	}
	
	
	public Roominfo(int roomcode, String name, int type, int howmany, int howmuch,String typename2) {
		this.roomcode = roomcode;
		this.name = name;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.typename2= typename2;
	}
	
	
	public String getTypename2() {
		return typename2;
	}
	public void setTypename2(String typename2) {
		this.typename2 = typename2;
	}
	
	
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
}
