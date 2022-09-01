package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.ItemDao;
import pea.board.vo.ItemVo;
import pea.board.vo.UserVo;

@Repository
public class ItemServiceImple implements ItemService {

	@Autowired
	ItemDao itemDao;

	@Override
	public int itemNameCheck(String name) {
		return itemDao.itemNameCheck(name);
	}

	@Override
	public int itemWrite(ItemVo vo) {
		return itemDao.itemWrite(vo);
	}

	@Override
	public List<ItemVo> itemSelectAll(ItemVo vo) {
		return itemDao.itemSelectAll(vo);
	}

	@Override
	public List<ItemVo> itemListDesc(ItemVo vo) {
		return itemDao.itemListDesc(vo);
	}

	@Override
	public List<ItemVo> itemListAsc(ItemVo vo) {
		return itemDao.itemListAsc(vo);
	}

	@Override
	public List<ItemVo> itemListNew(ItemVo vo) {
		return itemDao.itemListNew(vo);
	}

	@Override
	public List<ItemVo> itemListCount(ItemVo vo) {
		return itemDao.itemListCount(vo);
	}

	@Override
	public List<ItemVo> itemListNewLimit() {
		return itemDao.itemListNewLimit();
	}

	@Override
	public List<ItemVo> itemApproval(ItemVo vo) {
		return itemDao.itemApproval(vo);
	}

	@Override
	public List<ItemVo> postPone(ItemVo vo) {
		return itemDao.postpone(vo);
	}

	@Override
	public int approvalCheck(int iidx) {
		return itemDao.approvalCheck(iidx );
	}

	@Override
	public int postponeCheck(int iidx) {
		return itemDao.postponeCheck(iidx);
	}

	@Override
	public int itemDel(int iidx) {
		return itemDao.itemDel(iidx);
	}

	@Override
	public List<ItemVo> basketList(int uidx) {
		return itemDao.basket_selectAll(uidx);
	}

	@Override
	public int basketItemDel(ItemVo vo) {
		return itemDao.basketItemDel(vo);
	}

	@Override
	public int basketItemAdd(ItemVo vo) {
		return itemDao.basketItemAdd(vo);
	}

	@Override
	public String basketListCheck(ItemVo vo) {
		return itemDao.basketListCheck(vo);
	}

	@Override
	public List<ItemVo> myItemList(int uidx) {
		return itemDao.myItemList(uidx);
	}

	@Override
	public int myItemAdd(ItemVo vo) {
		return itemDao.myItemAdd(vo);
	}

	@Override
	public String myItemListCheck(ItemVo vo) {
		return itemDao.myItemListCheck(vo);
	}

	@Override
	public List<ItemVo> mostBuyItemList() {
		return itemDao.mostBuyItemList();
	}

	@Override
	public int myItemListUpdate(ItemVo vo) {
		return itemDao.myItemListUpdate(vo);
	}
/*
	@Override
	public List<ItemVo> itemListCate(int category) {
		return itemDao.itemListCate(category);
	}*/

	@Override
	public int insertAmount(UserVo vo) {
		return itemDao.insertAmount(vo);
	}

	@Override
	public int buyBasketList(ItemVo vo) {
		return itemDao.buyBasketList(vo);
	}
	
	@Override
	public int afterBuyBasketList(ItemVo vo) {
		return itemDao.afterBuyBasketList(vo);
	}
	
	@Override
	public int CheckNewItem() {
		return itemDao.CheckNewItem();
	}


}
