package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.ItemVo;
import pea.board.vo.UserVo;

@Repository
public class ItemDao {

	@Autowired
	SqlSession sqlSession;

	private static final String namespace = "pea.board.mapper.ItemMapper";

	// 아이템 이름 중복 체크
	public int itemNameCheck(String name) {
		String itemNameCheck = sqlSession.selectOne(namespace + ".itemNameCheck", name);
		System.out.println(itemNameCheck);
		if (itemNameCheck == null) {
			return 0;
		} else {
			return 1;
		}
	}
	

	// 아이템 등록
	public int itemWrite(ItemVo vo) {
		return sqlSession.insert(namespace + ".itemInsert", vo);
	}

	// 아이템 내림차순
	public List<ItemVo> itemSelectAll(int category) {

		return sqlSession.selectList(namespace + ".itemList", category);

	}

	// 아이템 인기상품순
	public List<ItemVo> itemListCount(int category) {

		return sqlSession.selectList(namespace + ".itemListCount", category);

	}

	// 아이템 가격 내림차순
	public List<ItemVo> itemListDesc(int category) {

		return sqlSession.selectList(namespace + ".itemListDesc", category);

	}

	// 아이템 가격 오름차순
	public List<ItemVo> itemListAsc(int category) {

		return sqlSession.selectList(namespace + ".itemListAsc", category);

	}

	// 아이템 신상품순
	public List<ItemVo> itemListNew(int category) {

		return sqlSession.selectList(namespace + ".itemListNew", category);

	}

	// 아이템 신상품순 Limit 5개
	public List<ItemVo> itemListNewLimit() {

		return sqlSession.selectList(namespace + ".itemListNewLimit");

	}

	// 아이템 보류 리스트
	public List<ItemVo> postpone(int category) {
		return sqlSession.selectList(namespace + ".postpone",category);
	}

	public int postponeCheck(int iidx) {
		return sqlSession.update(namespace + ".postponeCheck", iidx);
	}

	// 아이템 승인 리스트
	public List<ItemVo> itemApproval(int category) {
		return sqlSession.selectList(namespace + ".itemApproval",category);
	}

	public int approvalCheck(int iidx) {
		return sqlSession.update(namespace + ".approvalCheck", iidx);
	}

	// 아이템 지우기
	public int itemDel(int iidx) {

		return sqlSession.update(namespace+".itemDel", iidx);
	}

	public int itemBuy() {

		return sqlSession.update(namespace + ".itemBuy");
	}
	
	// 장바구니 리스트 
	public List<ItemVo> basket_selectAll(int uidx) {
		return sqlSession.selectList(namespace+".basket_selectAll", uidx);
	}
	// 장바구니 리스트 중복 확인 
	public String basketListCheck(ItemVo vo) {
		return sqlSession.selectOne(namespace+".basketListCheck", vo);
	}
	
	//장바구니 추가
	public int basketItemAdd(ItemVo vo) {
		
		return sqlSession.insert(namespace+".basketItemAdd",vo);
	}
	
	// 장바구니 삭제 
	public int basketItemDel(ItemVo vo) {
		
		return sqlSession.delete(namespace+".basketItemDel", vo);
	}
	
	// 내 아이템 리스트
	public List<ItemVo> myItemList(int uidx) {
		
		return sqlSession.selectList(namespace+".myItemList", uidx);
	}
	
	// 내 아이템 추가 
	public int myItemAdd(ItemVo vo) {
		
		sqlSession.insert(namespace+".myItemAdd", vo);
		sqlSession.update(namespace+".myAmount-",vo);
		return sqlSession.selectOne(namespace+".pea_amount",vo);
		
	}
	
	// 내 아이템 리스트 중복 확인 
	
	public String myItemListCheck(ItemVo vo) {
		return sqlSession.selectOne(namespace+".myItemListCheck", vo);
	}
	
	//
	public List<ItemVo> mostBuyItemList(){
	      return sqlSession.selectList(namespace+".mostBuyItemList");
	   }
	//
	public int myItemListUpdate(ItemVo vo) {
		sqlSession.update(namespace+".myItemListUpdate", vo);
		sqlSession.update(namespace+".myAmount-",vo);
		return sqlSession.selectOne(namespace+".pea_amount",vo);
		
	}
	//
	public int insertAmount(UserVo vo) {
		sqlSession.update(namespace+".insertAmount",vo);
		
		return sqlSession.selectOne(namespace+".pea_amount",vo);
	}
	
	
	public int buyBasketList(ItemVo vo) {
		return sqlSession.update(namespace+".buyBasketList",vo);
	}
	
	public int afterBuyBasketList(ItemVo vo) {
		sqlSession.update(namespace+".myAmount-",vo);
		return sqlSession.selectOne(namespace+".pea_amount",vo);
	}
	
	// 카테고리 별 리스트
/*	
	public List<ItemVo> itemListCate(int category){
		
		return sqlSession.selectList(namespace+".itemListCate",category);
	}*/
}
