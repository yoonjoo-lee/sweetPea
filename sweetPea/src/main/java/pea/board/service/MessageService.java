package pea.board.service;

import java.util.List;

import pea.board.vo.MessageVo;
import pea.board.vo.SearchVo;

public interface MessageService {
	int writeMessage(MessageVo vo);
	int countMessage(int uidx);
	List<MessageVo> selectAll(SearchVo vo); 
	MessageVo content(int midx);
	int viewCheck(int midx);
}
