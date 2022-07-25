package pea.board.service;

import pea.board.vo.ItemVo;

public interface ItemService {
	
	int itemNameCheck(String name);
	int itemWrite(ItemVo vo);
}
