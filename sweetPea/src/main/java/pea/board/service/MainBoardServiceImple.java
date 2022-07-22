package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pea.board.dao.MainBoardDao;
import pea.board.vo.MainBoardVo;
import pea.board.vo.MainCommentVo;
import pea.board.vo.MessageVo;
import pea.board.vo.ReportVo;
import pea.board.vo.SearchVo;
import pea.board.vo.UserVo;

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
	public MainBoardVo view(MainBoardVo vo) {
		return mainboardDao.view(vo);
	}

	@Override
	public int countBoard(int category) {
		return mainboardDao.countBoard(category);
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

	@Override
	public int writeReport(ReportVo vo) {
		return mainboardDao.writeReport(vo);
	}

	@Override
	public int withdrawal(ReportVo vo) {
		return mainboardDao.withdrawal(vo);
	}

	@Override
	public int warningtroll(MessageVo vo) {
		return mainboardDao.warningtroll(vo);
	}

	@Override
	public int reportstate(ReportVo vo) {
		return mainboardDao.reportstate(vo);
	}

	@Override
	public List<UserVo> selectAlluser() {
		return mainboardDao.selectAlluser();
	}

	@Override
	public List<UserVo> selectAlldeleteuser() {
		return mainboardDao.selectAlldeleteuser();
	}

}
