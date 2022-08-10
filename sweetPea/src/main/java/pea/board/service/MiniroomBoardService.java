package pea.board.service;

import java.util.List;

import pea.board.vo.FriendsVo;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.SearchVo;

public interface MiniroomBoardService {
	MiniHomeVo joinMiniHome(int uidx);
	int changeHeader(MiniHomeVo vo);
	int changeLeftBoard(MiniHomeVo vo);
	List<MiniroomBoardVo> checkCategory(int uidx);
	int delCategory(MiniroomBoardVo vo);
	int plusCategory(MiniroomBoardVo vo);
	int changeCategory(MiniroomBoardVo vo);
	int addFriends(FriendsVo vo);
	String checkFriends(FriendsVo vo);
	String friendsCheck(int uidx);
	List<FriendsVo> friendsCheckList(SearchVo vo);
	int friendsCheckList_count(int uidx);
	int acceptFriends(FriendsVo vo);
	int refuseFriends(FriendsVo vo);
	int friendsAcceptList_count(int uidx);
	List<FriendsVo> friendsAcceptList(SearchVo vo);
	int cancelFriends(FriendsVo vo);
	List<FriendsVo> friendsAllList(int uidx);
}
