package pea.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pea.board.service.MiniroomBoard2Service;
import pea.board.service.MiniroomBoardService;
import pea.board.vo.ItemVo;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.UserVo;

@RequestMapping(value = "/miniroomboard2")
@Controller
public class MiniroomBoard2Controller {

	@Autowired
	MiniroomBoard2Service miniroomboard2Service;
	@Autowired
	MiniroomBoardService miniroomboardService;
	
	
	// 다이어리 페이지 이동
	@RequestMapping(value="/mini-diary.do", method=RequestMethod.GET)
	public String iframe_diary(int uidx, Model model) {
		List<MiniroomBoardVo> category = miniroomboardService.checkCategory(uidx);
		
		model.addAttribute("category",category);
		return "minihome/diary";
	}

	// 다이어리, 방명록 작성 페이지 이동
	@RequestMapping(value = "/diary_write.do", method = RequestMethod.GET)
	public String diary_write(int category, Model model) {
		model.addAttribute("category", category);
		return "minihome/diary-write";
	}

	// 다이어리, 방명록 작성
	@RequestMapping(value = "/diary_write.do", method = RequestMethod.POST)
	public void diary_write(MiniroomBoardVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) throws IOException {
		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		vo.setWriter(login.getUidx()); // 작성자 uidx
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		vo.setUidx(mini.getUidx()); // 미니홈피 주인 uidx
		int uidx = mini.getUidx();

		List<MiniroomBoardVo> subcategory = miniroomboardService.checkCategory(mini.getUidx());
		model.addAttribute("subcategory", subcategory);

		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);

		miniroomboard2Service.writemini(vo);
		
		int category = vo.getCategory();
		PrintWriter pw = response.getWriter();

		String device = (String) session.getAttribute("device");
		if(device == "MOBILE") {
			pw.append("<script>window.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"'</script>");
		}else {
			if (category == 1) {
				pw.append("<script>location.href='mini-diary.do?uidx="+uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			} else {
				pw.append("<script>location.href='boardList.do?category="+category+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
			}
		}
		pw.flush();
	}

	/*
	 * // 다이어리 글 전부 보내기
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/miniroomboardList.do", produces =
	 * "application/json;charset=utf8") public List<MiniroomBoardVo>
	 * miniroomboardList(HttpSession session) { MiniHomeVo mini = (MiniHomeVo)
	 * session.getAttribute("mini"); int uidx = mini.getUidx(); // 미니홈피 주인 uidx
	 * MiniroomBoardVo vo = new MiniroomBoardVo(); vo.setUidx(uidx);
	 * 
	 * return miniroomboard2Service.miniroomboardList(vo); }
	 */

	// 다이어리 삭제
	@RequestMapping(value = "/deleteDiary.do")
	public void deleteDiary(int mbidx, HttpServletResponse response) throws IOException {
		miniroomboard2Service.deleteDiary(mbidx);

		PrintWriter pw = response.getWriter();
		pw.append("<script>alert('삭제 완료');history.back();</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}

	// 다이어리 수정 페이지 이동
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(int mbidx, String title, String content, Model model) {
		model.addAttribute("mbidx", mbidx);
		model.addAttribute("title", title);
		model.addAttribute("content", content);

		return "minihome/modify";
	}

	// 다이어리 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public void modify(MiniroomBoardVo vo, HttpServletResponse response) throws IOException {
		miniroomboard2Service.modify(vo);

		PrintWriter pw = response.getWriter();
		pw.append("<script>alert('수정 완료');history.back();history.back();</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
																																		
	// 다이어리, 사진첩 글 전부 조회 
	@RequestMapping(value = "/boardList.do", method=RequestMethod.GET)
	public String boardList(Model model, int category, HttpSession session) {
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		int uidx = mini.getUidx(); // 미니홈피 주인 uidx
		System.out.println("boardList login은 " + uidx);
		MiniroomBoardVo vo = new MiniroomBoardVo();
		vo.setUidx(uidx);
		vo.setCategory(category);
		vo.setCheckHomePhoto(null);
		if(category==9) {vo.setCategory(2); vo.setCheckHomePhoto("homePhoto");}//미니홈피 홈에 뜨는 사진 
		
		List<MiniroomBoardVo> list = miniroomboard2Service.miniroomboardList(vo);
		model.addAttribute("list", list);

		System.out.println("boardlist category는"+ category);
		if(category==1) {
			return "minihome/boardList";
		}else if(category==2) {
			return "minihome/photoAlbum";
		}else if(category==3) {
			return "minihome/guestBook";
		}else if(category==9) {
			return "minihome/homePhoto";
		}
		return "";
	}
	
	// 다이어리 글 날짜별 조회
	@RequestMapping(value = "/boardByDate.do", method=RequestMethod.GET)
	public String boardByDate(Model model, int year, int month, int day, int category, HttpSession session) {
		String date = Integer.toString(year) +'-'+ Integer.toString(month) +'-'+ Integer.toString(day);
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		int uidx = mini.getUidx(); // 미니홈피 주인 uidx
		
		MiniroomBoardVo vo = new MiniroomBoardVo();
		vo.setDate(date);
		vo.setUidx(uidx);
		
		List<MiniroomBoardVo> list = miniroomboard2Service.boardByDate(vo);
		model.addAttribute("list", list);

		return "minihome/boardList";
	}
	
	// 다이어리 캘린더 
	@RequestMapping(value = "/calendar.do", method=RequestMethod.GET)
	public String calendar(Model model, int year, int month, int monthByDate, int day) {
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("monthByDate", monthByDate);
		model.addAttribute("day", day); 
		
		return "minihome/calendar";
	}
	
	
	// 사진첩 등록 페이지 이동
	@RequestMapping(value = "/photoAlbumUpload.do", method = RequestMethod.GET)
	public String photoAlbumUpload(int uidx, int category, Model model) {
		model.addAttribute("category", category);
		return "minihome/photoAlbumUpload";
	}
	
	// 사진첩 등록
	@RequestMapping(value = "/photoAlbumUpload.do", method = RequestMethod.POST)
	public void photoAlbumUpload(MiniroomBoardVo vo, MultipartHttpServletRequest mtfRequest,HttpServletResponse response, HttpSession session, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/resources/images/photoAlbum");
		
		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		vo.setWriter(login.getUidx()); // 작성자 uidx
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		vo.setUidx(mini.getUidx()); // 미니홈피 주인 uidx
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file"); 
		String files = "";
		for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            files += originFileName+"|";
            System.out.println("originFileName : " + originFileName);
            
            File dir = new File(path); if(!dir.exists()) { dir.mkdirs(); }
            
            if(!mf.getOriginalFilename().isEmpty()) { 
            	mf.transferTo(new File(path, mf.getOriginalFilename())); 
            }else {
            	
            }
		}
		System.out.println("files: " + files);
		vo.setContent(files);
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
		miniroomboard2Service.writemini(vo);
		
		PrintWriter pw = response.getWriter();
		pw.append("<script>location.href='boardList.do?category=2'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
	
	// 사진첩 파일 경로 찾기
	@RequestMapping(value="/imageView.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String originFileName, HttpServletRequest request, HttpSession session){
		
		String path = request.getSession().getServletContext().getRealPath("/resources/images/photoAlbum");
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
	
	// 사진첩 삭제
	@RequestMapping(value="/photoDelete.do")
	public void photoDelete(int mbidx, HttpServletResponse response, Model model) throws IOException {
		miniroomboard2Service.deleteDiary(mbidx); 
		PrintWriter pw = response.getWriter();
		pw.append("<script>location.href='boardList.do?category=2'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}

	// 방명록 삭제
	@RequestMapping(value="/guestBookDelete.do")
	public void guestBookDelete(int mbidx, HttpServletResponse response, Model model, HttpSession session, HttpServletRequest request) throws IOException {
		miniroomboard2Service.deleteDiary(mbidx); 
		PrintWriter pw = response.getWriter();
		
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		int uidx = mini.getUidx();
		String device = (String) session.getAttribute("device");
		if(device == "MOBILE") {
			pw.append("<script>window.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"'</script>");
		}else {
			pw.append("<script>location.href='boardList.do?category=3'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		}
		pw.flush();
	}
	
	// 홈에서 최신글 보기
	@RequestMapping(value = "/homeList.do", method=RequestMethod.GET)
	public String homeList(Model model, int category, HttpSession session) {
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		int uidx = mini.getUidx(); // 미니홈피 주인 uidx
		System.out.println("boardList login은 " + uidx);
		MiniroomBoardVo vo = new MiniroomBoardVo();
		vo.setUidx(uidx);
		vo.setCategory(category);
		
		List<MiniroomBoardVo> list = miniroomboard2Service.miniroomboardList(vo);
		model.addAttribute("list", list);

		System.out.println("boardlist category는"+ category);
		
		return "minihome/homeList";
	}
	
	
	
	// 프로필 변경 페이지 이동
	@RequestMapping(value="/changeProfile.do", method=RequestMethod.GET)
	public String changeProfile( Model model) {
		/*
		 * List<MiniroomBoardVo> category = miniroomboardService.checkCategory(uidx);
		 * 
		 * model.addAttribute("category",category);
		 */
		return "minihome/changeProfile";
	}
	
	// 프로필 등록
	@RequestMapping(value = "/changeProfile.do", method = RequestMethod.POST)
	public void changeProfile(MiniroomBoardVo vo, HttpServletResponse response, HttpSession session, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/resources/images/miniProfile");
		
		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		vo.setWriter(login.getUidx()); // 작성자 uidx
		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
		vo.setUidx(mini.getUidx()); // 미니홈피 주인 uidx
		int uidx = mini.getUidx();
		
            
		File dir = new File(path); if(!dir.exists()) { dir.mkdirs(); }
		
		vo.setMiniProfile(file.getOriginalFilename());
            
        if(!file.getOriginalFilename().isEmpty()) { 
        	file.transferTo(new File(path, file.getOriginalFilename())); 
        }else {
        	
        }
            
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		vo.setIp(ip);
		
		miniroomboard2Service.changeProfile(vo);
		
		PrintWriter pw = response.getWriter();
		pw.append("<script>window.parent.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"';</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
	
	// 프로필 파일 경로 찾기
	@RequestMapping(value="/getProfile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getProfileFile(String originFileName, HttpServletRequest request, HttpSession session){
		
		String path = request.getSession().getServletContext().getRealPath("/resources/images/miniProfile");
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
	
	// 미니홈피 효과로 이동 
	@RequestMapping(value="/minihomeEffect.do", method=RequestMethod.GET)
	public String minihomeEffect(int uidx, Model model) {
		List<ItemVo> list = miniroomboard2Service.myItemList(uidx);
		
		model.addAttribute("list", list);
		return "minihome/minihomeEffect";
	}
	
	// 내 미니홈 변경 changeMyminihome
	@RequestMapping(value="/changeMyminihome.do")
	public void changeMyminihome(int uidx, String item, int category, Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
		MiniHomeVo vo = new MiniHomeVo();

		vo.setUidx(uidx);
		if (category==1){
			vo.setBackground(item);
			miniroomboard2Service.changeBackground(vo);
		} if(category==2) {
			vo.setMiniroom_background(item);
			miniroomboard2Service.changeMiniBackground(vo);
		} if(category==4) {
			vo.setFont(item);
			miniroomboard2Service.changeFont(vo);
		}
		PrintWriter pw = response.getWriter();
	//	pw.append("<script>location.reload();location.href=location.href;history.go(-1);</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.append("<script>window.parent.parent.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}

	// 미니홈피 효과로 이동 
	@RequestMapping(value="/minihomeFont.do", method=RequestMethod.GET)
	public String minihomeFont(int uidx, Model model) {
		return "minihome/minihomeFont";
	}
	
	// 미니룸 home.jsp의 miniRoomBox로 불러오기 
	@RequestMapping(value="/miniRoomBox.do", method=RequestMethod.GET)
	public String miniRoomBox() {
		return "minihome/miniRoomBox";
	}
	 
	
	@RequestMapping(value="/addTominiroom.do", method=RequestMethod.GET)
	public void addTominiroom(int uidx, int iidx, HttpServletResponse response, HttpServletRequest request) throws IOException {
		ItemVo vo = new ItemVo();
		vo.setUidx(uidx);
		vo.setIidx(iidx);
		miniroomboard2Service.addTominiroom(vo);
		
		PrintWriter pw = response.getWriter();
		pw.append("<script>window.parent.parent.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
	
	@RequestMapping(value="/removeFromMiniroom.do", method=RequestMethod.GET)
	public void removeFromMiniroom(int uidx, int iidx, HttpServletResponse response, HttpServletRequest request) throws IOException {
		ItemVo vo = new ItemVo();
		vo.setUidx(uidx);
		vo.setIidx(iidx);
		miniroomboard2Service.removeFromMiniroom(vo);
		
		PrintWriter pw = response.getWriter();
		pw.append("<script>window.parent.parent.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
	
	// 미니룸 위치 변경
	
//	@ResponseBody
//	@RequestMapping(value="/miniPosition.do", produces = "application/json")
//	public int miniPosition(String list,@RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
////		System.out.println("boxsize"+box.size());
////		for(int i=0;i<box.size();i++) {
////			System.out.println(box.get(i));
////		}
//		JSONArray jarr = new JSONArray();
//	    jarr = new JSONArray(list);
//		
//		
//		String jsonData = paramMap.get("list").toString();
//		System.out.println(paramMap);
//		System.out.println("jsonData : " + jsonData);
//		System.out.println(jarr);
//		ItemVo vo = new ItemVo();
//		for(int i = 0 ; i< jarr.length() ; i++) {
//			System.out.println("i : "+i);
//			  int uiidx = Integer.parseInt((String) jarr.getJSONObject(i).get("uiidx"));
//			  int left = (int) jarr.getJSONObject(i).get("left");
//			  int top = (int) jarr.getJSONObject(i).get("top");
//			  System.out.println("top : " +top);
//			  System.out.println("left : "+left);
//			  System.out.println("uiidx : "+uiidx);
//				vo.setMleft(left);
//				vo.setMtop(top);
//				vo.setUiidx(uiidx);
//				miniroomboard2Service.miniPosition(vo);
//		}
//		 
//		/*
//		 * for(int i=0;i<paramMap.size();i++) { System.out.println(paramMap.get(i)); }
//		 */
//		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
//		int uidx = mini.getUidx();
//		return 1;
////		PrintWriter pw = response.getWriter();
////		pw.append("<script>window.parent.parent.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
////		pw.flush();
//	}
	
	@RequestMapping(value="/miniPosition.do", method=RequestMethod.GET)
	public void miniPosition(String box,  HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
//		System.out.println("boxsize"+box.size());
//		for(int i=0;i<box.size();i++) {
//			System.out.println(box.get(i));
//		}
		System.out.println("box"+box);
		String[] tmp = box.split(",");
		System.out.println(tmp.length);
		String[] num;
		ItemVo vo = new ItemVo();
		for (int i = 0; i < tmp.length; i++) {
			System.out.println("tmp"+i+":"+tmp[i]);
			num = tmp[i].split("/");
			System.out.println(Integer.parseInt(num[0])+Integer.parseInt(num[1])+Integer.parseInt(num[2])); 
			System.out.println("num0 " + num[0] + " num1 " + num[1] + " num2 " + num[2]);
			
			vo.setUiidx(Integer.parseInt(num[0]));
			vo.setMleft(Integer.parseInt(num[1]));
			vo.setMtop(Integer.parseInt(num[2]));
			miniroomboard2Service.miniPosition(vo);
		}
		
		session = request.getSession();
		UserVo login = (UserVo) session.getAttribute("login");
		int uidx = login.getUidx();
//		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
//		int uidx = mini.getUidx();
		
		PrintWriter pw = response.getWriter();
		pw.append("<script>window.parent.parent.location.href='"+request.getContextPath()+"/mini/main.do?uidx="+uidx+"'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
		pw.flush();
	}
	
	
//	@RequestMapping(value="/miniPosition.do", method=RequestMethod.GET)
//	public void miniPosition(int left, int top, int uiidx,  HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
//		ItemVo vo = new ItemVo();
//		vo.setMleft(left);
//		vo.setMtop(top);
//		vo.setUiidx(uiidx);
//		MiniHomeVo mini = (MiniHomeVo) session.getAttribute("mini");
//		int uidx = mini.getUidx();
//		
//		miniroomboard2Service.miniPosition(vo);
//		
//		PrintWriter pw = response.getWriter();
//		pw.append("<script>window.parent.location.href='"+request.getContextPath()+"/mini/mini-home.do?'</script>"); // 다른페이지로 넘어가야하기에 redirect는 먹히지 않기에 .do로 보내라.
//		pw.flush();
//	}
}
