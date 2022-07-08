package pea.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	@RequestMapping(value="mainboard/home.do")
	public String home() {
		
		return "redirect:/";
	}
	
	@RequestMapping(value="mainboard/gotowrite.do")
	public String gotowrite(int uidx) {
		return "mainboard/write";
	}
	
	@RequestMapping(value="mainboard/write.do")
	public void write(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		session = request.getSession();
		PrintWriter pw = response.getWriter();
		
		UserVo login = (UserVo)session.getAttribute("login");
		if (login==null) {
			pw.append("<script>alert('GO TO LOGIN .');location.href='home.do'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush();
		}else {
			pw.append("<script>location.href='gotowrite.do?uidx="+login.getUidx()+"';</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush();
		}
		System.out.println("login uinx"+ login.getUidx());
		
		//return "mainboard/write";
	}
}
