package pea.board.service;

import java.util.List;

import pea.board.vo.MessageVo;
import pea.board.vo.PagingVo;
import pea.board.vo.SearchVo;

public interface MessageService {
	int writeMessage(MessageVo vo);
	int countMessage(PagingVo vo);
	List<MessageVo> selectAll(PagingVo vo); 
	MessageVo content(int midx);
	int viewCheck(int midx);
	int delMsg(int midx);
	List<String> userCheck();
	int newViewCheck(int uidx);
}
