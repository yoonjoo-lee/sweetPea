package pea.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.MiniroomBoardService;
import pea.board.vo.MiniHomeVo;

@RequestMapping(value="/mini")
@Controller
public class MiniroomBoardController {
	
	@Autowired
	MiniroomBoardService miniroomBoardService;
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(int uidx,HttpServletRequest request, HttpSession session, Model model){

		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian"
		                          +"|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		
		MiniHomeVo vo = miniroomBoardService.joinMiniHome(uidx);
		session = request.getSession();
		session.setAttribute("mini", vo);
		if (mobile1 || mobile2) {
			model.addAttribute("device", "MOBILE");
		    return "minihome/main";
		} else {
			model.addAttribute("device", "PC");
			return "minihome/main";
		}
	}
	
	@RequestMapping(value="/mini-home.do", method=RequestMethod.GET)
	public String iframe_home() {
		return "minihome/home";
	}
	
	@RequestMapping(value="/mini-diary.do", method=RequestMethod.GET)
	public String iframe_diary() {
		return "minihome/diary";
	}
	
	@ResponseBody
	@RequestMapping(value="/changeHeader.do", produces = "application/json;charset=utf8")
	public int changeHeader(HttpServletRequest request) {
		String h2 = request.getParameter("h2");
		int uidx = Integer.parseInt(request.getParameter("uidx"));
		MiniHomeVo vo = new MiniHomeVo();
		vo.setH2(h2);
		vo.setUidx(uidx);
		int result = miniroomBoardService.changeHeader(vo);
		if(result == 1) {
			return 1;
		}
		else return 0;
	}
}
