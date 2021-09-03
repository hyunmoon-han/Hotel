package com.human.Hotel;

import java.util.ArrayList;

public interface iMember {
	//회원가입
		public void doSignin(String name,String userid,String pw);
		//로그인 아이디 조회
		int doCheckUser(String loginid,String passcode);
}
