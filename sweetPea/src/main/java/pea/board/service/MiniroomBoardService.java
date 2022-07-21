package pea.board.service;

import pea.board.vo.MiniHomeVo;

public interface MiniroomBoardService {
	MiniHomeVo joinMiniHome(int uidx);
	int changeHeader(MiniHomeVo vo);
}
