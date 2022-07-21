package pea.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.MiniroomBoardDao;
import pea.board.vo.MiniHomeVo;

@Repository
public class MiniroomBoardServiceImple implements MiniroomBoardService{
	
	@Autowired
	MiniroomBoardDao miniroomBoardDao;
	
	@Override
	public MiniHomeVo joinMiniHome(int uidx) {
		return miniroomBoardDao.joinMiniHome(uidx);
	}

	@Override
	public int changeHeader(MiniHomeVo vo) {
		return miniroomBoardDao.changeHeader(vo);
	}

}
