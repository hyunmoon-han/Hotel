package com.human.Hotel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/room",method=RequestMethod.GET)
	public String room(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
		return "room";
	}
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join(@ModelAttribute MemberList memberl,Model model) {
		model.addAttribute("memberl",memberl);
		return "member";
	}
	
	@RequestMapping("/booking")
	public String view2(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String loginid = (String) session.getAttribute("loginid");
		if (!loginid.equals("")) {
			return "booking";
		}else {
			return "redirect:/login";
		}
	}
	@RequestMapping(value="/check_user",method=RequestMethod.POST)
	public String view(HttpServletRequest shr,Model model) {
		String userid=shr.getParameter("userid");
		String passcode=shr.getParameter("userpw");
		
		HttpSession session =shr.getSession();
		session.setAttribute("loginid", userid);
		session.setAttribute("loginpw", passcode);
		return "redirect:/booking";			
	}
	
	@RequestMapping("/newbie")
	public String newbie() {
		return "newbie";
	}
//	@RequestMapping(value="/selected", method=RequestMethod.GET)
//	public String check(@RequestParam("path") String strPath,Model model) {
//		if(strPath.equals("login")) {
//			return "Login";
//		}else if(strPath.equals("newbie")) {
//			return "newbie";
//		}else {
//			return "redirect:/home";
//		}
//	}
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
