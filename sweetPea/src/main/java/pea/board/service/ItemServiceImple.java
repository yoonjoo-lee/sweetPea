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

}
