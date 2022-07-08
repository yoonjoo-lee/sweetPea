package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.MainBoardVo;
import pea.board.vo.SearchVo;

@Repository
public class MainBoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public int write(MainBoardVo vo) {
		return sqlSession.insert("pea.board.mapper.MainBoardMapper.write", vo);
	}
	
	public List<MainBoardVo> selectAll(SearchVo searchVo) {
		return sqlSession.selectList("pea.board.mapper.MainBoardMapper.selectAll", searchVo);
	}
	
}
