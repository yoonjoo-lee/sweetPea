package pea.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.UserService;
import pea.board.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	private MailSendService mailService;
	
	// 로그인 페이지 이동
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public String login(){
		
		return "user/login";
	}
	
	// 로그인 액션
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public String login(UserVo vo, Model model) {
		UserVo user = userService.login(vo);
		
		
		model.addAttribute("user", user);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/findId.do", method=RequestMethod.GET)
	public String findId() {
		
		
		return "user/findId";
	}
	
	@RequestMapping(value="/user/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이멜 인증 요청 ");
		System.out.println("요청 이멜:"+email);
		
		return mailService.joinEmail(email);
	}
}
