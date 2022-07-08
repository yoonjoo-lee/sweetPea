package pea.board.service;

import java.util.List;

import pea.board.vo.MainBoardVo;
import pea.board.vo.SearchVo;

public interface MainBoardService {

	int write(MainBoardVo vo);
	List<MainBoardVo> list(SearchVo searchVo);
}
