package pea.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;


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
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public String login(){
		
		return "user/login";
	}
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public String login(UserVo vo, Model model) {
		UserVo user = userService.login(vo);
		
		
		model.addAttribute("user", user);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/join.do", method=RequestMethod.GET)
	public String join(UserVo vo) {
		
		return "user/join";
		
	}
	@RequestMapping(value="/user/home.do")
	public String home() {
	
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/join.do", method=RequestMethod.POST)// throws 는 오류가 나면은 그 때 행해라는 걸로 일단 생각해라. 나중에 더  빡세게 공부해라.
	public void join(UserVo vo, HttpServletResponse response) throws IOException {
		UserVo id = userService.idCheck(vo);
		PrintWriter pw = response.getWriter();
		System.out.println(id);
		
		System.out.println(pw);
		response.setContentType("text/html;charset=utf-8");
		if(id == null) {
			int result =userService.inserUser(vo);
			if(result == 1) {
				System.out.println("회원가입 성공");
				
				pw.append("<script>alert('축하합니다.');location.href='home.do'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
				pw.flush(); //화면에 쓰는 곳이다.
				
			}else {
				System.out.println("회원가입 실패");
			}
		}else {
			
			pw.append("<script>alert('중복된 아이디입니다.');location.href='join.do'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush(); //화면에 쓰는 곳이다.
		
		}
	}
	
	@RequestMapping(value="/user/findId.do", method=RequestMethod.GET)
	public String findId() {
		
		
		return "user/findId";
	}
	
	@RequestMapping(value="/user/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("�씠硫� �씤利� �슂泥� ");
		System.out.println("�슂泥� �씠硫�:"+email);
		
		return mailService.joinEmail(email);
	}
	
	
	
	
	
}
