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
	
	public int writemini(MiniroomBoardVo vo) {
		return sqlSession.insert(namespace+".writemini",vo);
	}
	
	public List<MiniroomBoardVo> miniroomboardList(){
		return sqlSession.selectList(namespace+".miniroomboardList");
	}
}
