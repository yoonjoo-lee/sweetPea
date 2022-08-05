package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<MiniroomBoardVo> miniroomboardList(){
		return sqlSession.selectList(namespace+".miniroomboardList");
	}
	
	//날짜별 글 출력
	public List<MiniroomBoardVo> boardByDate(String date) {
		return sqlSession.selectList(namespace+".boardByDate", date);
	}

	//삭제
	public int deleteDiary(int mbidx) {
		return sqlSession.update(namespace+".deleteDiary", mbidx);
	}
	
	//수정
	public int modify(MiniroomBoardVo vo) {
		return sqlSession.update(namespace+".modify", vo);
	}
	
}
