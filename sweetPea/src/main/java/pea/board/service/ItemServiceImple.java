package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.ItemDao;
import pea.board.vo.ItemVo;

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
	public List<ItemVo> itemSelectAll(int category) {
		return itemDao.itemSelectAll(category);
	}

	@Override
	public List<ItemVo> itemListDesc(int category) {
		return itemDao.itemListDesc(category);
	}

	@Override
	public List<ItemVo> itemListAsc(int category) {
		return itemDao.itemListAsc(category);
	}

	@Override
	public List<ItemVo> itemListNew(int category) {
		return itemDao.itemListNew(category);
	}

	@Override
	public List<ItemVo> itemListCount(int category) {
		return itemDao.itemListCount(category);
	}

	@Override
	public List<ItemVo> itemListNewLimit() {
		return itemDao.itemListNewLimit();
	}

	@Override
	public List<ItemVo> itemApproval(int category) {
		return itemDao.itemApproval(category);
	}

	@Override
	public List<ItemVo> postPone(int category) {
		return itemDao.postpone(category);
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



}
