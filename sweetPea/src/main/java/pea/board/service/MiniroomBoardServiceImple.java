package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.MiniroomBoardDao;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;

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

	@Override
	public int changeLeftBoard(MiniHomeVo vo) {
		return miniroomBoardDao.changeLeftBoard(vo);
	}

	@Override
	public List<MiniroomBoardVo> checkCategory(int uidx) {
		return miniroomBoardDao.checkCategory(uidx);
	}

}
