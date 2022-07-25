package pea.board.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pea.board.service.MiniroomBoard2Service;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.UserVo;

@RequestMapping(value="/miniroomboard2")
@Controller
public class MiniroomBoard2Controller {

	@Autowired
	MiniroomBoard2Service miniroomboard2Service;
	
	
	@RequestMapping(value="/diary_write.do", method=RequestMethod.GET)
	public String diary_write(int uidx, int category, Model model ){

		model.addAttribute("category", category);
		return "minihome/diary-write";
	}
	
	@RequestMapping(value="/diary_write.do", method=RequestMethod.POST)
	public String diary_write(MiniroomBoardVo vo, HttpServletRequest request, HttpSession session) throws UnknownHostException {
		session = request.getSession();
		UserVo login = (UserVo)session.getAttribute("login");
		vo.setWriter(login.getUidx());
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
		return "";
	}
	
}
