package pea.board.service;

import java.util.List;

import pea.board.vo.ItemVo;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;

public interface MiniroomBoard2Service {

	int writemini(MiniroomBoardVo vo); //작성
	List<MiniroomBoardVo> miniroomboardList(MiniroomBoardVo vo); //글 전부 출력
	int deleteDiary(int mbidx); //삭제
	int modify(MiniroomBoardVo vo); //수정
	
	List<MiniroomBoardVo> boardByDate(MiniroomBoardVo vo); //날짜별 글 출력
	
	int changeProfile(MiniroomBoardVo vo); //프로필 변경
	
	List<ItemVo> myItemList(int uidx); //미니홈피 내 아이템 리스트 
	int changeBackground(MiniHomeVo vo); //미니홈피 배경 변경 
	int changeFont(MiniHomeVo vo); //미니홈피 글꼴 변경 
	int addTominiroom(ItemVo vo); //미니룸에 캐릭터 추가 
	int miniPosition(ItemVo vo); //미니룸 위치 저장
}
