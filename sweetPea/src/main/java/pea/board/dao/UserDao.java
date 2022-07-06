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
}
