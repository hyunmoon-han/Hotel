package com.human.Hotel;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	
	//booking 작업
	
	@ResponseBody
	@RequestMapping(value="/tim",method=RequestMethod.POST,produces =
			  "application/text; charset=utf8")
	public String tim(HttpServletRequest hsr) {
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		iEnd room=sqlSession.getMapper(iEnd.class);
		System.out.println("씨:"+checkin+","+checkout);
		
		ArrayList<Roominfo>ck=room.doTim(checkin, checkout);
		JSONArray ka=new JSONArray();
		for(int i=0;i<ck.size();i++) {
			JSONObject ko=new JSONObject();
			ko.put("roomcode",ck.get(i).getRoomcode());
			  ko.put("bookcode", ck.get(i).getBookcode());
			  ko.put("roomname", ck.get(i).getRoomname()); 
			  ko.put("typename",ck.get(i).getTypename()); 
			  ko.put("person", ck.get(i).getPerson());
			  ko.put("howmany", ck.get(i).getHowmany()); 
			  ko.put("checkin",ck.get(i).getCheckin()); 
			  ko.put("checkout", ck.get(i).getCheckout());
			  ko.put("name", ck.get(i).getName()); 
			  ko.put("mobile",ck.get(i).getMobile()); 
			  ko.put("type", ck.get(i).getType());
			  ko.put("totalprice", ck.get(i).getTotalprice());
			  ko.put("howmuch", ck.get(i).getHowmuch());
			  ka.add(ko);
		}
		return ka.toString();
	}
	  @ResponseBody
	  @RequestMapping(value="/pick",method=RequestMethod.POST ,produces =
	  "application/text; charset=utf8") 
	  public String pick() { 
		  iEnd room=sqlSession.getMapper(iEnd.class); 
		  ArrayList<Roominfo> list=room.doList(); 
		  JSONArray ka=new JSONArray(); 
		  for(int i=0;i<list.size();i++) 
		  { 
			  JSONObject ko=new JSONObject();
			  ko.put("roomcode",list.get(i).getRoomcode());
			  ko.put("bookcode", list.get(i).getBookcode());
			  ko.put("roomname", list.get(i).getRoomname()); 
			  ko.put("typename",list.get(i).getTypename()); 
			  ko.put("person", list.get(i).getPerson());
			  ko.put("howmany", list.get(i).getHowmany()); 
			  ko.put("checkin",list.get(i).getCheckin()); 
			  ko.put("checkout", list.get(i).getCheckout());
			  ko.put("name", list.get(i).getName()); 
			  ko.put("mobile",list.get(i).getMobile()); 
			  ko.put("type", list.get(i).getType());
			  ko.put("totalprice", list.get(i).getTotalprice());
			  ko.put("howmuch", list.get(i).getHowmuch());
			  ka.add(ko);
			  //System.out.println(ka);
  		} 
		  return ka.toString(); 
	  }
	 
	//예약하기
	@ResponseBody
	@RequestMapping(value="/reservation",method=RequestMethod.POST
	,produces = "application/text; charset=utf8")
	public String reservation(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		int person=Integer.parseInt(hsr.getParameter("person"));
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		String name=hsr.getParameter("name");
		String mobile=hsr.getParameter("mobile");
		int price=Integer.parseInt(hsr.getParameter("price"));
		System.out.println("여기야:"+roomcode+','+person+','+checkin+','+checkout+','+name+','+mobile+','+price);
		iEnd room=sqlSession.getMapper(iEnd.class);
		room.doAdd(roomcode, person, checkin, checkout, name, mobile,price);
		
		//예약 list
		return "success";
	}
	//검색작업
	@ResponseBody
	@RequestMapping(value="/slt",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String slt(HttpServletRequest hsr) {
		int code=Integer.parseInt(hsr.getParameter("code"));
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		System.out.println("코드:"+code+","+checkin+","+checkout);
		iEnd room=sqlSession.getMapper(iEnd.class);
		ArrayList<Roominfo>ac =room.doSlt(checkin, checkout, code);
		JSONArray ka=new JSONArray();
		for(int i=0;i<ac.size();i++) {
			JSONObject ko=new JSONObject();
			ko.put("roomname", ac.get(i).getRoomname());
			ko.put("typename",ac.get(i).getTypename());
			ko.put("roomcode",ac.get(i).getRoomcode());
			ko.put("roomtype",ac.get(i).getType());
			ko.put("howmany",ac.get(i).getHowmany());
			ko.put("howmuch",ac.get(i).getHowmuch());
			ka.add(ko);
		}
		return ka.toString();
	}
	
	
	
	//room작업
	@ResponseBody
	@RequestMapping(value="/updateRoom",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String updateRoom(HttpServletRequest hsr) {	
		iRoom room=sqlSession.getMapper(iRoom.class);
		String rname=hsr.getParameter("roomname");
		int rtypt=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		room.doUpdateRoom(rname, rtypt, howmany, howmuch, roomcode);
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value="/addRoom",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String addRoom(HttpServletRequest hsr,Roominfo roominfo) {
		String rname=hsr.getParameter("roomname");
		int rtypt=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		System.out.println("찾아"+rname+","+ rtypt+","+ howmany+","+ howmuch);
		iRoom room=sqlSession.getMapper(iRoom.class);
		
		room.doAddRoom(rname,rtypt,howmany,howmuch);
		return "ok";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deleteRoom",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room =sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/RoomType2",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String RoomType() {
		iRoom room=sqlSession.getMapper(iRoom.class);
//		ArrayList<RoomType> roomtype=room.RoomType();
//		JSONArray ka=new JSONArray();
//		for(int i=0;i<roomtype.size();i++) {
//			JSONObject ko=new JSONObject();
//			ko.put("typename", roomtype.get(i).getTypename());
//			ko.put("typecode", roomtype.get(i).getTypecode());
//			ka.add(ko);
//		}
		ArrayList<Roominfo> roominfo=room.RoomList();
		JSONArray ja=new JSONArray();
		for(int j=0;j<roominfo.size();j++) {
			JSONObject jo=new JSONObject();
			jo.put("roomcode",roominfo.get(j).getRoomcode());
			jo.put("roomname",roominfo.get(j).getRoomname());
			jo.put("typename", roominfo.get(j).getTypename());
			jo.put("howmany",roominfo.get(j).getHowmany());
			jo.put("howmuch", roominfo.get(j).getHowmuch());
			jo.put("type", roominfo.get(j).getType());
			ja.add(jo);
		}
		
		return ja.toString();
	}
	
//	@RequestMapping(value="/RoomType2",method=RequestMethod.POST ,produces = "application/text; charset=utf8")
//	@ResponseBody
//	public String RoomList2 (HttpServletRequest hsr) {
////		iRoom type=sqlSession.getMapper(iRoom.class);
////		ArrayList<RoomType>roomtype=type.RoomType();
////		//찾아진 데이터로 JSONArray만들기
////		JSONArray ja=new JSONArray();
////		for(int i=0;i<roomtype.size();i++) {
////			JSONObject jo = new JSONObject();
////			jo.put("typecode", roomtype.get(i).getTypecode());
////			jo.put("typename", roomtype.get(i).getTypename());
////			ja.add(jo);
////		}
//		iRoom type=sqlSession.getMapper(iRoom.class);
//		ArrayList<Roominfo>roominfo=type.RoomList();
//		//찾아진 데이터로 JSONArray만들기
//		JSONArray ja=new JSONArray();
//		for(int i=0;i<roominfo.size();i++) {
//			JSONObject jo = new JSONObject();
//			jo.put("roomname", roominfo.get(i).getRoomname());
//			ja.add(jo);
//		}
//		System.out.println(ja.toString());
//		return ja.toString();
//	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/room",method=RequestMethod.GET)
	public String room(HttpServletRequest hsr,Model model) {
		HttpSession session=hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
		//여기서 interface호출 하고 결과를 room.jsp에 전달	
		iRoom type=sqlSession.getMapper(iRoom.class);
		ArrayList<RoomType>roomlist=type.RoomType();
		model.addAttribute("type",roomlist);
		
		
		//내꺼
		iRoom room =sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo>roominfo=room.RoomList();
		model.addAttribute("list",roominfo);
		
		return "room";
	}
//	@RequestMapping(value="/join",method=RequestMethod.GET)
//	public String join(@ModelAttribute MemberList memberl,Model model) {
//		model.addAttribute("memberl",memberl);
//		return "member";
//	}
	
	@RequestMapping("/booking")
	public String view2(HttpServletRequest hsr,Model model) {
		HttpSession session=hsr.getSession();
		String loginid = (String) session.getAttribute("loginid");
		if (loginid.equals("") ||loginid==null) {
			return "redirect:/login";
			
		}else {
			//roomtype 호출
			iRoom room=sqlSession.getMapper(iRoom.class);
			ArrayList<RoomType> type=room.RoomType();
			model.addAttribute("roomtype",type);
			//room list호출
			ArrayList<Roominfo>info=room.RoomList();
			model.addAttribute("list",info);
			return "booking";
			
		}
	}
//	@ResponseBody
//	@RequestMapping(value="/check",method=RequestMethod.POST,produces = "application/text; charset=utf8")
//	public String check(HttpServletRequest hsr) {
//		String loginid=hsr.getParameter("loginid");
//		String passcode=hsr.getParameter("passcode");
//		System.out.println("확인:"+loginid+','+passcode);
//		iMember room=sqlSession.getMapper(iMember.class);
//		
//		ArrayList<Member>a=room.doCheckUser(loginid, passcode);
//		JSONArray ka=new JSONArray();
//		for(int i=0;i<a.size();i++) {
//			JSONObject ko=new JSONObject();
//			ko.put("al", a.get(i).getLoginid());
//			ko.put("bl", a.get(i).getName());
//			ko.put("cl", a.get(i).getPasscode());
//			ka.add(ko);
//		}
//		return ka.toString();
//	}
	
	@RequestMapping(value="/check_user",method=RequestMethod.POST)
	public String view(HttpServletRequest shr,Model model) {
		String userid=shr.getParameter("userid");
		String passcode=shr.getParameter("userpw");
		
		iMember member=sqlSession.getMapper(iMember.class);
		int n=member.doCheckUser(userid, passcode);
		if(n>0) {
			HttpSession session =shr.getSession();
			session.setAttribute("loginid", userid);
			return "redirect:/booking";			
		}else {
			model.addAttribute("ac","0");
			return "Login";
		}
	}
	
	@RequestMapping("/newbie")
	public String newbie(Model model) {
		
		return "newbie";
	}

	@RequestMapping("/login")
	public String login2() {
		return "Login";
	}
	@RequestMapping(value="/signin",method=RequestMethod.POST)
	public String doSignin(HttpServletRequest hsr)  {
		String name=hsr.getParameter("name");
		String userid=hsr.getParameter("userid");
		String pw=hsr.getParameter("pw");
		iMember room=sqlSession.getMapper(iMember.class);
		room.doSignin(name, userid, pw);
		return "redirect:/";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "Login";
	}
	
}
