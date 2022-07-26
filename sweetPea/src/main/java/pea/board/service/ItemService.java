package pea.board.service;

import java.util.List;

import pea.board.vo.ItemVo;

public interface ItemService {
	
	int itemNameCheck(String name); // 아이템 이름 중복 체크 
	int itemWrite(ItemVo vo);		// 아이템 등록 
	List<ItemVo> itemSelectAll();	// 아이템 리스트 
}
