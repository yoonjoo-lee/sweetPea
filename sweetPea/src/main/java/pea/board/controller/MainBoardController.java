package pea.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pea.board.vo.UserVo;

@Controller
public class MainBoardController {

	@RequestMapping(value="mainboard/community.do")
	public String community() {
		return "mainboard/community";
	}
	
	@RequestMapping(value="mainboard/service.do")
	public String service() {
		return "mainboard/service";
	}
	
	@RequestMapping(value="mainboard/list.do")
	public String list() {
		return "mainboard/list";
	}
	
	@RequestMapping(value="mainboard/write.do")
	public String write(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		
//		UserVo login = (UserVo)session.getAttribute("login");
//		
//		System.out.println("login uinx"+ login.getIudx());
		
		return "mainboard/write";
	}
}
