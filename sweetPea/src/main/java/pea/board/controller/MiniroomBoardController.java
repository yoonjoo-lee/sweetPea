package pea.board.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.MiniroomBoardService;
import pea.board.vo.FriendsVo;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.UserVo;

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
		
		UserVo login = (UserVo)	session.getAttribute("login");
		
		if(login != null) {
			int bfidx = login.getUidx();
			FriendsVo vo_ = new FriendsVo();
			vo_.setUidx(uidx);
			vo_.setBfidx(bfidx);
			String checkFriends = miniroomBoardService.checkFriends(vo_);
			session.setAttribute("checkFr", checkFriends);
		}
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
	public String iframe_diary(int uidx, Model model) {
		List<MiniroomBoardVo> category = miniroomBoardService.checkCategory(uidx);
		
		model.addAttribute("category",category);
		return "minihome/diary";
	}
	
	@RequestMapping(value="/photoAlbum.do", method=RequestMethod.GET)
	public String iframe_photoAlbum(int uidx, Model model) {
		List<MiniroomBoardVo> category = miniroomBoardService.checkCategory(uidx);
		
		model.addAttribute("category",category);
		return "minihome/photoAlbum";
	}
	
	@RequestMapping(value="/diary-write.do", method=RequestMethod.GET)
	public String diaryWrite(int uidx, Model model) {
		List<MiniroomBoardVo> category = miniroomBoardService.checkCategory(uidx);
		model.addAttribute("category",category);
		
		return "minihome/diary-write";
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
	
	@ResponseBody
	@RequestMapping(value="/changeLeftBoard.do", produces = "application/json;charset=utf8")
	public int changeLeftBoard(HttpServletRequest request) {
		String h1 = request.getParameter("h1");
		int uidx = Integer.parseInt(request.getParameter("uidx"));
		MiniHomeVo vo = new MiniHomeVo();
		vo.setH1(h1);
		vo.setUidx(uidx);
		int result = miniroomBoardService.changeLeftBoard(vo);
		if(result == 1) {
			return 1;
		}
		else return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="/delCategory.do", produces = "application/json;charset=utf8")
	public int delCategory(HttpServletRequest request) {
		String subcategory = request.getParameter("subcategory");
		int uidx = Integer.parseInt(request.getParameter("uidx"));
		MiniroomBoardVo vo = new MiniroomBoardVo();
		vo.setSubcategory(subcategory);
		vo.setUidx(uidx);
		int result = miniroomBoardService.delCategory(vo);
		if(result >= 1) {
			return 1;
		}
		else return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="/plusCategory.do", produces = "application/json;charset=utf8")
	public int plusCategory(HttpServletRequest request) {
		String subcategory = request.getParameter("subcategory");
		int uidx = Integer.parseInt(request.getParameter("uidx"));
		MiniroomBoardVo vo = new MiniroomBoardVo();
		vo.setSubcategory(subcategory);
		vo.setUidx(uidx);
		int result = miniroomBoardService.plusCategory(vo);
		if(result >= 1) {
			return 1;
		}
		else return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="/changeCategory.do", produces = "application/json;charset=utf8")
	public int changeCategory(HttpServletRequest request) {
		String subcategory = request.getParameter("subcategory");
		String beforeSubcategory = request.getParameter("beforeSubcategory");
		int uidx = Integer.parseInt(request.getParameter("uidx"));
		MiniroomBoardVo vo = new MiniroomBoardVo();
		vo.setSubcategory(subcategory);
		vo.setUidx(uidx);
		vo.setContent(beforeSubcategory);
		int result = miniroomBoardService.changeCategory(vo);
		if(result >= 1) {
			return 1;
		}
		else return 0;
	}
	
	/* 미니홈피 - 관리자 */
	@RequestMapping(value="/mini-option.do", method=RequestMethod.GET)
	public String minihomeOption(int uidx, Model model) {
		List<MiniroomBoardVo> category = miniroomBoardService.checkCategory(uidx);
		model.addAttribute("category",category);
		
		return "minihome/option";
	}
	
	/* 미니홈피 - 관리자 - 내정보 */
	@RequestMapping(value="/option-idx.do", method=RequestMethod.GET)
	public String option_idx(int uidx, Model model) {
		List<MiniroomBoardVo> category = miniroomBoardService.checkCategory(uidx);
		model.addAttribute("category",category);
		
		return "minihome/option-idx";
	}
	
	/* 미니홈피 - 친구추가 */
	@ResponseBody
	@RequestMapping(value="/addFriends.do", produces = "application/json;charset=utf8")
	public int addFriends(HttpServletRequest request) {
		String uName = request.getParameter("uname");
		String bfName = request.getParameter("bfname");
		int uidx = Integer.parseInt(request.getParameter("uidx")); 
		int bfidx = Integer.parseInt(request.getParameter("bfidx"));
		FriendsVo vo = new FriendsVo();
		vo.setUname(uName);
		vo.setBfname(bfName);
		vo.setUidx(uidx);
		vo.setBfidx(bfidx);
		
		int result = miniroomBoardService.addFriends(vo);
		if(result >= 1) {
			return 1;
		}
		else return 0;
	}
	
}
