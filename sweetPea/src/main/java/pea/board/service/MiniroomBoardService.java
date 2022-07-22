package pea.board.service;

import java.util.List;

import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;

public interface MiniroomBoardService {
	MiniHomeVo joinMiniHome(int uidx);
	int changeHeader(MiniHomeVo vo);
	int changeLeftBoard(MiniHomeVo vo);
	List<MiniroomBoardVo> checkCategory(int uidx);
}
