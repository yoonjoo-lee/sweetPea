package pea.board.service;

import java.util.List;

import pea.board.vo.MainBoardVo;
import pea.board.vo.SearchVo;

public interface MainBoardService {

	int write(MainBoardVo vo); //게시물 작성
	List<MainBoardVo> list(SearchVo searchVo); //게시물 리스트 조회
	MainBoardVo view(int bidx); //각 게시물 조회 
	public int countBoard(); //게시물 총 갯수
}
