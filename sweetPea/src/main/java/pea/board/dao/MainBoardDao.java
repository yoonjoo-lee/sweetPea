package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.MainBoardVo;
import pea.board.vo.MainCommentVo;
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
	
	public MainBoardVo view(int bidx) {
		return sqlSession.selectOne("pea.board.mapper.MainBoardMapper.view", bidx);
	}
	
	public int countBoard(int category) {
		return sqlSession.selectOne("pea.board.mapper.MainBoardMapper.countBoard", category);
	}
	
	public int modify(MainBoardVo vo) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.modify", vo);
	}
	
	public int delete(int bidx) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.delete", bidx);
	}
	
	public int writeReply(MainCommentVo vo) {
		return sqlSession.insert("pea.board.mapper.MainBoardMapper.writeReply", vo);
	}
	
	public List<MainCommentVo> selectComment(MainCommentVo vo){
		return sqlSession.selectList("pea.board.mapper.MainBoardMapper.selectComment",vo);
	}
	
	public int modifyReply(MainCommentVo vo) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.modifyReply", vo);
	}
	
	public int deleteReply(int cidx) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.deleteReply", cidx);
	}
}
