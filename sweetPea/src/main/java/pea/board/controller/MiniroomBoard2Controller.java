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
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.MiniroomBoard2Service;
import pea.board.service.MiniroomBoardService;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.UserVo;

@RequestMapping(value = "/miniroomboard2")
@Controller
public class MiniroomBoard2Controller {

	@Autowired
	MiniroomBoard2Service miniroomboard2Service;
	@Autowired
	MiniroomBoardService miniroomboardService;

	// 다이어리 작성 페이지 이동
	@RequestMapping(value = "/diary_write.do", method = RequestMethod.GET)
	public String diary_write(int uidx, int category, Model model) {
		model.addAttribute("category", category);
		return "minihome/diary-write";
	}

	// 다이어리 작성
	@RequestMapping(value = "/diary_write.do", method = RequestMethod.POST)
	public void diary_write(MiniroomBoardVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) throws IOException {
		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		vo.setWriter(login.getUidx()); // 작성자 uidx
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		vo.setUidx(mini.getUidx()); // 미니홈피 주인 uidx

		List<MiniroomBoardVo> category = miniroomboardService.checkCategory(mini.getUidx());
		model.addAttribute("subcategory", category);

		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);

		int result = miniroomboard2Service.writemini(vo);

		PrintWriter pw = response.getWriter();
		pw.append("<script>history.back();history.back();</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}

	// 다이어리 글 전부 보내기
	@ResponseBody
	@RequestMapping(value = "/miniroomboardList.do", produces = "application/json;charset=utf8")
	public List<MiniroomBoardVo> miniroomboardList() {
		return miniroomboard2Service.miniroomboardList();
	}

	// 다이어리 삭제
	@RequestMapping(value = "/deleteDiary.do")
	public void deleteDiary(int mbidx, HttpServletResponse response) throws IOException {
		miniroomboard2Service.deleteDiary(mbidx);

		PrintWriter pw = response.getWriter();
		pw.append("<script>alert('삭제 완료');history.back();</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}

	// 다이어리 수정 페이지 이동
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(int mbidx, String title, String content, Model model) {
		model.addAttribute("mbidx", mbidx);
		model.addAttribute("title", title);
		model.addAttribute("content", content);

		return "minihome/modify";
	}

	// 다이어리 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public void modify(MiniroomBoardVo vo, HttpServletResponse response) throws IOException {
		miniroomboard2Service.modify(vo);

		PrintWriter pw = response.getWriter();
		pw.append("<script>alert('수정 완료');history.back();history.back();</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
	
	
																																		
	// 다이어리 글 전부 조회 
	@RequestMapping(value = "/boardList.do", method=RequestMethod.GET)
	public String boardList(Model model, int day, HttpServletRequest request, HttpSession session) {
		System.out.println("boardList 들어옴");
		List<MiniroomBoardVo> list = miniroomboard2Service.miniroomboardList();
		model.addAttribute("list", list);
		session = request.getSession();
		session.setAttribute("saveDay", day);
		System.out.println("day: "+day);
		return "minihome/boardList";
	}
	
	// 다이어리 글 날짜별 조회
	@RequestMapping(value = "/boardByDate.do", method=RequestMethod.GET)
	public String boardByDate(Model model, int year, int month, int day, HttpServletRequest request, HttpSession session) {
		System.out.println("boardByDate 들어옴");
		String date = Integer.toString(year) +'-'+ Integer.toString(month) +'-'+ Integer.toString(day);
		List<MiniroomBoardVo> list = miniroomboard2Service.boardByDate(date);
		model.addAttribute("list", list);
		session = request.getSession();
		session.setAttribute("saveDay", day);
		
		System.out.println("boardByDate day는 " + day);
		 
		return "minihome/boardList";
	}
	
	@RequestMapping(value = "/calendar.do", method=RequestMethod.GET)
	public String calendar(Model model, int year, int month, int monthByDate, int day, HttpServletRequest request, HttpSession session) {
		System.out.println("calendar 들어옴");
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("monthByDate", monthByDate);
		/* model.addAttribute("day", day); */
		session = request.getSession();
		session.setAttribute("saveDay", day);
		System.out.println("calendar day는 " + day);
		
		return "minihome/calendar";
	}
}
