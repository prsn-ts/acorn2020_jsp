package com.gura.spring04.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.member.dao.MemberDao;
import com.gura.spring04.member.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired //@Autowired를 하면 dao가 필요한 시점에 핵심 의존 객체를 주입 받는다.(Dependency Injection)
	private MemberDao dao;

	//회원 정보 추가 요청 처리
	@RequestMapping("/member/insert")
	public ModelAndView insert(MemberDto dto) {
		
		return null;
	}
}
