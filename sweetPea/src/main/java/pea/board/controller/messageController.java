package pea.board.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.MessageService;
import pea.board.vo.MainBoardVo;
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
		
		int total = messageService.countMessage(uidx);
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		
		List<MessageVo> list= messageService.selectAll(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", vo);
		return "message/msg-main";
	}
	
	@RequestMapping(value="/content.do", method=RequestMethod.GET)
	public String content(int midx, Model model){
		int check = messageService.viewCheck(midx);
		MessageVo vo = messageService.content(midx);
		model.addAttribute("vo",vo);
		return "message/msg-content";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(){
		return "message/msg-write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public void write(MessageVo vo, HttpServletResponse response) throws IOException{
		int uidx = vo.getUidx();
		int result = messageService.writeMessage(vo);
		if(result == 1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
				pw.append("<script src='../resources/js/jquery-3.6.0.min.js'></script>");
				pw.append("<script>location.href='main.do?uidx="+uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
				pw.flush();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/write.do", method = RequestMethod.POST, produces = "application/json")
	public int delMsg(@RequestBody List<Map> paramMap){
		
		  System.out.println(paramMap);

		  //paramMap.put("list", obj);

		/*
		 * int size = list.length; for(int i=0;i<size;i++) { int delNum =
		 * Integer.parseInt(ajaxMsg[i]); result = messageService.delMsg(delNum); }
		 * if(result == 1) { return 1; }else
		 */
		return 0;
	}
 

	
}
