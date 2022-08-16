package pea.board.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.MiniroomBoardService;
import pea.board.vo.FriendsVo;
import pea.board.vo.ItemVo;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.PagingVo;
import pea.board.vo.SearchVo;
import pea.board.vo.UserVo;

@RequestMapping(value="/mini")
@Controller
public class MiniroomBoardController {
	
	@Autowired
	MiniroomBoardService miniroomBoardService;
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(int uidx,HttpServletRequest request, HttpSession session, Model model){
		
		MiniHomeVo vo = miniroomBoardService.joinMiniHome(uidx);
		session = request.getSession();
		
		UserVo login = (UserVo)	session.getAttribute("login");
		
		MiniHomeVo myMini =miniroomBoardService.myMiniStyle(uidx);
		session.setAttribute("myMini", myMini);
		
		List<ItemVo> miniroom = miniroomBoardService.myMiniroom(uidx);
		session.setAttribute("miniroom", miniroom);
		
		if(login != null) {
			int bfidx = login.getUidx();
			FriendsVo vo_ = new FriendsVo();
			vo_.setUidx(uidx);
			vo_.setBfidx(bfidx);
			String checkFriends = miniroomBoardService.checkFriends(vo_);
			session.setAttribute("checkFr", checkFriends);
		}
		session.setAttribute("mini", vo);
    
		String device = (String) session.getAttribute("device");
		if(device == "MOBILE") {
			return "minihome/main-m";
		} else {
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
	
	@RequestMapping(value="/photoAlbum.do", method=RequestMethod.GET)
	public String iframe_photoAlbum(int uidx, Model model) {
		List<MiniroomBoardVo> category = miniroomBoardService.checkCategory(uidx);
      
		model.addAttribute("category",category);
		return "minihome/photoAlbum";
	}
	
	/* 미니홈피 - 관리자 */
	@RequestMapping(value="/mini-option.do", method=RequestMethod.GET)
	public String minihomeOption(int uidx, Model model) {
		String check = miniroomBoardService.friendsCheck(uidx);
		if(check == null) {
			model.addAttribute("newFriends","N");
		}else {
			model.addAttribute("newFriends","Y");
		}
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
	
	/* 미니홈피 - 친구신청 목록 */
	@RequestMapping(value="/friendsCheckList.do", method=RequestMethod.GET)
	public String friendsCheckList(int uidx, Model model, SearchVo searchVo, PagingVo vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="acceptNowPage", required=false)String acceptNowPage) {
		
		String cntPerPage = "5";
		if (nowPage == null) {nowPage = "1";}
		if (acceptNowPage == null) {acceptNowPage = "1";}
		
		int checkTotal = miniroomBoardService.friendsCheckList_count(uidx);
		int acceptTotal = miniroomBoardService.friendsAcceptList_count(uidx);
		vo = new PagingVo(checkTotal, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		PagingVo acceptVo = new PagingVo(acceptTotal, Integer.parseInt(acceptNowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("checkPaging", vo);
		model.addAttribute("acceptPaging",acceptVo);
		vo.setUidx(uidx);
		acceptVo.setUidx(uidx);
		
		List<FriendsVo> checkList = miniroomBoardService.friendsCheckList(vo);
		List<FriendsVo> acceptList = miniroomBoardService.friendsAcceptList(acceptVo);
		
		model.addAttribute("checkSearchVo", vo);
		model.addAttribute("acceptSearchVo", acceptVo);
		model.addAttribute("checkList",checkList);
		model.addAttribute("acceptList",acceptList);
		
		return "minihome/option-friendsCheck";
	}
	
	/* 미니홈피 - 친구추가 승낙 */
	@ResponseBody
	@RequestMapping(value="/acceptFriends.do", produces = "application/json;charset=utf8")
	public int acceptFriends(int uidx,int bfidx) {
		FriendsVo vo = new FriendsVo();
		vo.setUidx(uidx);
		vo.setBfidx(bfidx);
		miniroomBoardService.acceptFriends(vo);
		String result = miniroomBoardService.friendsCheck(uidx);
		if(result == null) {
			return 0;
		}else return 1; 
	}
	
	/* 미니홈피 - 친구추가 거절 */
	@ResponseBody
	@RequestMapping(value="/refuseFriends.do", produces = "application/json;charset=utf8")
	public int refuseFriends(int uidx,int bfidx) {
		FriendsVo vo = new FriendsVo();
		vo.setUidx(uidx);
		vo.setBfidx(bfidx);
		
		return miniroomBoardService.refuseFriends(vo);
	}
	
	/* 미니홈피 - 친구신청 취소 */
	@ResponseBody
	@RequestMapping(value="/cancelFriends.do", produces = "application/json;charset=utf8")
	public int cancelFriends(int uidx,int bfidx) {
		FriendsVo vo = new FriendsVo();
		vo.setUidx(uidx);
		vo.setBfidx(bfidx);
		
		return miniroomBoardService.cancelFriends(vo);
	}
	
	/* 미니홈피 - 관리 - 친구관리 - 친구목록 */
	@RequestMapping(value="/friendsList.do", method=RequestMethod.GET)
	public String friendsList(int uidx, Model model) {
		List<FriendsVo> list = miniroomBoardService.friendsAllList(uidx);
			model.addAttribute("list", list);
		return "minihome/option-friendsList";
	}
	
	/* 미니홈피 - 관리 - 친구관리 - 친구목록 - 친구삭제 */
	@ResponseBody
	@RequestMapping(value="/delFriends.do", produces = "application/json;charset=utf8")
	public void delFriends(int uidx,int bfidx) {
		FriendsVo vo = new FriendsVo();
		vo.setUidx(uidx);
		vo.setBfidx(bfidx);
		miniroomBoardService.delFriends(vo);
	}
	
	/* 미니홈피 - 관리 - 친구관리 - 친구목록 - 친구명 변경 */
	@ResponseBody
	@RequestMapping(value="/changeFriends.do", produces = "application/json;charset=utf8")
	public int changeFriends(HttpServletRequest request) {
		String uName = request.getParameter("uname");
		String bfName = request.getParameter("bfname");
		int uidx = Integer.parseInt(request.getParameter("uidx")); 
		int bfidx = Integer.parseInt(request.getParameter("bfidx"));
		FriendsVo vo = new FriendsVo();
		vo.setUname(uName);
		vo.setBfname(bfName);
		vo.setUidx(uidx);
		vo.setBfidx(bfidx);
		
		int result = miniroomBoardService.changeFriends(vo);
		if(result >= 1) {
			return 1;
		}
		else return 0;
	}
	
	/* 미니홈피 - 관리 - 친구관리 - 친구목록 - 친구검색 */
	@ResponseBody
	@RequestMapping(value="/searchFriends.do", produces = "application/json;charset=utf8")
	public Object searchFriends(String name, int uidx, Model model) {
		FriendsVo vo = new FriendsVo();
		vo.setUidx(uidx);
		vo.setName(name);
		System.out.println(name);
		List<FriendsVo> list = miniroomBoardService.searchFriends(vo);
		Map<String, Object> retVal = new HashMap<String, Object>();
	        
	        retVal.put("list2", list);
	        retVal.put("code", "OK");
	        
	        return retVal;
		
	}
}
