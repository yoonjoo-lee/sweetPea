package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.MessageDao;
import pea.board.vo.MessageVo;
import pea.board.vo.PagingVo;
import pea.board.vo.SearchVo;

@Repository
public class MessageServiceImple implements MessageService{
	
	@Autowired
	MessageDao messageDao;
	
	@Override
	public int writeMessage(MessageVo vo) {
		return messageDao.writeMessage(vo);
	}

	@Override
	public int countMessage(PagingVo vo) {
		return messageDao.countMessage(vo);
	}

	@Override
	public List<MessageVo> selectAll(PagingVo vo) {
		return messageDao.selectAll(vo);
	}

	@Override
	public MessageVo content(int midx) {
		return messageDao.content(midx);
	}

	@Override
	public int viewCheck(int midx) {
		return messageDao.viewCheck(midx);
	}

	@Override
	public int delMsg(int midx) {
		return messageDao.delMsg(midx);
	}

	@Override
	public List<String> userCheck() {
		return messageDao.userCheck();
	}

	@Override
	public int newViewCheck(int uidx) {
		return messageDao.newViewCheck(uidx);
	}

	

}
