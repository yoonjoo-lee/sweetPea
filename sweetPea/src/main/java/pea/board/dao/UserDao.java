package pea.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	SqlSession sqlSession;
	
	public UserVo login(UserVo vo) {
		return sqlSession.selectOne("pea.board.mapper.UserMapper.login",vo);
	}
	
	
	public UserVo idCheck(UserVo vo) {
		
		return sqlSession.selectOne("pea.board.mapper.UserMapper.idCheck",vo);
	}
	
	public int insert(UserVo vo) {
		
		int result = sqlSession.insert("pea.board.mapper.UserMapper.insert",vo);
		
		return result;
	}
	
	public int idCheck2(String id) {
		String checkId = sqlSession.selectOne("pea.board.mapper.UserMapper.idCheck2",id);
		if(checkId==null) {
			return 0;
		}else {
			return 1;
		}
		
	}
}
