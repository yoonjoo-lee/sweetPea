package pea.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.MainBoardService;
import pea.board.vo.MainBoardVo;
import pea.board.vo.MainCommentVo;
import pea.board.vo.PagingVo;
import pea.board.vo.SearchVo;
import pea.board.vo.UserVo;

@Controller
public class MainBoardController {
	
	@Autowired
	MainBoardService mainboardService;

	// 커뮤니티 페이지 이동
	@RequestMapping(value="mainboard/community.do")
	public String community() {
		return "mainboard/community";
	}
	
	// 고객센터 페이지 이동
	@RequestMapping(value="mainboard/service.do")
	public String service() {
		return "mainboard/service";
	}
	
	//보드 리스트 이동과 불러오기 
	@RequestMapping(value="mainboard/list.do")
	public String list(int category, Model model, SearchVo searchVo, PagingVo vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = mainboardService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		
		model.addAttribute("category", category);
		vo.setCategory(category);
		List<MainBoardVo> list= mainboardService.list(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", vo);
		model.addAttribute("category", category);
		
		return "mainboard/list";
	}
	
	// 보드 write 후 home으로 이동
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
	
	// 보드 작성하기 
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
			pw.append("<script>alert('로그인 후 작성 가능합니다.');location.href='home.do'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush();
		}else {
			pw.append("<script>location.href='gowrite.do?category="+category+"';</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			pw.flush();
		}
		System.out.println("login uinx"+ login.getUidx());
		
	}
	
	//각 보드 (content)
	@RequestMapping(value="mainboard/view.do")
	public String view(int bidx, Model model,HttpServletRequest request, HttpSession session) {
		MainBoardVo vo = mainboardService.view(bidx);
		model.addAttribute("vo", vo);
		
		session = request.getSession();
		session.setAttribute("bidx", bidx);
		
		
		return "mainboard/view";
	}
	
	
	//보드리스트 ajax로 가져가기 (comunity, service) 
	@ResponseBody
	@RequestMapping(value="mainboard/boardList.do", produces = "application/json;charset=utf8")
	public List<MainBoardVo> boardList(PagingVo vo, int category){
		vo.setCategory(category);
		vo.setList(1); //커뮤니티에서 불러올 경우 개수 제한 두기 위해 (개수제한둘경우 lists=>1) 

		return mainboardService.list(vo);
	}
	
	//수정페이지 이동
	@RequestMapping(value="mainboard/modify.do", method=RequestMethod.GET)
	public String modify(int bidx, Model model) {
		MainBoardVo vo = mainboardService.view(bidx);
		model.addAttribute("vo", vo);
		
		return "mainboard/modify";
	}
	
	//보드 수정
	@RequestMapping(value="mainboard/modify.do", method=RequestMethod.POST)
	public String modify(MainBoardVo vo) throws UnknownHostException {
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		int result = mainboardService.modify(vo);
		
		return "redirect:/mainboard/list.do?category="+vo.getCategory();
	}
	
	@RequestMapping(value="mainboard/delete.do")
	public String delete(int bidx, int category) {
		int result = mainboardService.delete(bidx);
		
		return "redirect:/mainboard/list.do?category="+category;
	}
	
	//보드 댓글 작성 ajax
	@ResponseBody
	@RequestMapping(value="mainboard/addComment.do")
	public String addComment(MainCommentVo vo,HttpServletRequest request, HttpSession session) throws UnknownHostException {
		session = request.getSession();
		UserVo login = (UserVo)session.getAttribute("login");
		vo.setUidx(login.getUidx());
		vo.setWriter(login.getName());
		vo.setUidx(login.getUidx());
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
		mainboardService.writeReply(vo);
		
		return "success";
	}
	
	//보드 대댓글 작성 ajax
		@ResponseBody
		@RequestMapping(value="mainboard/addComminComm.do")
		public String addComminComm(MainCommentVo vo,HttpServletRequest request, HttpSession session) throws UnknownHostException {
			session = request.getSession();
			UserVo login = (UserVo)session.getAttribute("login");
			System.out.println("bidx:"+vo.getBidx()+"name: "+login.getName()+"content:"+vo.getContent());
			vo.setUidx(login.getUidx());
			vo.setWriter(login.getName());
			vo.setOrigincidx(vo.getCidx());
			String ip = InetAddress.getLocalHost().getHostAddress();
			vo.setIp(ip);
			vo.setDepth(1);
			
			mainboardService.writeReply(vo);
			
			return "success";
		}
	
	//보드 댓글 수정 ajax
	@ResponseBody
	@RequestMapping(value="mainboard/modifyComment.do")
	public String modifyComment(MainCommentVo vo) throws UnknownHostException {
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
		mainboardService.modifyReply(vo);	//예외 처리하기
		
		return "success";
	}
	
	//댓글 삭제 
	@ResponseBody
	@RequestMapping(value="mainboard/deleteComment.do")
	public String deleteComment(int cidx) {
		int result = mainboardService.deleteReply(cidx);
		if (result==1) {
			return "success";
		} else {
			return "삭제에 실패하였습니다.";
		}
	}
	
	//보드 댓글 리스트 불러오기 ajax
	@ResponseBody
	@RequestMapping(value="mainboard/commentList.do", produces="application/json; charset=utf8")
	public ResponseEntity commentList(MainCommentVo vo,HttpServletRequest request) {
		HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
        List<MainCommentVo> list= mainboardService.selectComment(vo);
        
        if(list.size() > 0) {
        	for(int i = 0; i < list.size(); i++) {
        		HashMap hm = new HashMap();
        		hm.put("cidx", list.get(i).getCidx());
        		hm.put("content", list.get(i).getContent());
        		hm.put("writer", list.get(i).getWriter());
        		hm.put("uidx", list.get(i).getUidx());
        		hm.put("depth", list.get(i).getDepth());
        		hm.put("origincidx", list.get(i).getOrigincidx());
        		hm.put("datetime", list.get(i).getDatetime());
        		
        		hmlist.add(hm);
        	}
        }
        
        JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	
	
}









