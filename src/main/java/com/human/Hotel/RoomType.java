package com.human.Hotel;

public class RoomType {
	private String typename;
	private int typecode;
	
	public RoomType() {
		
	}
	
	public RoomType(String typename, int typecode) {
		
		this.typename = typename;
		this.typecode = typecode;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public int getTypecode() {
		return typecode;
	}

	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	
	
	
	
}
