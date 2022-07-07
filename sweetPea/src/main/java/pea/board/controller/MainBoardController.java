package pea.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainBoardController {

	@RequestMapping(value="mainboard/community.do")
	public String community() {
		return "mainboard/community";
	}
	
	@RequestMapping(value="mainboard/service.do")
	public String service() {
		return "mainboard/service";
	}
}
