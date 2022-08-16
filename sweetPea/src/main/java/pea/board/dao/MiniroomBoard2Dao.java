package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.ItemVo;
import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;

@Repository
public class MiniroomBoard2Dao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "pea.board.mapper.MiniroomBoard2Mapper";
	
	//작성
	public int writemini(MiniroomBoardVo vo) {
		return sqlSession.insert(namespace+".writemini",vo);
	}
	
	//글 전부 출력
	public List<MiniroomBoardVo> miniroomboardList(MiniroomBoardVo vo){
		return sqlSession.selectList(namespace+".miniroomboardList", vo);
	}
	
	//날짜별 글 출력
	public List<MiniroomBoardVo> boardByDate(MiniroomBoardVo vo) {
		return sqlSession.selectList(namespace+".boardByDate", vo);
	}

	//삭제
	public int deleteDiary(int mbidx) {
		return sqlSession.update(namespace+".deleteDiary", mbidx);
	}
	
	//수정
	public int modify(MiniroomBoardVo vo) {
		return sqlSession.update(namespace+".modify", vo);
	}
	
	//프로필 변경
	public int changeProfile(MiniroomBoardVo vo) {
		return sqlSession.update(namespace+".changeProfile", vo);
	}
	
	//내 아이템 리스트 
	public List<ItemVo> myItemList(int uidx) {
		return sqlSession.selectList(namespace+".myItemList", uidx);
	}
	
	//미니홈피 배경 변경 
	public int changeBackground(MiniHomeVo vo) {
		return sqlSession.update(namespace+".changeBackground", vo);
	}
	
	
	//미니홈피 글꼴  변경 
	public int changeFont(MiniHomeVo vo) {
		return sqlSession.update(namespace+".changeFont", vo);
	}
	
	//미니룸에 캐릭터 추가 
	public int addTominiroom(ItemVo vo) {
		return sqlSession.update(namespace+".addTominiroom", vo);
	}
	
	//미니룸 위치 변경
	public int miniPosition(ItemVo vo) {
		return sqlSession.update(namespace+".miniPosition", vo);
	}
	
}
