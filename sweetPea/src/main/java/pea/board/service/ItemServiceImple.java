package pea.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.ItemDao;

@Repository
public class ItemServiceImple implements ItemService{
	
	@Autowired
	ItemDao itemDao;
	
	@Override
	public int itemNameCheck(String name) {
		// TODO Auto-generated method stub
		return itemDao.itemNameCheck(name);
	}

}
