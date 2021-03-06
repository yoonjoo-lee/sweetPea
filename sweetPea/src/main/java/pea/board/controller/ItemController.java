package pea.board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pea.board.service.ItemService;
import pea.board.vo.ItemVo;
import pea.board.vo.UserVo;

@Controller
public class ItemController {

	@Autowired
	ItemService itemService;
	
	
	

	@RequestMapping(value = "/item/home.do")
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
	@RequestMapping(value = "/item/shop.do", method = RequestMethod.GET)
	public String shop() {

		return "item/shop";
	}

	@RequestMapping(value = "/item/itemShopMain.do", method = RequestMethod.GET)
	public String itemShopMain() {

		return "item/itemShopMain";
	}

	@RequestMapping(value = "/item/leftBanner.do")
	public String itemLeftBanner() {

		return "item/leftBanner";
	}

//	/* 아이템 등록 구문 */

	@RequestMapping(value = "/item/item-write.do", method = RequestMethod.GET)
	public String itemWrite() {

		return "item/itemWrite";
	}
	
	@RequestMapping(value="/item/item-write.do", method=RequestMethod.POST)
	public void itemWrite(ItemVo vo,HttpServletResponse response ,HttpServletRequest reqeust, HttpSession session) {
		
		session = reqeust.getSession();
		
		
		
		
		
	}

	/* 아이템 이미지 업로드 */

	@ResponseBody
	@RequestMapping(value = "/user/itemImgUpload.do", produces = "application/json;charset=utf8")
	public void itemImgUpload(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/resources/images/itemImg");
		System.out.println(path);
		/*
		 * String formData = request.getParameter("formData");
		 * System.out.println(formData);
		 */
//		System.out.println("file:" + file);
		session = request.getSession(); // uidx가져오기 위함
		UserVo login = (UserVo) session.getAttribute("login");

		String dataUrl = request.getParameter("dataUrl");
		System.out.println("dataUrl" + dataUrl);
		login.setProfile(dataUrl); // 프로필 넣기 위함
//		login.setProfile(file.getOriginalFilename()); //프로필 넣기 위함
//		
//		System.out.println("file:"+file+ ", uidx:" + login.getUidx());

		session.setAttribute("login", login);

//		File dir = new File(path); if(!dir.exists()) { dir.mkdirs(); }
//		
//		if(!file.getOriginalFilename().isEmpty()) { file.transferTo(new File(path,
//		file.getOriginalFilename())); }else {
//		
//		}

		/* return "user/myPage-profile"; */
	}

	@ResponseBody
	@RequestMapping(value = "/item/itemNameCheck.do", produces = "application/json;charset=utf8")
	public int itemNameCheck(String name) {
		System.out.println(name);
		return itemService.itemNameCheck(name);
	}

}
