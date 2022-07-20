package pea.board.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/mini")
@Controller
public class MiniroomBoardController {
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(int uidx,HttpServletRequest request, Model model){
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian"
		                          +"|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		
		if (mobile1 || mobile2) {
			model.addAttribute("device", "MOBILE");
		    return "minihome/main";
		} else {
			model.addAttribute("device", "PC");
			return "minihome/main";
		}
	}
}
