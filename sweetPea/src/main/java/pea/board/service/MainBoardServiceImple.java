package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pea.board.dao.MainBoardDao;
import pea.board.vo.MainBoardVo;
import pea.board.vo.MainCommentVo;
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

	@Override
	public MainBoardVo view(int bidx) {
		return mainboardDao.view(bidx);
	}

	@Override
	public int countBoard() {
		return mainboardDao.countBoard();
	}

	@Override
	public int modify(MainBoardVo vo) {
		return mainboardDao.modify(vo);
	}

	@Override
	public int delete(int bidx) {
		return mainboardDao.delete(bidx);
	}

	@Override
	public int writeReply(MainCommentVo vo) {
		return mainboardDao.writeReply(vo);
	}

	@Override
	public List<MainCommentVo> selectComment(MainCommentVo vo) {
		return mainboardDao.selectComment(vo);
	}

	@Override
	public int modifyReply(MainCommentVo vo) {
		return mainboardDao.modifyReply(vo);
	}

	@Override
	public int deleteReply(int cidx) {
		return mainboardDao.deleteReply(cidx);
	}

}
