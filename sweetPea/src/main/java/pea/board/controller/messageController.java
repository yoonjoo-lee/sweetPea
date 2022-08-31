package pea.board.controller;



import java.io.IOException;
import java.io.PrintWriter;
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

import pea.board.service.MessageService;
import pea.board.vo.MessageVo;
import pea.board.vo.PagingVo;
import pea.board.vo.SearchVo;


@RequestMapping(value="/message")
@Controller
public class messageController {
	
	@Autowired
	MessageService messageService;

	
	@RequestMapping(value="/user/home.do")
	public String home() {
		return "redirect:/";
	}
	
	//
	//
	/* 쪽지함 이동 */
	//
	//
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(int uidx, Model model, SearchVo searchVo, PagingVo vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		cntPerPage = "5";
		if (nowPage == null) {nowPage = "1";}
		
		int total = messageService.countMessage(vo);
		System.out.println(total);
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		vo.setUidx(uidx);
		List<MessageVo> list= messageService.selectAll(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", vo);
		return "message/msg-main";
	}
	
	@RequestMapping(value="/content.do", method=RequestMethod.GET)
	public String content(int midx, Model model, HttpSession session, HttpServletRequest request){
		messageService.viewCheck(midx);
		
		
		MessageVo vo = messageService.content(midx);
		model.addAttribute("vo",vo);
		
		session = request.getSession();
		int newMsg = messageService.newViewCheck(vo.getUidx());
		session.setAttribute("newMsg", newMsg);
		return "message/msg-content";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(){
		return "message/msg-write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public void write(int writer_uidx, MessageVo vo, HttpServletResponse response) throws IOException{
		int result = 0;
		List<String> uidxCheck = messageService.userCheck();
		int size = uidxCheck.size();
		for(int i=0;i<size;i++) {
			vo.setUidx(Integer.parseInt(uidxCheck.get(i)));
			result = messageService.writeMessage(vo);
		}
		if(result == 1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
				pw.append("<script src='../resources/js/jquery-3.6.0.min.js'></script>");
				pw.append("<script>location.href='main.do?uidx="+writer_uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
				pw.flush();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/delMsg.do", produces = "application/json;charset=utf8")
	public int delMsg(@RequestParam(value="checkBox[]") List<String> arrayParams){
		int result = 0;
		System.out.println(arrayParams);
		
		int size = arrayParams.size();
		for(int i=0;i<size;i++) {
		int delNum = Integer.parseInt(arrayParams.get(i));
		result = messageService.delMsg(delNum);
		}
		if(result == 1) {
			return 1;
		}else
			return 0;
	}
 

	
}
