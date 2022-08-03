package pea.board.service;

import java.util.List;

import pea.board.vo.ItemVo;

public interface ItemService {
	
	int itemNameCheck(String name); // 아이템 이름 중복 체크 
	int itemWrite(ItemVo vo);		// 아이템 등록 
	List<ItemVo> itemSelectAll();	// 아이템 리스트 
	List<ItemVo> itemListCount();	// 아이템 인기상품순 리스트 
	List<ItemVo> itemListDesc();	// 아이템 가격 내림차순 리스트 
	List<ItemVo> itemListAsc();	// 아이템 가격 오름순 리스트 
	List<ItemVo> itemListNew();	// 아이템 신상품순 리스트 
	List<ItemVo> itemListNewLimit();	// 아이템 신상품순 리스트 Limit 5개
	List<ItemVo> itemApproval();	// 아이템 신상품순 리스트 Limit 5개
	
}
