package pea.board.service;

import java.util.List;

import pea.board.vo.MiniroomBoardVo;

public interface MiniroomBoard2Service {

	int writemini(MiniroomBoardVo vo);
	List<MiniroomBoardVo> miniroomboardList();
	
	
	
}
