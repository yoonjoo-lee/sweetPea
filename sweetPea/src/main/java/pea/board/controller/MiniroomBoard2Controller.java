package pea.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pea.board.service.MiniroomBoard2Service;
import pea.board.service.MiniroomBoardService;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.UserVo;

@RequestMapping(value="/miniroomboard2")
@Controller
public class MiniroomBoard2Controller {

	@Autowired
	MiniroomBoard2Service miniroomboard2Service;
	@Autowired
	MiniroomBoardService miniroomboardService;
	
	
	@RequestMapping(value="/diary_write.do", method=RequestMethod.GET)
	public String diary_write(int uidx, int category, Model model ){

		model.addAttribute("category", category);
		return "minihome/diary-write";
	}
	
	@RequestMapping(value="/diary_write.do", method=RequestMethod.POST)
	public void diary_write(MiniroomBoardVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) throws IOException {
		System.out.println("다이어리 롸이트 포스트메소드 들어옴");
		
		session = request.getSession();
		UserVo login = (UserVo)session.getAttribute("login");
		vo.setWriter(login.getUidx()); //작성자 uidx
		MiniHomeVo mini = (MiniHomeVo)session.getAttribute("mini");
		vo.setUidx(mini.getUidx()); //미니홈피 주인 uidx
		
		System.out.println("login uidx:"+ login.getUidx());
		System.out.println("미니홈 주인 uidx:"+ mini.getUidx());
		System.out.println("시크릿 여부:"+ vo.getSecret());
		
		List<MiniroomBoardVo> category = miniroomboardService.checkCategory(mini.getUidx());
		model.addAttribute("subcategory",category);
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
		int result = miniroomboard2Service.writemini(vo);
		
		
		PrintWriter pw = response.getWriter();
		
//		pw.append("<script>history.back();history.back();</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
//		pw.flush();
//		return "minihome/diary-write.do?uidx="+login.getUidx()+"&category="+vo.getCategory()+"";
	}
	
}
