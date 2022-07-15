package pea.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "pea.board.mapper.UserMapper";
	
	public UserVo login(UserVo vo) {
		return sqlSession.selectOne(namespace+".login",vo);
	}
	
	public int idCheck(String id) {
		String checkId = sqlSession.selectOne(namespace+".idCheck",id);
		if(checkId==null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	public int insert(UserVo vo) {
		return sqlSession.insert(namespace+".insert",vo);
	}
	
	
	
	public String idExistCheck(UserVo vo) {
		String id = sqlSession.selectOne("pea.board.mapper.UserMapper.idExistCheck",vo);
		if(id == null) {
			return null;
		}else {
			return id;
		}
	}
	
	public int pwdExistCheck(UserVo vo) {
		String check = sqlSession.selectOne("pea.board.mapper.UserMapper.pwdExistCheck",vo);
		if(check == null) {
			return 0;
		}else {
			return Integer.parseInt(check);
		}
	}
	
	public int changePwd(UserVo vo) {
		return sqlSession.update("pea.board.mapper.UserMapper.changePwd",vo);
	}
	
	public UserVo userIdx(int uidx) {
		return sqlSession.selectOne("pea.board.mapper.UserMapper.userIdx",uidx);
	}
	
	public int pwdCheck(UserVo vo) {
		String check = sqlSession.selectOne(namespace+".pwdCheck",vo);
		if(check == null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	public int delId(int uidx) {
		return sqlSession.update(namespace+".delId",uidx);
	}
}
