package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pea.board.dao.MainBoardDao;
import pea.board.vo.MainBoardVo;
import pea.board.vo.SearchVo;

@Service
public class MainBoardServiceImple implements MainBoardService{

	@Autowired
	MainBoardDao mainboardDao;
	
	@Override
	public int write(MainBoardVo vo) {
		return mainboardDao.write(vo);
	}

	@Override
	public List<MainBoardVo> list(SearchVo searchVo) {
		return mainboardDao.selectAll(searchVo);
	}

}
