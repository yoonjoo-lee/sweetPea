package pea.board.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pea.board.service.ItemService;
import pea.board.vo.ItemVo;

/**
 * Handles requests for the application home page.
 * @return 
 */
@Controller
public class HomeController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	ItemService itemService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		List<ItemVo> newList = itemService.itemListNewLimit();
		List<ItemVo> mostList = itemService.mostBuyItemList();
		
		session.setAttribute("newList",newList);
		session.setAttribute("mostList",mostList);
		return "home";
		  
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home() {
		return "redirect:/";
	}
	
	
	
}


