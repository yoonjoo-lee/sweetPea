package pea.board.service;

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

}
