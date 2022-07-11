package pea.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	
	//
	//
	/* 로그인 */
	//
	//
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public String login(){
		
		return "user/login";
	}
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public String login(UserVo vo,HttpServletRequest request, HttpSession session) {
		UserVo user = userService.login(vo);
		
		if(user != null) {
			
			session = request.getSession();
			
			
			// 세션에 담을 로그인 객체 생성해서 가져오기 
			UserVo login = new UserVo();
			login.setUidx(user.getUidx());
			login.setId(user.getId());
			login.setName(user.getName());
			login.setProfile(user.getProfile());
			login.setPea_super(user.getPea_super());
			
			
			session.setAttribute("login", login);
			
			
			return "redirect:/";
			
		}else {
			
			return "redirect:/user/login.do";
		}
	}
	
	@RequestMapping(value="/user/join.do", method=RequestMethod.GET)
	public String join(UserVo vo) {
		
		return "user/join";
		
	}
	@RequestMapping(value="/user/home.do")
	public String home() {
	
		
		return "redirect:/";
	}
	
	
	//
	//
	/* 로그아웃 */
	//
	//
	
	@RequestMapping(value="/user/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	
	//
	//
	/* 회원가입 */
	//
	//
	
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
	
	
	//
	//
	/* 아이디찾기 */
	//
	//
	
	@RequestMapping(value="/user/findId.do", method=RequestMethod.GET)
	public String findId() {
		
		
		return "user/findId";
	}
	
	//
	//
	/* 아이디확인 */
	//
	//
	@ResponseBody
	@RequestMapping(value="/user/idCheck.do", produces = "application/json;charset=utf8")
	public int idCheck(String id) {
		
		return userService.idCheck2(id);
	}
	
	
	//
	//
	/* 이메일인증  */
	//
	//
	
	@RequestMapping(value="/user/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("mailcheck");
		System.out.println("email"+email);
		
		return mailService.joinEmail(email);
	}
	
	//
	//
	/* 아이디 존재여부 확인 */
	//
	//
	@ResponseBody
	@RequestMapping(value="/user/idExistCheck.do", produces = "application/json;charset=utf8")
	public String idExistCheck(String name, String email, HttpServletRequest request, HttpSession session) {
		UserVo vo = new UserVo();
		vo.setName(name);
		vo.setEmail(email);
		String id = userService.idExistCheck(vo);
		session = request.getSession();
		session.setAttribute("findId", id);
		System.out.println(session.getAttribute("findId"));
		System.out.println("email"+email);
		return id;
	}
	
	
	
	
	//
	//
	/* 비밀번호 찾기  */
	//
	//
	
	@RequestMapping(value="/user/findPwd.do", method=RequestMethod.GET)
	public String findPwd() {
		
		
		return "user/findPwd";
	}
	
	
	
}
