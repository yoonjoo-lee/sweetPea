package pea.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 * @return 
 */
@Controller
public class HomeController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		/*
		 * String userAgent = request.getHeader("user-agent"); boolean mobile1 =
		 * userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian"
		 * +"|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*"
		 * ); boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*");
		 * 
		 * if (mobile1 || mobile2) { session.setAttribute("device", "MOBILE"); } else {
		 * session.setAttribute("device", "PC"); }
		 */
		return "home";
		  
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home() {
		return "redirect:/";
	}
	
	
	
}


