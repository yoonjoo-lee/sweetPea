package pea.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.List;

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

import pea.board.service.MainBoardService;
import pea.board.vo.MainBoardVo;
import pea.board.vo.PagingVo;
import pea.board.vo.SearchVo;
import pea.board.vo.UserVo;

@Controller
public class MainBoardController {
	
	@Autowired
	MainBoardService mainboardService;

	@RequestMapping(value="mainboard/community.do")
	public String community() {
		return "mainboard/community";
	}
	
	@RequestMapping(value="mainboard/service.do")
	public String service() {
		return "mainboard/service";
	}
	
	@RequestMapping(value="mainboard/list.do")
	public String list(int category, Model model, SearchVo searchVo, PagingVo vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
//		System.out.println(searchVo.getStart()+"스타트");
		
		int total = mainboardService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		System.out.println("여기 nowPage:"+nowPage+", cntPerPage:"+cntPerPage+",total"+total);
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		searchVo.setTotal(total);
//		searchVo.setNowPage(Integer.parseInt(nowPage));
//		searchVo.setCntPerPage(Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		
		model.addAttribute("category", category);
		vo.setCategory(category);
		List<MainBoardVo> list= mainboardService.list(vo);
		
		System.out.println("category:"+category+"vo"+vo);
		System.out.println("searchType:"+vo.getSearchType()+",SearchValue"+vo.getSearchValue()+",Category"+vo.getCategory()+",list"+vo.getList());
		System.out.println("list:"+list);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", vo);
		return "mainboard/list";
	}
	
	
	
	@RequestMapping(value="mainboard/home.do")
	public String home() {
		
		return "redirect:/";
	}
	
	//보드write->로그인 검열 후 uidx와 페이지 이동 
	@RequestMapping(value="mainboard/gowrite.do", method=RequestMethod.GET)
	public String gowrite(int category, Model model) {
		model.addAttribute("category", category);
		return "mainboard/write";
	}
	
	@RequestMapping(value="mainboard/gowrite.do", method=RequestMethod.POST)
	public String gowrite(int category, MainBoardVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		session = request.getSession();
		PrintWriter pw = response.getWriter();
		UserVo login = (UserVo)session.getAttribute("login");
		vo.setUidx(login.getUidx());
		vo.setCategory(category);
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
		int result = mainboardService.write(vo);
		
		return "redirect:/";
	}
	
	//보드write 페이지 이동 (로그인 검열)
	@RequestMapping(value="mainboard/write.do")
	public void write(int category, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		session = request.getSession();
		PrintWriter pw = response.getWriter();
		
		UserVo login = (UserVo)session.getAttribute("login");
		if (login==null) {
			pw.append("<script>alert('GO TO LOGIN .');location.href='home.do'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush();
		}else {
			pw.append("<script>location.href='gowrite.do?category="+category+"';</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush();
		}
		System.out.println("login uinx"+ login.getUidx());
		
		//return "mainboard/write";
	}
	
	//각 보드 (content)
	@RequestMapping(value="mainboard/view.do")
	public String view(int bidx, Model model) {
		MainBoardVo vo = mainboardService.view(bidx);
		model.addAttribute("vo", vo);
		
		return "mainboard/view";
	}
	
	
	//보드리스트 ajax로 가져가기 (comunity, service) 
	@ResponseBody
	@RequestMapping(value="mainboard/boardList.do", produces = "application/json;charset=utf8")
	public List<MainBoardVo> boardList(PagingVo vo, int category){
		vo.setCategory(category);
		vo.setList(1); //커뮤니티에서 불러올 경우 개수 제한 두기 위해 (개수제한둘경우 lists=>1) 
		vo.setStart(1);
		vo.setEnd(5);
		System.out.println("bidx"+category+"category"+vo.getCategory());
		System.out.println(vo);
		return mainboardService.list(vo);
	}
	
	@RequestMapping(value="mainboard/modify.do", method=RequestMethod.GET)
	public String modify(int bidx, Model model) {
		MainBoardVo vo = mainboardService.view(bidx);
		model.addAttribute("vo", vo);
		return "mainboard/modify";
	}
	
	@RequestMapping(value="mainboard/modify.do", method=RequestMethod.POST)
	public String modify() {
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
}
