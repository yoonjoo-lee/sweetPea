package pea.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping(value="item/shopping-basket.do", method=RequestMethod.GET)
	public String shoppingBasket() {
		
		return "item/shopping-basket";
	}
	
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

	@RequestMapping(value = "/item/itemWrite.do", method = RequestMethod.GET)
	public String itemWrite() {

		return "item/itemWrite";
	}

	@ResponseBody
	@RequestMapping(value = "/item/itemWrite.do", produces = "application/json;charset=utf8")
	public void itemWrite(ItemVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session, @RequestParam("file") MultipartFile file) throws IOException {

		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		PrintWriter pw = response.getWriter();
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		vo.setUiidx(login.getUidx());
		vo.setImg(file.getOriginalFilename());
		String path = request.getSession().getServletContext().getRealPath("/resources/images/itemImg");

		System.out.println(path);
		System.out.println(vo.getImg());

		session.setAttribute("login", login);

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}

		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path, file.getOriginalFilename()));
		} else {

		}

		int result = itemService.itemWrite(vo);

		response.setContentType("text/html;charset=utf-8");

		if (result <= 0) {
			pw.append("<script>alert('아이템이 등록되지 않았습니다.');window.parent.location.href='item-write.do'</script>");
			pw.flush();
		} else {
			pw.append("<script>alert('아이템이 등록 되었습니다.');window.parent.location.href='shop.do'</script>");
			pw.flush();
		}

	}

//	 /* 아이템 이름 중복체크 */

	@ResponseBody
	@RequestMapping(value = "/item/itemNameCheck.do", produces = "application/json;charset=utf8")
	public int itemNameCheck(String name) {
		System.out.println(name);
		return itemService.itemNameCheck(name);
	}

//	 /* 아이템 리스트 가져오기 */

	@ResponseBody
	@RequestMapping(value = "/item/itemSelectAll.do", produces = "application/json;charset=utf8")
	public List<ItemVo> itemSelectAll(int cate) {
		
		/* 아이템 리스트 전체 */
		if(cate==1) {
			return itemService.itemSelectAll();
		}else if(cate==2) {
			/* 아이템 리스트 인기상품순 */
			return itemService.itemListCount();
		}else if(cate==3) {
			/* 아이템 리스트 가격내림차순 */
			return itemService.itemListDesc();
		}else if(cate==4) {
			/* 아이템 리스트 가격오름차순 */
			return itemService.itemListAsc();
		}else if(cate==5) {
			/* 아이템 리스트 신상품순 */
			return itemService.itemListNew();
		}
		return itemService.itemSelectAll();
	}


	// 아이템 리스트 신상품 LIMIT 5개
	@ResponseBody
	@RequestMapping(value = "/item/itemListNewLimit.do", produces = "application/json;charset=utf8")
	public List<ItemVo> itemListNewLimit() {

		return itemService.itemListNewLimit();
	}

//	/* 아이템 장바구니  */

	/* 아이템 장바구니 리스트 */

	@RequestMapping(value = "item/shoppingList.do", method = RequestMethod.GET)
	public String shoppingList() {

		return "item/shopping-basket";
	}

	/* 아이템 사기 */
	@RequestMapping(value = "item/itemBuy.do", method = RequestMethod.GET)
	public String itemBuy() {
		return "item/itemBuy";
	}

	@RequestMapping(value = "item/delCheckItem.do", method = RequestMethod.GET)
	public String delCheckItem() {

		return "item/delCheckItem";
	}

}
