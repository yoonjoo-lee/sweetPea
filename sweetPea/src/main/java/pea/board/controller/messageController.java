package pea.board.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		cntPerPage = "7";
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
	public String write(MessageVo vo){
		
		int result = messageService.writeMessage(vo);
		if(result == 1) {
			return "message/msg-main";
		}
		else
		return "message/msg-write";
	}
	
	
	
}
