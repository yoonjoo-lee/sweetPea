package pea.board.service;

import java.util.List;

import pea.board.vo.ItemVo;
import pea.board.vo.UserVo;

public interface ItemService {
	
	int itemNameCheck(String name); // 아이템 이름 중복 체크 
	int itemWrite(ItemVo vo);		// 아이템 등록 
	List<ItemVo> itemSelectAll(ItemVo vo);	// 아이템 리스트 
	List<ItemVo> itemListCount(ItemVo vo);	// 아이템 인기상품순 리스트 
	List<ItemVo> itemListDesc(ItemVo vo);	// 아이템 가격 내림차순 리스트 
	List<ItemVo> itemListAsc(ItemVo vo);	// 아이템 가격 오름순 리스트 
	List<ItemVo> itemListNew(ItemVo vo);	// 아이템 신상품순 리스트 
	List<ItemVo> itemListNewLimit();	// 아이템 신상품순 리스트 Limit 5개
	List<ItemVo> itemApproval(ItemVo vo);	// 
	List<ItemVo> postPone(ItemVo vo); // 아이템 보류 리스트 
	
	List<ItemVo> subcategoryList11(ItemVo vo);
	
	int approvalCheck(int iidx);	//  아이템 승인하기 
	int postponeCheck(int iidx); // 아이템 보류하기 
	int itemDel(int iidx); // 아이템 삭제 
	
	List<ItemVo> basketList(int uidx); // 장바구니 리스트 
	int basketItemDel(ItemVo vo); // 장바구니 리스트 삭제 
	int basketItemAdd(ItemVo vo); //장바구니 리스트 추가 
	String basketListCheck(ItemVo vo); // 장바구니 리스트 중복 확인
	
	List<ItemVo> myItemList(int uidx); // 내 아이템 리스트
	int myItemAdd(ItemVo vo);		// 내 아이템 리스트 추가 
	String myItemListCheck(ItemVo vo); // 내 아이템 리스트 중복 확인 
//	List<ItemVo> itemListCate(int category); // 카테고리별 아이템 리스트 
	
	List<ItemVo> mostBuyItemList(); 
	int myItemListUpdate(ItemVo vo);
	
	int insertAmount(UserVo vo);
	
	int buyBasketList(ItemVo vo);
	int afterBuyBasketList(ItemVo vo);
}
