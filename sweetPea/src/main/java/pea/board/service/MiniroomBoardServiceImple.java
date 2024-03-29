package pea.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.MiniroomBoardDao;
import pea.board.vo.FriendsVo;
import pea.board.vo.ItemVo;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;
import pea.board.vo.SearchVo;

@Repository
public class MiniroomBoardServiceImple implements MiniroomBoardService{
	
	@Autowired
	MiniroomBoardDao miniroomBoardDao;
	
	@Override
	public MiniHomeVo joinMiniHome(int uidx) {
		return miniroomBoardDao.joinMiniHome(uidx);
	}

	@Override
	public int changeHeader(MiniHomeVo vo) {
		return miniroomBoardDao.changeHeader(vo);
	}

	@Override
	public int changeLeftBoard(MiniHomeVo vo) {
		return miniroomBoardDao.changeLeftBoard(vo);
	}

	@Override
	public List<MiniroomBoardVo> checkCategory(int uidx) {
		return miniroomBoardDao.checkCategory(uidx);
	}

	@Override
	public int delCategory(MiniroomBoardVo vo) {
		return miniroomBoardDao.delCategory(vo);
	}

	@Override
	public int plusCategory(MiniroomBoardVo vo) {
		return miniroomBoardDao.plusCategory(vo);
	}

	@Override
	public int changeCategory(MiniroomBoardVo vo) {
		return miniroomBoardDao.changeCategory(vo);
	}

	@Override
	public int addFriends(FriendsVo vo) {
		return miniroomBoardDao.addFriends(vo);
	}

	@Override
	public String checkFriends(FriendsVo vo) {
		return miniroomBoardDao.checkFriends(vo);
	}
	
	@Override
	public String friendsCheck(int uidx) {
		return miniroomBoardDao.friendsCheck(uidx);
	}
	
	@Override
	public List<FriendsVo> friendsCheckList(SearchVo vo) {
		return miniroomBoardDao.friendsCheckList(vo);
	}

	@Override
	public int friendsCheckList_count(int uidx) {
		return miniroomBoardDao.friendsCheckList_count(uidx);
	}
	
	@Override
	public int acceptFriends(FriendsVo vo) {
		return miniroomBoardDao.acceptFriends(vo);
	}

	@Override
	public int refuseFriends(FriendsVo vo) {
		return miniroomBoardDao.refuseFriends(vo);
	}

	@Override
	public int friendsAcceptList_count(int uidx) {
		return miniroomBoardDao.friendsAcceptList_count(uidx);
	}
	
	@Override
	public List<FriendsVo> friendsAcceptList(SearchVo vo) {
		return miniroomBoardDao.friendsAcceptList(vo);
	}

	@Override
	public int cancelFriends(FriendsVo vo) {
		return miniroomBoardDao.cancelFriends(vo);
	}

	@Override
	public List<FriendsVo> friendsAllList(int uidx) {
		return miniroomBoardDao.friendsAllList(uidx);
	}

	@Override
	public int delFriends(FriendsVo vo) {
		return miniroomBoardDao.delFriends(vo);
	}
	
	@Override
	public int changeFriends(FriendsVo vo) {
		return miniroomBoardDao.changeFriends(vo);
	}
	
	@Override
	public List<FriendsVo> searchFriends(FriendsVo vo){
		return miniroomBoardDao.searchFriends(vo);
	}

	@Override
	public MiniHomeVo myMiniStyle(int uidx) {
		return miniroomBoardDao.myMiniStyle(uidx);
	}

	@Override
	public List<ItemVo> myMiniroom(int uidx) {
		return miniroomBoardDao.myMiniroom(uidx);
	}

	@Override
	public int visitMinihome(int uidx) {
		return miniroomBoardDao.visitMinihome(uidx);
	}

	@Override
	public int visitTotal(int uidx) {
		return miniroomBoardDao.visitTotal(uidx);
	}

	@Override
	public int visitToday(int uidx) {
		return miniroomBoardDao.visitToday(uidx);
	} 

}
