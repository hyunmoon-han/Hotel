package com.human.Hotel;

public class Roominfo {
	private int roomcode; 
	private String roomname;
	private String typename;
	private int type;
	private int howmany;
	private int howmuch;
	
	private int bookcode;
	private int person;
	private String checkin;
	private String checkout;
	private String name;
	private String mobile;
	private int totalprice;
	
	public Roominfo() {
		
	}

	public Roominfo(int roomcode, String roomname, String typename, int type, int howmany, int howmuch, int bookcode,
			int person, String checkin, String checkout, String name, String mobile,int totalprice) {
		this.roomcode = roomcode;
		this.roomname = roomname;
		this.typename = typename;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.bookcode = bookcode;
		this.person = person;
		this.checkin = checkin;
		this.checkout = checkout;
		this.name = name;
		this.mobile = mobile;
		this.totalprice = totalprice;
	}

	

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getRoomcode() {
		return roomcode;
	}

	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
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

	public int getBookcode() {
		return bookcode;
	}

	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

//	public Roominfo(int roomcode, String roomname,int type, String typename, int howmany, int howmuch) {
//		super();
//		this.roomcode = roomcode;
//		this.roomname = roomname;
//		this.typename = typename;
//		this.howmany = howmany;
//		this.howmuch = howmuch;
//		this.type=type;
//	}

	

	
}
