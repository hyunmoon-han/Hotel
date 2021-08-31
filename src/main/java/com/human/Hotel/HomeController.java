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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	@ResponseBody
	@RequestMapping(value="/room/add",method=RequestMethod.GET)
	public int add(Roominfo rooninfo) {
		int result=1;
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.insertlist(rooninfo);
		
		return result;
	}
	
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
//		iRoom room=sqlSession.getMapper(iRoom.class);
//		ArrayList<Roominfo> roominfo=room.getRoomList();
//		
//		model.addAttribute("list",roominfo);
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
