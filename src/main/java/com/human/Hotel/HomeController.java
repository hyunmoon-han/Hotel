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
	public String addRoom(HttpServletRequest hsr) {
		
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
			jo.put("hommuch", roominfo.get(j).getHowmuch());
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
	public String view2(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String loginid = (String) session.getAttribute("loginid");
		if (loginid.equals("") ||loginid==null) {
			return "redirect:/login";
			
		}else {
			return "booking";
			
		}
	}
	
	@RequestMapping(value="/check_user",method=RequestMethod.POST)
	public String view(HttpServletRequest shr,Model model) {
		String userid=shr.getParameter("userid");
		String passcode=shr.getParameter("userpw");
		
		//DB에서 유저 확인
		HttpSession session =shr.getSession();
		session.setAttribute("loginid", userid);
		session.setAttribute("loginpw", passcode);
		return "redirect:/booking";			
	}
	
	@RequestMapping("/newbie")
	public String newbie(Model model) {
		
		return "newbie";
	}

	@RequestMapping("/login")
	public String login2() {
		return "Login";
	}
	@RequestMapping(value="/login2",method=RequestMethod.POST)
	public String login()  {
		
		return "Login";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "Login";
	}
	
}
