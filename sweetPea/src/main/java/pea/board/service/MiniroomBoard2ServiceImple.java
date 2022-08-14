package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import pea.board.dao.MiniroomBoard2Dao;
import pea.board.vo.ItemVo;
import pea.board.vo.MiniroomBoardVo;

@Service
public class MiniroomBoard2ServiceImple implements MiniroomBoard2Service{

	@Autowired
	MiniroomBoard2Dao miniroomboardDao;
	
	@Override
	public int writemini(MiniroomBoardVo vo) {
		return miniroomboardDao.writemini(vo);
	}

	@Override
	public List<MiniroomBoardVo> miniroomboardList(MiniroomBoardVo vo) {
		return miniroomboardDao.miniroomboardList(vo);
	}

	@Override
	public int deleteDiary(int mbidx) {
		return miniroomboardDao.deleteDiary(mbidx);
	}

	@Override
	public int modify(MiniroomBoardVo vo) {
		return miniroomboardDao.modify(vo);
	}

	@Override
	public List<MiniroomBoardVo> boardByDate(MiniroomBoardVo vo) {
		return miniroomboardDao.boardByDate(vo);
	}

	@Override
	public int changeProfile(MiniroomBoardVo vo) {
		return miniroomboardDao.changeProfile(vo);
	}

	@Override
	public List<ItemVo> myItemList(int uidx) {
		return miniroomboardDao.myItemList(uidx);
	}

}
