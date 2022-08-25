package pea.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pea.board.service.ItemService;
import pea.board.vo.ItemVo;
import pea.board.vo.MainBoardVo;
import pea.board.vo.MessageVo;
import pea.board.vo.PagingVo;
import pea.board.vo.SearchVo;
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
	@RequestMapping(value = "item/shopping-basket.do", method = RequestMethod.GET)
	public String shoppingBasket(int uidx, Model model) {
		System.out.println("uidx"+uidx);
		
		List<ItemVo> list = itemService.basketList(uidx);
		System.out.println("list : "+list);
		model.addAttribute("list",list);
		for(ItemVo vo: list) {
			System.out.println("vo: "+vo.getIidx());
		}
		System.out.println(list.isEmpty());
		
		return "item/shopping-basket";
	}

	@RequestMapping(value = "/item/shop.do", method = RequestMethod.GET)
	public String shop(HttpServletRequest request, HttpSession session,int category) {
		session.setAttribute("category", category);
		System.out.println("컨트롤러categoty : "+category);
		
		
		
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
	
	
	/* 아이템 등록 파일, BGM 선택 페이지 */
	@RequestMapping(value="/item/itemFileChoice.do", method=RequestMethod.GET)
	public String itemFileChoice() {
		
		return "item/itemFileChoice";
	}

//	 /* 아이템 리스트 가져오기 */

	@ResponseBody
	@RequestMapping(value = "/item/itemSelectAll.do", produces = "application/json;charset=utf8")
	public List<ItemVo> itemSelectAll(int cate, int category, int subcategory) {
		System.out.println("selectAll category :"+category);
		System.out.println("selectAll cate :"+cate);
		ItemVo vo = new ItemVo();
		vo.setSubcategory(subcategory);
		vo.setCategory(category);
		System.out.println("selectAll subcategory : "+subcategory);
		
		/* 아이템 리스트 전체 */
		if (cate == 1) {
			return itemService.itemSelectAll(vo);
		} else if (cate == 2) {
			/* 아이템 리스트 인기상품순 */
			return itemService.itemListCount(vo);
		} else if (cate == 3) {
			/* 아이템 리스트 가격내림차순 */
			return itemService.itemListDesc(vo);
		} else if (cate == 4) {
			/* 아이템 리스트 가격오름차순 */
			return itemService.itemListAsc(vo);
		} else if (cate == 5) {
			/* 아이템 리스트 신상품순 */
			return itemService.itemListNew(vo);
		} else if (cate == 6) {
			/* 아이템 승인 전 들어가는 페이지 리스트 */
			return itemService.itemApproval(vo);
		} else if (cate == 7) {

			return itemService.postPone(vo);
		} 
		return itemService.itemSelectAll(vo);
	}
	
	// 아이템 리스트 신상품 LIMIT 5개
	@ResponseBody
	@RequestMapping(value = "/item/itemListNewLimit.do", produces = "application/json;charset=utf8")
	public List<ItemVo> itemListNewLimit() {

		return itemService.itemListNewLimit();
	}

	
//	/* 아이템 등록 구문 */

	@RequestMapping(value = "/item/itemWrite.do", method = RequestMethod.GET)
	public String itemWrite() {

		return "item/itemWrite";
	}

	@ResponseBody
	@RequestMapping(value = "/item/itemFile.do", produces = "application/json;charset=utf8")
	public void itemWrite(ItemVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session, @RequestParam("file") MultipartFile file) throws IOException {

		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		PrintWriter pw = response.getWriter();
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		vo.setUidx(login.getUidx());
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
			pw.append("<script>alert('아이템이 등록 되었습니다.');window.parent.location.href='shop.do?category=4'</script>");
			pw.flush();
		}

	}
	
	// 파일 경로 찾기
	@RequestMapping(value="/item/imageView.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String originFileName, HttpServletRequest request, HttpSession session){
		
		String path = request.getSession().getServletContext().getRealPath("/resources/images/itemImg/");
		File file=new File(path, originFileName);
		System.out.println("path + "+ path);
	    ResponseEntity<byte[]> result=null;
	    try {
	        HttpHeaders headers=new HttpHeaders();
	        headers.add("Content-Type", Files.probeContentType(file.toPath()));
	        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK );
	    }catch (IOException e) {
	        e.printStackTrace();
	    }
	    System.out.println("result"+result);
	    return result;
	}
	
	/* 음악파일 업로드 페이지 */
	
	@RequestMapping(value="/item/bgmFile.do", method=RequestMethod.GET)
	public String itemWriteBGM() {
		
		return "item/itemWriteBGM";
	}
	
	
	/* 음악 파일 업로드 */
	@ResponseBody
	@RequestMapping(value = "/item/bgmFile.do", produces = "application/json;charset=utf8")
	public void bgmFile(ItemVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session, @RequestParam("file") MultipartFile file) throws IOException {
		
		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		PrintWriter pw = response.getWriter();
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		vo.setUidx(login.getUidx());
		vo.setImg(file.getOriginalFilename());
		String path = request.getSession().getServletContext().getRealPath("/resources/images/itemBGM");
		
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
			pw.append("<script>alert('아이템이 등록 되었습니다.');window.parent.location.href='shop.do?category=4'</script>");
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


//	/* 아이템 장바구니  */

	
	/* 아이템 장바구니 리스트 */

	@RequestMapping(value = "item/shoppingList.do", method = RequestMethod.GET)
	public String shoppingList(ItemVo vo, Model model, int uidx) {
		
		List<ItemVo> list = itemService.basketList(uidx);
		System.out.println(list);
		model.addAttribute("list", list);	
		model.addAttribute("vo",vo);
		System.out.println(list.isEmpty());
		return "item/shopping-basket";
	}
	
	/* 장바구니 아이템 리스트 추가 */
	@ResponseBody
	@RequestMapping(value="item/itemShoppingAdd.do", produces = "application/json;charset=utf8")
	public int itemShoppingAdd(int iidx, int uidx){
		ItemVo vo = new ItemVo();
		vo.setIidx(iidx);
		vo.setUidx(uidx);
		String result2 = itemService.basketListCheck(vo);
		System.out.println("vo : "+vo);
		if(result2 == null) {
			int result = itemService.basketItemAdd(vo);
			return result;
		}else {
			return 0;
		}
		
	}
	

	/* 장바구니 리스트 삭제 */
	@ResponseBody
	@RequestMapping(value="item/basketItemDel.do", produces = "application/json;charset=utf8")
	public int basketItemDel(@RequestParam(value="checkBox[]") List<String> arrayParams) {
		int result = 0;
		System.out.println(arrayParams);
		int size = arrayParams.size();
		ItemVo vo = new ItemVo();
		
		for(int i=0;i<size;i++) {
			vo.setUiidx(Integer.parseInt(arrayParams.get(i)));
			result=itemService.basketItemDel(vo);
		}
		if(result ==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	/* 내 아이템 리스트 */
	
	@RequestMapping(value="item/myItemList.do", method=RequestMethod.GET)
	public String myItemList(ItemVo vo, Model model, int uidx) {
			List<ItemVo> list = itemService.myItemList(uidx);
			model.addAttribute("ilist",list);
			model.addAttribute("vo",vo);
			model.addAttribute("test","ggg");
			System.out.println("kk"+uidx);
			System.out.println(vo.getUidx());
		return "item/myItemList";
	}
	
	/*  내 아이템 리스트 추가 */
	@ResponseBody
	@RequestMapping(value="item/myItemAdd.do", produces = "application/json;charset=utf8")
	public int myItemAdd(int uidx, int iidx,int price,HttpSession session) {
		ItemVo vo = new ItemVo();
		vo.setIidx(iidx);
		vo.setUidx(uidx);
		vo.setPrice(price);
		
		String result = itemService.myItemListCheck(vo);
		UserVo login = (UserVo) session.getAttribute("login");
		
		if(result == null) {
			int myItemAdd = itemService.myItemAdd(vo);
			login.setPea_amount(myItemAdd);
			session.setAttribute("login", login);
			return 1;
		}else if(result.equals("N")){
			int myItemListUpdate = itemService.myItemListUpdate(vo);
			login.setPea_amount(myItemListUpdate);
			session.setAttribute("login", login);
			return 1;
		}else {
			return 0;
		}
		
	}

	/* 아이템 승인 확인 */
	@ResponseBody
	@RequestMapping(value = "item/approvalCheck.do", method = RequestMethod.POST)
	public int approvalCheck(int iidx, int check) {
		System.out.println(iidx);
		System.out.println(check);
		if (check == 1) {
			return itemService.approvalCheck(iidx);
		} else if (check == 2) {
			return itemService.postponeCheck(iidx);
		}
		return 1;
	}

	@RequestMapping(value = "item/delCheckItem.do", method = RequestMethod.GET)
	public String delCheckItem() {

		return "item/delCheckItem";
	}

	/* 아이템 등록 페이지 */
	@RequestMapping(value = "item/item-approval.do", method = RequestMethod.GET)
	public String itemApproval() {

		return "item/item-approval";
	}

	/* 아이템 보류 페이지 */
	@RequestMapping(value = "item/item-postpone.do", method = RequestMethod.GET)
	public String itemPostpone() {

		return "item/item-postpone";
	}
	/*아이템 보류페이지에서 삭제 */
	@RequestMapping(value="item/itemDel.do")
	public void itemDel(int iidx, HttpServletResponse response) throws IOException {
		int result = itemService.itemDel(iidx);
		PrintWriter pw = response.getWriter();
		pw.append("<script>history.back();</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
	
	/* 결제  */
	@ResponseBody
	@RequestMapping(value="item/insertAmount.do", produces = "application/json;charset=utf8")
	public int insertAmount(int pea_amount,int uidx,HttpServletRequest request, HttpSession session) {
		UserVo vo = new UserVo();
		vo.setPea_amount(pea_amount);
		vo.setUidx(uidx);
		int pea = itemService.insertAmount(vo);
		UserVo login = (UserVo) session.getAttribute("login");
		login.setPea_amount(pea);
		session.setAttribute("login", login);
		
		return 1;
	}

	/* 장바구니 리스트 구매 */
	@ResponseBody
	@RequestMapping(value="item/buyBasketList.do", produces = "application/json;charset=utf8")
	public int buyBasketList(@RequestParam(value="checkBox[]") List<String> arrayParams, int price, HttpSession session) {
		int size = arrayParams.size();
		
		ItemVo vo = new ItemVo();
		UserVo login = (UserVo) session.getAttribute("login");
		
		for(int i=0;i<size;i++) {
			vo.setUiidx(Integer.parseInt(arrayParams.get(i)));
			itemService.buyBasketList(vo);
		}
		vo.setPrice(price);
		vo.setUidx(login.getUidx());
		
		int result = itemService.afterBuyBasketList(vo);
		login.setPea_amount(result);
		session.setAttribute("login", login);
		
		return 1;
		
	}

}
