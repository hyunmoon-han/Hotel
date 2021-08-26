package com.human.Hotel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join(@ModelAttribute MemberList memberl,Model model) {
		model.addAttribute("memberl",memberl);
		return "member";
	}
	@RequestMapping(value="/viewinfo",method=RequestMethod.GET)
	public String view(@RequestParam("userid")String ui,Model model) {
		model.addAttribute("userid",ui);
		//model.addAttribute("userpw",userpw);
		return "viewinfo";
	}
	
	@RequestMapping(value="/selected", method=RequestMethod.GET)
	public String check(@RequestParam("path") String strPath,Model model) {
		if(strPath.equals("login")) {
			return "Login";
		}else if(strPath.equals("newbie")) {
			return "newbie";
		}else {
			return "redirect:/home";
		}
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
