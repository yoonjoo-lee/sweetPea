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
	public List<ItemVo> itemSelectAll() {
		return itemDao.itemSelectAll();
	}

	@Override
	public List<ItemVo> itemListDesc() {
		return itemDao.itemListDesc();
	}

	@Override
	public List<ItemVo> itemListAsc() {
		return itemDao.itemListAsc();
	}

	@Override
	public List<ItemVo> itemListNew() {
		return itemDao.itemListNew();
	}

	@Override
	public List<ItemVo> itemListCount() {
		return itemDao.itemListCount();
	}

	@Override
	public List<ItemVo> itemListNewLimit() {
		return itemDao.itemListNewLimit();
	}

	@Override
	public List<ItemVo> itemApproval() {
		return itemDao.itemApproval();
	}

	@Override
	public List<ItemVo> postPone() {
		return itemDao.postpone();
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



}
