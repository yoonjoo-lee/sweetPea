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
	public int idCheck(String id) {
		return userDao.idCheck(id);
	}
	
	@Override
	public int inserUser(UserVo vo) {
		int result = userDao.insert(vo);
		
		return result;
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

	@Override
	public int pwdCheck(UserVo vo) {
		return userDao.pwdCheck(vo);
	}

	@Override
	public int delId(int uidx) {
		return userDao.delId(uidx);
	}

}
