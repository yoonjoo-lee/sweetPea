package pea.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pea.board.service.UserService;
import pea.board.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	private MailSendService mailService;
	
	private String uploadFolder;
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
		String del = user.getDelyn();
		if(user != null && del.equals("N")) {
			
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
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
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
	/* 아이디 존재여부 확인(아이디찾기) */
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
	/* 아이디 존재여부 확인(비밀번호찾기) */
	//
	//
	@ResponseBody
	@RequestMapping(value="/user/pwdExistCheck.do", produces = "application/json;charset=utf8")
	public int pwdExistCheck(String id, String email) {
		UserVo vo = new UserVo();
		vo.setId(id);
		vo.setEmail(email);
		int uidx = userService.pwdExistCheck(vo);
		System.out.println(uidx);
		return uidx;
	}
	
	
	
	//
	//
	/* 비밀번호 변경  */
	//
	//
	
	@RequestMapping(value="/user/findPwd.do", method=RequestMethod.GET)
	public String findPwd() {
		return "user/findPwd";
	}
	
	@RequestMapping(value="/user/changePwd.do", method=RequestMethod.GET)
	public void changePwd(int uidx, String pwd, HttpServletResponse response) throws IOException {
		UserVo vo = new UserVo();
		vo.setUidx(uidx);
		vo.setPwd(pwd);
		
		int value = userService.changePwd(vo);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		if(value == 1) {
			pw.append("<script>location.href='home.do'</script>");
			pw.flush(); //화면에 쓰는 곳이다.
		}else {
			pw.append("<script>alert('예기치 않은 오류 발생');location.href='findPwd.do'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush(); //화면에 쓰는 곳이다.
		}
	}
	
	@RequestMapping(value="/user/myPage.do", method=RequestMethod.GET)
	public String myPage() {
		return "user/myPage";
	}
	
	@RequestMapping(value="/user/myPage-idx.do", method=RequestMethod.GET)
	public String myIdx(int uidx, Model model) {
		UserVo vo = userService.userIdx(uidx);
		
		model.addAttribute("vo",vo);
		return "user/myPage-idx";
	}
	
	@RequestMapping(value="/user/myPage-modify.do", method=RequestMethod.GET)
	public String modifyIdx(int uidx, Model model) {
		UserVo vo = userService.userIdx(uidx);
		
		model.addAttribute("vo",vo);
		return "user/myPage-modify";
	}
	
	@RequestMapping(value="/user/myPage-changePwd.do", method=RequestMethod.GET)
	public String changePwd(int uidx, Model model) {
		UserVo vo = userService.userIdx(uidx);
		
		model.addAttribute("vo",vo);
		return "user/myPage-changePwd";
	}
	
	@ResponseBody
	@RequestMapping(value="/user/pwdCheck.do", produces = "application/json;charset=utf8")
	public int pwdCheck(int uidx, String pwd) {
		UserVo vo = new UserVo();
		vo.setUidx(uidx);
		vo.setPwd(pwd);
		return userService.pwdCheck(vo);
	}
	
	@RequestMapping(value="/user/myPage-del.do", method=RequestMethod.GET)
	public String delIdCheck() {
		return "user/myPage-del";
	}
	
	@RequestMapping(value="/user/delId.do", method=RequestMethod.GET)
	public String delId(int uidx, HttpServletRequest request, HttpSession session) {
		userService.delId(uidx);
		session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/myPage-profile.do", method=RequestMethod.GET)
	public String myPage_profile() {
		return "user/myPage-profile";
	}
	
	@RequestMapping(value="/user/profile.do", method=RequestMethod.POST)
	public String profile(@RequestParam("profileImgUrl") MultipartFile multipartFile, RedirectAttributes redirectAttributes, int uidx) {
		UserVo vo = userService.userIdx(uidx);
		String imageFileName = uidx + "_" + multipartFile.getOriginalFilename();
		Path imageFilePath = Paths.get(uploadFolder + imageFileName);
		
		if(multipartFile.getSize() != 0) {
			try {
				if(vo.getProfile() != null) {
					File file = new File(uploadFolder + vo.getProfile());
					file.delete();
				}
				Files.write(imageFilePath,multipartFile.getBytes());
			}catch (Exception e) {
				e.printStackTrace();
			}
			vo.setProfile(imageFileName);
		}
		
		return "user/myPage-profile";
	}
	
}
