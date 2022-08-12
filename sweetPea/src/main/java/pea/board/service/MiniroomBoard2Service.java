package pea.board.service;

import java.util.List;

import pea.board.vo.MiniroomBoardVo;

public interface MiniroomBoard2Service {

	int writemini(MiniroomBoardVo vo); //작성
	List<MiniroomBoardVo> miniroomboardList(MiniroomBoardVo vo); //글 전부 출력
	int deleteDiary(int mbidx); //삭제
	int modify(MiniroomBoardVo vo); //수정
	
	List<MiniroomBoardVo> boardByDate(MiniroomBoardVo vo); //날짜별 글 출력
	
	int changeProfile(MiniroomBoardVo vo); //프로필 변경

}
