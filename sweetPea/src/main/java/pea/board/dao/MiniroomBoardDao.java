package pea.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.MiniHomeVo;

@Repository
public class MiniroomBoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "pea.board.mapper.MiniroomBoardMapper";
	
	public MiniHomeVo joinMiniHome(int uidx) {
		MiniHomeVo vo = sqlSession.selectOne(namespace+".joinMiniHome",uidx);
		if(vo == null) {
			sqlSession.insert(namespace+".insertMiniHome",uidx);
			return sqlSession.selectOne(namespace+".joinMiniHome",uidx);
		}else
		return vo;
	}
	
	public int changeHeader(MiniHomeVo vo) {
		return sqlSession.update(namespace+".changeHeader",vo);
	}
}
