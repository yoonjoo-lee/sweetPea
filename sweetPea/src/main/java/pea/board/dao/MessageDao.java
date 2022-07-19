package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.MessageVo;
import pea.board.vo.SearchVo;

@Repository
public class MessageDao {

	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "pea.board.mapper.MessageMapper";
	
	public int writeMessage(MessageVo vo) {
		return sqlSession.insert(namespace+".writeMessage",vo);
	}
	
	public int countMessage(int uidx) {
		return sqlSession.selectOne(namespace+".countMessage",uidx);
	}
	
	public List<MessageVo> selectAll(SearchVo vo) {
		return sqlSession.selectList(namespace+".selectAll",vo);
	}
	
	public MessageVo content(int midx) {
		return sqlSession.selectOne(namespace+".content",midx);
	}
	
	public int viewCheck(int midx) {
		return sqlSession.update(namespace+".viewCheck",midx);
	}
	
	public int delMsg(int midx) {
		return sqlSession.update(namespace+".delMsg",midx);
	}
}
