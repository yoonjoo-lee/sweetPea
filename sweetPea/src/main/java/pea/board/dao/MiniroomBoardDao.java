package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.MiniHomeVo;
import pea.board.vo.MiniroomBoardVo;

@Repository
public class MiniroomBoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "pea.board.mapper.MiniroomBoardMapper";
	
	public MiniHomeVo joinMiniHome(int uidx) {
		MiniHomeVo vo = sqlSession.selectOne(namespace+".joinMiniHome",uidx);
		if(vo == null) {
			sqlSession.insert(namespace+".insertMiniHome",uidx);
			sqlSession.insert(namespace+".firstBoard",uidx);
			sqlSession.insert(namespace+".firstSubCategory",uidx);
			
			return sqlSession.selectOne(namespace+".joinMiniHome",uidx);
		}else
		return vo;
	}
	
	public int changeHeader(MiniHomeVo vo) {
		return sqlSession.update(namespace+".changeHeader",vo);
	}
	
	public int changeLeftBoard(MiniHomeVo vo) {
		return sqlSession.update(namespace+".changeLeftBoard",vo);
	}
	
	public List<MiniroomBoardVo> checkCategory(int uidx){
		return sqlSession.selectList(namespace+".checkCategory",uidx);
	}
	
	public int delCategory(MiniroomBoardVo vo) {
		return sqlSession.update(namespace+".delCategory",vo);
	}
	
	public int plusCategory(MiniroomBoardVo vo) {
		return sqlSession.insert(namespace+".plusCategory",vo);
	}
	
	public int changeCategory(MiniroomBoardVo vo) {
		return sqlSession.update(namespace+".changeCategory", vo);
	}
}
