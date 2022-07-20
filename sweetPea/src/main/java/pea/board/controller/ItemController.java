package pea.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ItemController {

	
	
	@RequestMapping(value="/item/home.do")
	public String home() {
		return "redirect:/";
	}
	
	
//	
//	
//	
	/* 아이템페이지 */
//	
//	
//	
	@RequestMapping(value="/item/shop.do", method=RequestMethod.GET)
	public String shop() {
		
		return "item/shop";
	}
	
	
	@RequestMapping(value="/item/itemShopMain.do", method=RequestMethod.GET)
	public String itemShopMain() {
		
		
		
		return "item/itemShopMain";
	}
	
	
	@RequestMapping(value="/item/leftBanner.do")
	public String itemLeftBanner() {
		
		return "item/leftBanner";
	}
	
	
}
