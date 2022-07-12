package pea.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.dao.UserDao;
import pea.board.vo.UserVo;

@Repository
public class UserServiceImple implements UserService{

	@Autowired
	UserDao userDao;
	
	@Override
	public UserVo login(UserVo vo) {
		return userDao.login(vo);
	}

	@Override
	public UserVo idCheck(UserVo vo) {
		return userDao.idCheck(vo);
	}

	@Override
	public int inserUser(UserVo vo) {
		int result = userDao.insert(vo);
		
		return result;
	}

	@Override
	public int idCheck2(String id) {
		return userDao.idCheck2(id);
	}

	@Override
	public String idExistCheck(UserVo vo) {
		return userDao.idExistCheck(vo);
	}

	@Override
	public int pwdExistCheck(UserVo vo) {
		return userDao.pwdExistCheck(vo);
	}

	@Override
	public int changePwd(UserVo vo) {
		return userDao.changePwd(vo);
	}

	@Override
	public UserVo userIdx(int uidx) {
		return userDao.userIdx(uidx);
	}

}
