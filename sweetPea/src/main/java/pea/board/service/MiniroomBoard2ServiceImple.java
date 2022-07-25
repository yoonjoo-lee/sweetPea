package pea.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import pea.board.dao.MiniroomBoard2Dao;
import pea.board.vo.MiniroomBoardVo;

@Service
public class MiniroomBoard2ServiceImple implements MiniroomBoard2Service{

	@Autowired
	MiniroomBoard2Dao miniroomboardDao;
	
	@Override
	public int writemini(MiniroomBoardVo vo) {
		return miniroomboardDao.writemini(vo);
	}

}
